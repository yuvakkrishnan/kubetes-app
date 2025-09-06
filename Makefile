APP_NAME=kubetes
IMAGE=yuvakkrishnans/$(APP_NAME):latest

build:
	cd app && go build -o ../$(APP_NAME) main.go

docker-build:
	docker build -t $(IMAGE) .

docker-push:
	docker push $(IMAGE)
