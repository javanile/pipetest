
**Description**
Fails if piped output is not empty.


**Usage**
```shell
... | assert_empty [FAIL_MESSAGE] [SUCCESS_MESSAGE]
```


**Examples**

Checks for not-empty directory:
```shell 
ls | assert_empty "Current directory is not empty"
```

Checks for not-empty log file:
```shell
cat apache2.log | assert_empty "Log file is not empty"
```
