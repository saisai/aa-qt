.PHONY: build install test test-integration typecheck package clean

build:
	poetry install

install:
	bash scripts/config-autostart.sh

test:
	python -c 'import aa_qt'

test-integration:
	python ./tests/integration_tests.py --no-modules

lint:
	poetry run flake8 aa_qt --ignore=E501,E302,E305,E231 --per-file-ignores="__init__.py:F401"

typecheck:
	poetry run mypy aa_qt --pretty

precommit:
	make typecheck
	make test
	make test-integration

package:
	pyinstaller --clean --noconfirm aa-qt.spec

clean:
	rm -rf build dist
	rm -rf __pycache__ aa_qt/__pycache__

#aa_qt/resources.py: aa_qt/resources.qrc
#	poetry run pyrcc5 -o aa_qt/resources.py aa_qt/resources.qrc
