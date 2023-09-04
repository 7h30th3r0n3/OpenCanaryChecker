# OpenCanaryChecker
- OpenCanaryChecker is a script to parse useful information of opencanary logs
- Very useful to get realtime visual information
- Use ```watch -n 10 ./OpenCanaryChecker.sh ``` to get information every 10 seconds 

- This script uses geoiplookup and jq, please install it before any use
  ```sudo apt install geoip-bin jq ```

Made with love for fun by 7h30th3r0n3


Exemple (IP redacted) : 
```
Unique Usernames: 66
Unique Passwords: 786

Visited ports and how many times:
Port 21 : 8
Port 2222 : 2980
Port 3306 : 1
Port 443 : 16
Port 80 : 30
Total: 3035

27 IP Addresses:
118.193.XXX.XXX, 139.99.XXX.XXX, 140.143.XXX.XXX, 147.182.XXX.XXX, 147.182.XXX.XXX
15.235.XXX.XXX, 164.92.XXX.XXX, 167.172.XXX.XXX, 180.101.XXX.XXX, 180.101.XXX.XXX
185.224.XXX.XXX, 185.224.XXX.XXX, 188.171.XXX.XXX, 20.189.XXX.XXX, 3.139.XXX.XXX
34.140.XXX.XXX, 34.76.XXX.XXX, 34.78.XXX.XXX, 35.230.XXX.XXX, 37.166.XXX.XXX
43.163.XXX.XXX, 45.43.XXX.XXX, 59.2.XXX.XXX, 71.6.XXX.XXX, 77.1.XXX.XXX
82.156.XXX.XXX, 97.90.XXX.XXX

Top 5 attacking IPs :
180.101.XXX.XXX : 1386
43.163.XXX.XXX : 286
180.101.XXX.XXX : 238
82.156.XXX.XXX : 232
188.171.XXX.XXX : 124

Top 10 most used username and password pairs:
root:root = 8
root:P@ssw0rd = 7
test:test = 6
root:qwer1234 = 6
root:1234567890 = 6
root:111111 = 6
anonymous:anonymous@ = 6
admin:admin = 6
ubuntu:ubuntu = 5
root:password = 5

Last 10 login attempts:
On Port:2222 with Ip:180.101.XXX.XXX = root:root1234
On Port:2222 with Ip:180.101.XXX.XXX = root:123654
On Port:2222 with Ip:180.101.XXX.XXX = root:secret
On Port:2222 with Ip:180.101.XXX.XXX = root:huawei
On Port:2222 with Ip:180.101.XXX.XXX = root:1212
On Port:2222 with Ip:180.101.XXX.XXX = root:q1w2e3
On Port:2222 with Ip:180.101.XXX.XXX = root:tomcat
On Port:2222 with Ip:180.101.XXX.XXX = root:superman
On Port:2222 with Ip:180.101.XXX.XXX = root:aaaaaa
On Port:2222 with Ip:180.101.XXX.XXX = root:123456aa

Source Countries:
US : 11
CN : 5
DE : 2
HK : 2
NL : 2
ES : 1
FR : 1
JP : 1
KR : 1
SG : 1
```
