# uzyexe/serverspec

With Serverspec, you can write RSpec tests for checking your servers are configured correctly.

## Dockerfile

[**Trusted Build**](https://registry.hub.docker.com/u/uzyexe/serverspec/)

This Docker image is based on the [ruby:2.2.2-slim](https://registry.hub.docker.com/_/ruby/) base image.

## Using

### docker run

    docker run -it --volume="/root/.ssh/:/root/.ssh:ro" --volume="/serverspec:/serverspec:ro" uzyexe/serverspec:latest rake -T
    docker run -it --volume="/root/.ssh/:/root/.ssh:ro" --volume="/serverspec:/serverspec:ro" uzyexe/serverspec:latest rake <option>

--

## serverspec

[Getting started](http://serverspec.org/)
