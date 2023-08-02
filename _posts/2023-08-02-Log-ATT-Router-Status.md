![AT&T](/assets/img/att.png){:width="100%"}

AT&T Fiber was recently made available in my area, but my experience has been quite poor. The broadband connection goes down at least twice a day. I wrote a couple scripts to help document the problem.

I run these on a Raspberry Pi Zero 2 W.  Each one is in a `screen` session.


### Generic Internet Connectivity Logger:

```shell
#!/bin/sh
# Test Internet Connection and log to ~/internet.log

while true ; do

  detection_out=$(wget -q http://detectportal.firefox.com/success.txt --timeout=10 -O - 2> /dev/null)

  if test "$detection_out" = "success" ; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') online" >> ~/internet.log
  else
    echo "$(date +'%Y-%m-%d %H:%M:%S') OFFLINE" >> ~/internet.log
  fi

  sleep 10
done
```

### Check the results
```
$ grep -C1 OFFLINE internet.log
2023-07-31 12:15:42 online
2023-07-31 12:15:58 OFFLINE
2023-07-31 12:16:14 OFFLINE
2023-07-31 12:16:30 OFFLINE
2023-07-31 12:16:47 OFFLINE
2023-07-31 12:17:03 OFFLINE
2023-07-31 12:17:13 OFFLINE
2023-07-31 12:17:23 OFFLINE
2023-07-31 12:17:33 OFFLINE
2023-07-31 12:17:43 OFFLINE
2023-07-31 12:17:53 online
--
2023-07-31 23:34:27 online
2023-07-31 23:34:43 OFFLINE
2023-07-31 23:34:59 OFFLINE
2023-07-31 23:35:15 OFFLINE
2023-07-31 23:35:32 OFFLINE
2023-07-31 23:35:48 OFFLINE
2023-07-31 23:35:58 OFFLINE
2023-07-31 23:36:08 online
--
2023-08-01 02:12:12 online
2023-08-01 02:12:32 OFFLINE
2023-08-01 02:12:42 online
--
2023-08-01 09:56:39 online
2023-08-01 09:56:55 OFFLINE
2023-08-01 09:57:11 OFFLINE
2023-08-01 09:57:28 OFFLINE
2023-08-01 09:57:44 OFFLINE
2023-08-01 09:58:00 OFFLINE
2023-08-01 09:58:10 OFFLINE
2023-08-01 09:58:20 OFFLINE
2023-08-01 09:58:30 OFFLINE
2023-08-01 09:58:40 online
--
2023-08-02 10:07:20 online
2023-08-02 10:07:40 OFFLINE
2023-08-02 10:07:53 OFFLINE
2023-08-02 10:08:13 OFFLINE
2023-08-02 10:08:23 online
```



### AT&T Specific Broadband Status Logger:

```shell
#!/bin/sh
# Log Broadband status reported by the ATT router and log to ~/att.log

while true ; do

  att=$(wget -q http://192.168.1.254 -O - | grep -A5 "Broadband Connection" | grep "status-value" | awk -F\> '{print $NF}')

  echo "$(date +'%Y-%m-%d %H:%M:%S') ${att:-No Reply: Router Down!}" >> ~/att.log

  sleep 5
done
```

### Check the results
```
$ tail att.log 
2023-08-02 10:06:47 Up
2023-08-02 10:06:57 Up
2023-08-02 10:07:08 Up
2023-08-02 10:07:19 Up
2023-08-02 10:07:33 Up
2023-08-02 10:07:44  Down
2023-08-02 10:07:55  Down
2023-08-02 10:08:05  Down
2023-08-02 10:08:18 Up
2023-08-02 10:08:28 Up
```

