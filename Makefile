.PHONY: run install test clean

run:
	streamlit run app.py

install:
	pip install -r requirements.txt

test:
	pytest tests/

clean:
	rm -rf __pycache__
	rm -rf .pytest_cache
	rm -rf htmlcov
	find . -type d -name "__pycache__" -exec rm -rf {} +
