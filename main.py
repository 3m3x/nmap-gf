import os
import subprocess


def nmap(request):
    request_json = request.get_json(silent=True)
    request_args = request.args
    args = ''

    if request_json and 'args' in request_json:
        args = request_json['args']
    elif request_args and 'args' in request_args:
        args = request_args['args']

    # Run nmap
    cmd = ['./nmap'] + args.split()
    out = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

    output = out.stdout.decode()

    return output + '\n'
