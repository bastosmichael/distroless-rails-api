#! /bin/bash

echo 'running container to export'
docker run -id ruby_release:latest
export DockerID=$(docker ps -q)
echo 'exporting image to tar'
docker export $DockerID > latest.tar
echo 'killing running container'
docker kill $DockerID
echo 'reset id variable'
DockerID=''
echo 'importing image'
#docker import --change "ENTRYPOINT [\"/bundle\", \"exec\", \"rails\", \"s\"]" latest.tar ruby_debug:flat
#docker import --change "ENTRYPOINT [\"/bin/sh\"]" latest.tar ruby_release:flat
docker import --change "ENTRYPOINT [\"/usr/local/bin/ruby\", \"/app/bin/rails\", \"server\", \"--binding\", \"0.0.0.0\", \"--port\", \"3000\"]" \
--change "WORKDIR /app" \
--change "ENV TERM=dumb" \
--change "ENV HOSTNAME=distroless_ruby" \
--change "ENV RUBY_DOWNLOAD_SHA256=d5d6da717fd48524596f9b78ac5a2eeb9691753da5c06923a6c31190abe01a62" \
--change "ENV RUBY_VERSION=2.6.5" \
--change "ENV PWD=/app" \
--change "ENV BUNDLE_APP_CONFIG=/usr/local/bundle" \
--change "ENV RUBY_MAJOR=2.6" \
--change "ENV HOME=/root" \
--change "ENV BUNDLE_SILENCE_ROOT_WARNING=1" \
--change "ENV GEM_HOME=/usr/local/bundle" \
--change "ENV SHLVL=1" \
--change "ENV BUNDLE_PATH=/usr/local/bundle" \
--change "ENV PATH=/usr/local/bundle/bin:/usr/local/bundle/gems/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" \
latest.tar ruby_release:flat
echo 'deleting image'
rm latest.tar