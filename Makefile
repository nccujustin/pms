appName=
mv= # migrate version

echo:
	@echo "benn"
dev:
	@echo "============================================= \n\n\n => start at http://code-server.wuhsun.com:8443 \n\n => don't open http://127.0.0.1:8000/ \n\n\n============================================= " && python manage.py runserver
createApp:
	@python manage.py startapp ${appName}

makemigrations--dry-run:
	@python manage.py makemigrations ${appName} --dry-run

makemigrations:
	@python manage.py makemigrations ${appName}

migrations-dry-run:
	python manage.py migrate ${appName} ${mv} --fake
	
migrations:
	@python manage.py migrate ${appName} ${mv}

.PHONY: echo dev createApp makemigrations migrations