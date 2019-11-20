runtime:
	docker build -t ruby_runtime -f Dockerfile.runtime .

runtime_run:
	docker run -p 3000:3000 -it ruby_runtime

release:
	docker build -t ruby_release -f Dockerfile.release .

release_run:
	docker run -p 3000:3000 -it ruby_release

debug:
	docker build -t ruby_debug -f Dockerfile.debug .

debug_run:
	docker run -p 3000:3000 -it ruby_debug

distroless:
	docker build -t ruby_distroless -f Dockerfile.distroless .

distroless_run:
	docker run -it ruby_distroless

all: distroless runtime debug release