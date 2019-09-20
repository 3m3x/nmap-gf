```python
def _get_runtime_info():
    pwd = os.getcwd()
    dir_listing = list(os.walk('./'))[0][2]
    pid = os.getuid()
    env = os.environ
    real_effective_saved = os.getresuid()

    return (
        f'ENV: {env}\nPWD: {pwd}\nDIR: {dir_listing}\nPID: {pid}\n'
        f'REAL, EFFECTIVE, SAVED user ids: {real_effective_saved}\n'
    )
```

Output:
```
PID: 0
REAL, EFFECTIVE, SAVED user ids: (0, 0, 0)
ENV: 
{
   "X_GOOGLE_CODE_LOCATION" : "/user_code",
   "X_GOOGLE_FUNCTION_TIMEOUT_SEC" : "60",
   "X_GOOGLE_FUNCTION_NAME" : "YOUR_PROJECT_NAME",
   "DEBIAN_FRONTEND" : "noninteractive",
   "X_GOOGLE_LOAD_ON_START" : "false",
   "PATH" : "/env/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
   "GCLOUD_PROJECT" : "YOUR_PROJECT_NAME",
   "LC_CTYPE" : "C.UTF-8",
   "HOME" : "/tmp",
   "FUNCTION_NAME" : "YOUR_FUNCTION_NAME",
   "FUNCTION_TRIGGER_TYPE" : "HTTP_TRIGGER",
   "X_GOOGLE_GCP_PROJECT" : "YOUR_PROJECT_NAME",
   "X_GOOGLE_SUPERVISOR_INTERNAL_PORT" : "8081",
   "SUPERVISOR_INTERNAL_PORT" : "8081",
   "GCP_PROJECT" : "tricho",
   "FUNCTION_TIMEOUT_SEC" : "60",
   "PWD" : "/user_code",
   "X_GOOGLE_WORKER_PORT" : "8091",
   "X_GOOGLE_FUNCTION_REGION" : "us-central1",
   "X_GOOGLE_FUNCTION_IDENTITY" : "YOUR_PROJECT_NAME@appspot.gserviceaccount.com",
   "X_GOOGLE_FUNCTION_TRIGGER_TYPE" : "HTTP_TRIGGER",
   "FUNCTION_REGION" : "us-central1",
   "X_GOOGLE_FUNCTION_MEMORY_MB" : "256",
   "X_GOOGLE_CONTAINER_LOGGING_ENABLED" : "false",
   "VIRTUAL_ENV" : "/env",
   "SUPERVISOR_HOSTNAME" : "169.254.8.129",
   "ENTRY_POINT" : "nmap",
   "X_GOOGLE_GCLOUD_PROJECT" : "YOUR_PROJECT_NAME",
   "FUNCTION_MEMORY_MB" : "256",
   "FUNCTION_IDENTITY" : "tricho@appspot.gserviceaccount.com",
   "PORT" : "8080",
   "X_GOOGLE_ENTRY_POINT" : "YOUR_FUNCTION_NAME",
   "X_GOOGLE_FUNCTION_VERSION" : "12",
   "WORKER_PORT" : "8091",
   "X_GOOGLE_SUPERVISOR_HOSTNAME" : "169.254.8.129",
   "CODE_LOCATION" : "/user_code",
   "NODE_ENV" : "production"
}
```
