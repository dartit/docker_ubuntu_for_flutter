CUR_DIR := $(shell pwd)

flutter-build-env:
	@docker build -t duanqz/flutter-build-env .

docker-run:
	@docker run -it \
	-v ${CUR_DIR}:/workspace \
	duanqz/flutter-build-env /bin/bash
