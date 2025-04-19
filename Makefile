setup:
	python3 -m venv .antenv
	. ./.antenv/bin/activate 

install:
	python3 -m pip install --upgrade pip && python3 -m pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203,bare-except --fail-under=6 app.py

all: install lint test
