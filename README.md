# distroless-rails-api
Base Ruby on Rails API application packaged with a distroless docker container.


## Makefile build targets:

### runtime
Heavy upstream ruby container for development

### debug
First distroless stage with debug symbols enabled for busybox access to allow container inspection and testing.

### release
Final distroless stage with debug symbols disabled.

### distroless
Pure distroless runtime example for reference.