# iperf3 server on OLCF's Slate 

https://docs.olcf.ornl.gov/services_and_applications/slate/overview.html#what-is-slate

# How to run the image

```
[sudo] docker run -it --rm --name=iperf3 -p 23232:23232 networkstatic/iperf3 -s -p 23232
```
