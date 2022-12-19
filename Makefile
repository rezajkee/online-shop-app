MANAGE := poetry run python manage.py

.PHONY: runserver
runserver:
	@$(MANAGE) runserver

.PHONY: plusrunserver
plusrunserver:
	@$(MANAGE) runserver_plus --cert-file cert.crt

.PHONY: makemigrations
makemigrations:
	@$(MANAGE) makemigrations

.PHONY: migrate
migrate:
	@$(MANAGE) migrate

.PHONY: collectstatic
collectstatic:
	@$(MANAGE) collectstatic

.PHONY: shell
shell:
	@$(MANAGE) shell_plus

.PHONY: install
install:
	poetry install

.PHONY: flake8
flake8:
	poetry run flake8 myshop

.PHONY: black-check
black-check:
	poetry run black --check myshop  
# poetry run black --check --exclude=migrations myshop (без настроек в pyproject)

.PHONY: black-diff
black-diff:
	poetry run black --diff myshop
# poetry run black --diff --exclude=migrations myshop  (без настроек в pyproject)

.PHONY: black
black:
	poetry run black myshop
# poetry run black --exclude=migrations myshop  (без настроек в pyproject)

.PHONY: isort-check
isort-check:
	poetry run isort myshop --check-only

.PHONY: isort-diff
isort-diff:
	poetry run isort myshop --diff

.PHONY: isort
isort:
	poetry run isort myshop

.PHONY: exportreq
exportreq:
	poetry export -f requirements.txt --output requirements.txt

.PHONY: makemessages
makemessages:
	poetry run django-admin makemessages --all

.PHONY: compilemessages
compilemessages:
	poetry run django-admin compilemessages --ignore .venv

.PHONY: test
test:
	poetry run pytest

.PHONY: test-coverage
test-coverage: # запись покрытия для CodeClimate
	poetry run pytest --cov=myshop --cov-report xml