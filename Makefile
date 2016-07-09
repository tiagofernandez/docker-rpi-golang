all: build

build:
	docker build -t tiagofernandez/rpi-golang:latest .

login:
	docker login

push:
	docker push tiagofernandez/rpi-golang
