[![](https://badge.imagelayers.io/uzyexe/serverspec:latest.svg)](https://imagelayers.io/?images=uzyexe/serverspec:latest 'Get your own badge on imagelayers.io')

# uzyexe/serverspec [![Circle CI](https://circleci.com/gh/uzyexe/dockerfile-serverspec.svg?style=svg)](https://circleci.com/gh/uzyexe/dockerfile-serverspec)

With Serverspec, you can write RSpec tests for checking your servers are configured correctly.

## Dockerfile

[**Trusted Build**](https://hub.docker.com/r/uzyexe/serverspec/)

This Docker image is based on the [ruby:2.3.1-alpine](https://hub.docker.com/_/ruby/) base image.

## Using

### Quick Start

```
docker run --rm -v "${YOUR_SPEC_DIR}:/serverspec:ro" uzyexe/serverspec rake -T
docker run --rm -v "${YOUR_SPEC_DIR}:/serverspec:ro" uzyexe/serverspec rake <option>
```

### Tutorial

1. Create your serverspec directory.

```
# mkdir <your_serverspec_dir>
```

2. Initialized serverspec directory.

```
# docker run --rm -v $PWD:/serverspec:rw uzyexe/serverspec serverspec-init
Select OS type:

  1) UN*X
  2) Windows

Select number:
Select a backend type:

  1) WinRM
  2) Cmd (local)

Select number:
 + spec/
 + spec/localhost/
 + spec/localhost/sample_spec.rb
 + spec/spec_helper.rb
 + Rakefile
 + .rspec

2 directories, 3 files
```

3. The following file is generated...

```
# tree .
.
├── Rakefile
└── spec
    ├── localhost
    │   └── sample_spec.rb
    └── spec_helper.rb
```

4. Display the task list defined in the Rakefile.

```
# docker run --rm -v $PWD:/serverspec:ro uzyexe/serverspec rake -T
rake spec:localhost  # Run serverspec tests to localhost
```

5. Run serverspec tests to localhost.

```
# docker run --rm -v $PWD:/serverspec:ro uzyexe/serverspec rake spec:localhost

Port "80"
  should be listening (FAILED - 1)

Failures:

  1) Port "80" should be listening
     On host `localhost'
     Failure/Error: it { should be_listening }
     Errno::ENOENT:
       No such file or directory - /cygdrive/powershell

     # /usr/local/bundle/gems/specinfra-2.66.0/lib/specinfra/backend/cmd.rb:33:in `execute_script'
     # /usr/local/bundle/gems/specinfra-2.66.0/lib/specinfra/backend/cmd.rb:21:in `run_command'
     # /usr/local/bundle/gems/specinfra-2.66.0/lib/specinfra/runner.rb:27:in `run'
     # /usr/local/bundle/gems/specinfra-2.66.0/lib/specinfra/runner.rb:19:in `method_missing'
     # /usr/local/bundle/gems/serverspec-2.37.2/lib/serverspec/type/port.rb:33:in `listening?'
     # /usr/local/bundle/gems/serverspec-2.37.2/lib/serverspec/matcher/be_listening.rb:3:in `block (2 levels) in <top (required)>'
     # ./spec/localhost/sample_spec.rb:27:in `block (2 levels) in <top (required)>'

Finished in 0.01757 seconds (files took 0.57997 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/localhost/sample_spec.rb:27 # Port "80" should be listening
```

--

## serverspec

[Getting started](http://serverspec.org/)

# Authors

* Shuji Yamada (<uzy.exe@gmail.com>)

## License

This project is licensed under the terms of the MIT license.
