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
$ grep -C1 -v Up att.log 
2023-08-02 10:07:33 Up
2023-08-02 10:07:44  Down
2023-08-02 10:07:55  Down
2023-08-02 10:08:05  Down
2023-08-02 10:08:18 Up
--
2023-08-02 14:43:30 Up
2023-08-02 14:43:41  Down
2023-08-02 14:43:52  Down
2023-08-02 14:44:03  Down
2023-08-02 14:44:13  Down
2023-08-02 14:44:24  Down
2023-08-02 14:44:35  Down
2023-08-02 14:44:46  Down
2023-08-02 14:44:57  Down
2023-08-02 14:45:07  Down
2023-08-02 14:45:18  Down
2023-08-02 14:45:29  Down
2023-08-02 14:45:40  Down
2023-08-02 14:45:51  Down
2023-08-02 14:46:01  Down
2023-08-02 14:46:12  Down
2023-08-02 14:46:23  Down
2023-08-02 14:46:35  Down
2023-08-02 14:46:46  Down
2023-08-02 14:46:57  Down
2023-08-02 14:47:07  Down
2023-08-02 14:47:18  Down
2023-08-02 14:47:29  Down
2023-08-02 14:47:39  Down
2023-08-02 14:47:50  Down
2023-08-02 14:48:01  Down
2023-08-02 14:48:12  Down
2023-08-02 14:48:23  Down
2023-08-02 14:48:34  Down
2023-08-02 14:48:44  Down
2023-08-02 14:48:55  Down
2023-08-02 14:49:06  Down
2023-08-02 14:49:17  Down
2023-08-02 14:49:27  Down
2023-08-02 14:49:38  Down
2023-08-02 14:49:49  Down
2023-08-02 14:50:00  Down
2023-08-02 14:50:11  Down
2023-08-02 14:50:22  Down
2023-08-02 14:50:32  Down
2023-08-02 14:50:43  Down
2023-08-02 14:50:54  Down
2023-08-02 14:51:05  Down
2023-08-02 14:51:16  Down
2023-08-02 14:51:26  Down
2023-08-02 14:51:37  Down
2023-08-02 14:51:48  Down
2023-08-02 14:51:59  Down
2023-08-02 14:52:10  Down
2023-08-02 14:52:20  Down
2023-08-02 14:52:31  Down
2023-08-02 14:52:42  Down
2023-08-02 14:52:53  Down
2023-08-02 14:53:03  Down
2023-08-02 14:53:14  Down
2023-08-02 14:53:25  Down
2023-08-02 14:53:36  Down
2023-08-02 14:53:46  Down
2023-08-02 14:53:57  Down
2023-08-02 14:54:08  Down
2023-08-02 14:54:19  Down
2023-08-02 14:54:30  Down
2023-08-02 14:54:40  Down
2023-08-02 14:54:51  No IP Address
2023-08-02 14:55:02 Up
--
2023-08-02 16:18:12 Up
2023-08-02 16:20:27 No Reply: Router Down!
2023-08-02 16:20:38 Up
--
2023-08-03 18:04:04 Up
2023-08-03 18:04:12 No Reply: Router Down!
2023-08-03 18:04:20 No Reply: Router Down!
2023-08-03 18:04:28 No Reply: Router Down!
2023-08-03 18:04:36 No Reply: Router Down!
2023-08-03 18:04:44 No Reply: Router Down!
2023-08-03 18:04:52 No Reply: Router Down!
2023-08-03 18:05:00 No Reply: Router Down!
2023-08-03 18:05:08 No Reply: Router Down!
2023-08-03 18:05:16 No Reply: Router Down!
2023-08-03 18:05:25 No Reply: Router Down!
2023-08-03 18:05:36  Down
2023-08-03 18:05:47  No IP Address
2023-08-03 18:05:59  No IP Address
2023-08-03 18:06:09  No IP Address
2023-08-03 18:06:23 Up
--
2023-08-04 00:43:42 Up
2023-08-04 00:45:57 No Reply: Router Down!
2023-08-04 00:46:07 Up
--
2023-08-04 09:51:21 Up
2023-08-04 09:53:37 No Reply: Router Down!
2023-08-04 09:53:48 Up

```

