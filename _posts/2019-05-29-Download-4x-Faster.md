# Axel

Do you ever need to download a big ISO and your browser is taking forever?
[Axel](https://github.com/axel-download-accelerator/axel) is a command line
file downloader I've used for years but isn't as well known as it deserves to be.

Axel is interchangable with `wget` but splits downloads into multiple parallel connections. 
It defaults to 4, which I've found to generally be the sweet spot.


```bash
$ axel http://cdimage.ubuntu.com/ubuntu-budgie/releases/19.04/release/ubuntu-budgie-19.04-desktop-amd64.iso
```

![Axel](/assets/img/axel.png){:width="100%"}


Give it a try on your next Linux ISO download.  It's available in brew, and presumably every linux package manager.
