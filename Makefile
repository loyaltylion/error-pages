build:
	docker build -t loyaltylion/error-pages . \
		&& docker run -v "$$(pwd):/build" loyaltylion/error-pages scripts/build.sh
