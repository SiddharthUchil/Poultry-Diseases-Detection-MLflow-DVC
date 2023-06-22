template:
	python template.py

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv main.py
# --cov=mylib test_*.py
format:
	black *.py mylib/*.py

lint:
	pylint --disable=R,C --ignore-patterns=test_.*?py *.py mylib/*.py

container-lint:
	docker run --rm -i hadolint/hadolint < Dockerfile

refactor: format lint

deploy:
	#deploy goes here

all: install lint test format deploy