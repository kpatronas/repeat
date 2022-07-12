# repeat
Repeat a command until success with some additional tricks!

## Examples

### Minimal working example

Without any parameters the command will execute until its exit code is equal to zero. 

```
$ repeat.sh -c """ command """
```

### Execute the failed command every some seconds until the exit code is equal to zero.

-d parameter defines the wait period to the next execution.

```
$ repeat.sh -c """ command """ -d 5
```

### Execute the failed command until exit code is equal to five.

-e parameter defines the expected exit code, if ommited the expected exit code is zero.

```
$ repeat.sh -c """ command """ -d 5 -e 5
```

### Execute the failed command until exit code is equal to zero or if the failed executions are equal to three.

-r parameter defines the number of maximum failed executions before exit, if ommited will execute until sucessful execution.

```
$ repeat.sh -c """ command """ -d 5 -r 3
```

### Execute a command and execute another command in case of failure or success.

-f and -s parameters define what commands to be executed in case of failure or success.

```
$ repeat.sh -c """ command """ -f """ echo "failed execution" """ -s """ echo "successful execution" """
```
