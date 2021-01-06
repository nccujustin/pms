appName=
mv= # migrate version
v=
projectName=pms
image=

echo:
	@echo "benn"
dev:
	@echo "============================================= \n\n\n => if run in code-server will start at http://code-server.wuhsun.com:8443 \n\n\n\n => if run in local computer will start at http://127.0.0.1:8000/ \n\n\n============================================= " && python manage.py runserver
createApp:
	@python manage.py startapp ${appName}

makemigrations-dry-run:
	@python manage.py makemigrations ${appName} --dry-run

makemigrations:
	@python manage.py makemigrations ${appName}

migrations-dry-run:
	python manage.py migrate ${appName} ${mv} --fake
	
migrations:
	@python manage.py migrate ${appName} ${mv}
build-image:
	@docker build -t ${projectName}:${v} .
run-image:
	@docker run -idt -p 3000:8000 ${projectName}:${v}
delete-and-run-image:
	@make build-image -e v=${v} && docker stop ${image} && make run-image -e v=${v}

.PHONY: echo dev createApp makemigrations migrations