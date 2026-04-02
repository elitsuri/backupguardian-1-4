.PHONY: install run test lint docker-up docker-down clean

install:
	pip install -r backend/requirements.txt

run:
	cd backend && uvicorn main:app --reload --host 0.0.0.0 --port 8000

test:
	python -m pytest tests/ -v

lint:
	python -m flake8 backend/ --max-line-length=100
	python -m mypy backend/ --ignore-missing-imports

docker-up:
	docker compose up --build -d

docker-down:
	docker compose down

clean:
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null; true
	find . -name "*.pyc" -delete 2>/dev/null; true
