[![](https://badge.imagelayers.io/uzyexe/serverspec:latest.svg)](https://imagelayers.io/?images=uzyexe/serverspec:latest 'Get your own badge on imagelayers.io')

# uzyexe/serverspec

With Serverspec, you can write RSpec tests for checking your servers are configured correctly.

## Dockerfile

[**Trusted Build**](https://hub.docker.com/r/uzyexe/serverspec/)

This Docker image is based on the [ruby:2.3.1-alpine](https://hub.docker.com/_/ruby/) base image.

## Using

```
# tree /sample_spec

/sample_spec
├── Rakefile
└── spec
    ├── localhost
    │   └── sample_spec.rb
    └── spec_helper.rb
```

### docker run

```
SPEC_DIR=/sample_spec
docker run --rm -v "${SPEC_DIR}:/serverspec:ro" uzyexe/serverspec rake -T
docker run --rm -v "${SPEC_DIR}:/serverspec:ro" uzyexe/serverspec rake <option>
```

--

## serverspec

[Getting started](http://serverspec.org/)

# Authors

* Shuji Yamada (<uzy.exe@gmail.com>)

## License

This project is licensed under the terms of the MIT license.
