```
License: MIT
Author:  Juhapekka Piiroinen <jp@1337.fi>

Copyright 2019 Juhapekka Piiroinen <jp@1337.fi>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
# Mother of All Passwords
You can use this tool to change and maintain a server farm with passwords which needs to be changed on daily/weekly/monthly basis.

This will automatically create and change the passwords and keeps them in LastPass.

## Installation
1) Checkout the code.
2) Create .account_name file with the LastPass account name.
3) Create .account_password file with the LastPass master password.
4) Ensure that the file permissions are strict enough for the files above.
5) Add following to crontab:
```
@midnight   export SERVER_NAME=group-or-hostname;CHANGE_THIS_PATH_TO_SCRIPTS/cronjob USERNAME
```
6) Ensure that you have the machine root user passwords defined in LastPass.
```
$ SERVER_NAME=group-or-hostname ACCOUNT_NAME=root SERVER_USERNAME=someuser_with_sudo SERVER_PASSWORD=login_password make add
$ SERVER_NAME=group-or-hostname ACCOUNT_NAME=some-other-accountname SERVER_USERNAME=some-other-username SERVER_PASSWORD=login_password make add
```
The ACCOUNT_NAME contains the name which is used to store the data in the LastPass, the SERVER_USERNAME and SERVER_PASSWORD are values which will be stored within that item.

The script looks for the ACCOUNT_NAME=root which will be used to read the username and password of a sudo account, which is used to change the password for some account.

The group-or-hostname must match either a group or a hostname in the inventory.


## Security notice
DO NOT EXECUTE THIS ON ANY MACHINE WHICH IS OPEN TO INTERNET OR IS IN SHARED USE.

