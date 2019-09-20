# Get it goin

Run the deployment initialisation script to create a project and bucket for the
code to live in:

`$ ./deploy-init.sh`

Then deploy the function:

`$ gcloud functions deploy nmap --runtime python37 --trigger-http`

Take note of the httpsTrigger URL because that's the endpoint you'll send scan
requests to. 

If you miss it then look it up with `gcloud functions describe`.

# Wut it do
```bash
$ curl -X POST "https://us-central1-YOUR_PROJECT.cloudfunctions.net/nmap" -H "Content-Type: application/json" --data '{"args": "-sT --top-ports 1000 -Pn -vv -O webscantest.com"}'

Starting Nmap 7.60 ( https://nmap.org ) at 2019-09-20 08:52 UTC
Initiating Parallel DNS resolution of 1 host. at 08:52
Completed Parallel DNS resolution of 1 host. at 08:52, 0.00s elapsed
DNS resolution of 1 IPs took 0.07s. Mode: Async [#: 1, OK: 1, NX: 0, DR: 0, SF: 0, TR: 1, CN: 0]
Initiating Connect Scan at 08:52
Scanning webscantest.com (69.164.223.208) [1000 ports]
Discovered open port 443/tcp on 69.164.223.208
Discovered open port 80/tcp on 69.164.223.208
Discovered open port 8086/tcp on 69.164.223.208
Discovered open port 8081/tcp on 69.164.223.208
Discovered open port 8082/tcp on 69.164.223.208
Completed Connect Scan at 08:52, 2.99s elapsed (1000 total ports)
Nmap scan report for webscantest.com (69.164.223.208)
Host is up, received user-set (0.029s latency).
rDNS record for 69.164.223.208: nb-69-164-223-208.newark.nodebalancer.linode.com
Scanned at 2019-09-20 08:52:26 UTC for 3s
Not shown: 994 closed ports
Reason: 994 conn-refused
PORT     STATE    SERVICE         REASON
25/tcp   filtered smtp            no-response
80/tcp   open     http            syn-ack
443/tcp  open     https           syn-ack
8081/tcp open     blackice-icecap syn-ack
8082/tcp open     blackice-alerts syn-ack
8086/tcp open     d-s-n           syn-ack

Read data files from: /user_code
Nmap done: 1 IP address (1 host up) scanned in 3.99 seconds
```

# Notes
* Nmap functionality requiring root priv doesn't work due to restrictions in the
    container :(
  * OS detection `-O`
  * Syn scan `-sS`
  * probably others

# TODO
- [ ] get the directories (e.g. nselib, scripts) uploaded properly
  * hint: they're zipped up but Google's provisioning step doesn't seem to
      include them
- [ ] Dump logs in scan-specific bucket
