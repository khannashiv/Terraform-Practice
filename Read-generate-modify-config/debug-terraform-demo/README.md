
**Commands to set environment variables in case of windows/Linux/Mac OS in order to set debugging for current running cmd/terminal (on temporary basis)**

**For Linux/Mac OS**
- export TF_LOG=TRACE
- export TF_LOG=DEBUG
- export TF_LOG=INFO
- printenv | grep TF_LOG
- export TF_LOG_PATH=/path/to/log/file.log
    - for example:  export TF_LOG_PATH=output_trace_level_logs.txt

**For Windows**
- set TF_LOG=TRACE
- set TF_LOG=DEBUG
- set TF_LOG=INFO
- set | find "VARIABLE_NAME" for example : TF_LOG
- set TF_LOG_PATH=C:\path\to\log\file.log

**Further to store logs in a file**
- Step1 : Set the level of verbosity that you need say : TF_LOG=TRACE using cmd / terminal. 
- Step2 : Then set the TF_LOG_PATH to the desired log file path.
- Step3 : Run your Terraform commands ( for example: you have run terraform plan first >> followed by terraform apply >> entire execution of terraform commands will be stored in the same file & terminal will not provide trace level logs rather we can view trace level logs captured inside the same file) and the logs will be written to the specified file.