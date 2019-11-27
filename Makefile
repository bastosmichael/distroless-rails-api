runtime:
	docker build -t ruby_runtime -f Dockerfile.runtime .
	docker run -v "$(pwd)":/code brakeman --color
	trivy ruby_runtime:latest --clear-cache

runtime_run:
	docker run -p 3001:3000 -it ruby_runtime

release:
	docker build -t ruby_release -f Dockerfile.release .

release_run:
	docker run -p 3000:3000 -it ruby_release

flatten:
	./flatten.sh

debug:
	docker build -t ruby_debug -f Dockerfile.debug .
	trivy ruby_debug:latest --clear-cache

debug_run:
	docker run -p 3000:3000 -it ruby_debug --entrypoint=sh
	#docker run -p 3000:3000 -it ruby_debug

distroless:
	docker build -t ruby_distroless -f Dockerfile.distroless .

distroless_run:
	docker run -it ruby_distroless

all: distroless runtime debug release