image:
	docker build -t shannon .

run_bash:
	docker run -it --rm shannon bash

run_jupyter:
	docker run --rm -it \
		-v `PWD`:/workspace \
		-p 10000:8888 \
		shannon \
		jupyter notebook --ip=0.0.0.0 --allow-root

tag:
	docker tag shannon generativist/shannon:latest
	docker push generativist/shannon:latest
