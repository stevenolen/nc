# stevenolen/nc

A docker image for netcat. Built on alpine (for the smallz) but also has proper dns support (for the kubernetes).

## Usage

    $ docker run --rm -t stevenolen/nc -vz example.com 80   # also available from ghcr.io/stevenolen/nc
    Connection to example.com 80 port [tcp/http] succeeded!

## Extra Credit: A kubernetes reverse proxy.

### Spec

    apiVersion: v1
    kind: Pod
    metadata:
      name: example-com-proxy
      namespace: default
    spec:
    restartPolicy: Never
    terminationGracePeriodSeconds: 5
    containers:
      - name: proxy
        image: stevenolen/nc
        imagePullPolicy: Always
        command: ['/bin/sh']
        args:
          - "-c"
          - "mkfifo /tmp/fifo && nc -kl 8888 < /tmp/fifo | nc example.com 80 > /tmp/fifo"

### Make requests ✨

    $ kubectl port-foward example-pod-proxy 8888:8888 &
    $ curl localhost:8888  # example.com content returned. hey! please be kind and don't actually use example.com.
