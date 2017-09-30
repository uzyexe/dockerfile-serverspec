[![](https://badge.imagelayers.io/uzyexe/serverspec:latest.svg)](https://imagelayers.io/?images=uzyexe/serverspec:latest 'Get your own badge on imagelayers.io')

# uzyexe/serverspec [![Circle CI](https://circleci.com/gh/uzyexe/dockerfile-serverspec.svg?style=svg)](https://circleci.com/gh/uzyexe/dockerfile-serverspec)

With Serverspec, you can write RSpec tests for checking your servers are configured correctly.

## Dockerfile

[**Trusted Build**](https://hub.docker.com/r/uzyexe/serverspec/)

This Docker image is based on the [ruby:2.4.2](https://hub.docker.com/_/ruby/) base image.

## Using

### Quick Start

```
docker run --rm -v "${YOUR_SPEC_DIR}:/serverspec:ro" uzyexe/serverspec <rake_option>
```

Default `rake_option` is `-T`

### Tutorial

Step 1. Create your serverspec directory.

```
# mkdir <your_serverspec_dir>
```

Step 2. Initialized serverspec directory.

```
# docker run --rm -v $PWD:/serverspec:rw --entrypoint="/usr/local/bundle/bin/serverspec-init" uzyexe/serverspec
```

Step 3. The following file is generated...

```
# tree .
.
├── .rspec
├── Rakefile
└── spec
    ├── localhost
    │   └── sample_spec.rb
    └── spec_helper.rb
```

Step 4. Display the task list defined in the Rakefile.

```
# docker run --rm -v $PWD:/serverspec:ro uzyexe/serverspec
rake spec:localhost  # Run serverspec tests to localhost
```

Step 5. Run serverspec tests to localhost.

```
# docker run --rm -v $PWD:/serverspec:ro uzyexe/serverspec spec:localhost

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

If you need access to process or network interface you will need --pid="host" or --net="host" or more docker option.

```
# docker run \
   --rm \
   --net="host" \
   --pid="host" \
   --ipc="host" \
   --privileged \
   --volume="${PWD}/Rakefile:/serverspec/Rakefile:ro" \
   --volume="$(pwd)/spec:/serverspec/spec:ro" \
   --volume="/etc/motd:/etc/motd:ro" \
   --volume="/home/user/.ssh:/home/user/.ssh:ro" \
   --volume="/var:/var:ro" \
   --volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
   uzyexe/serverspec <rake_option>
```

--

## serverspec

[Getting started](http://serverspec.org/)

# Authors

* Shuji Yamada (<uzy.exe@gmail.com>)

## License

This project is licensed under the terms of the MIT license.
