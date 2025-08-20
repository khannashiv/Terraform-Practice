
**Commands to set environment variables in case of windows/Linux/Mac OS in order to set debugging for current running cmd/terminal**

**For Linux/Mac OS**
- export TF_LOG=TRACE
- export TF_LOG=DEBUG
- export TF_LOG=INFO
- printenv | grep TF_LOG

**For Windows**
- set TF_LOG=TRACE
- set TF_LOG=DEBUG
- set TF_LOG=INFO
- set | find "VARIABLE_NAME" for example : TF_LOG

