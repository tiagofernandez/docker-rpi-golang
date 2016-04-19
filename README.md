# rpi-golang

Docker image containing Go 1.6.1 binaries compatible with the Raspberry Pi.

### Example: Run and attach the Docker image with a volume mount
```bash
docker run -ti -v /data/docker/go:/data apicht/rpi-golang
```

### Example: Reference this image from another Dockerfile to run a Go-dependent application
```Dockerfile
FROM apicht/rpi-golang:latest
RUN go get github.com/golang/example/hello
CMD ["hello"]
```
