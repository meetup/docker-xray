# Docker XRay [![Build Status](https://travis-ci.org/meetup/docker-xray.svg?branch=master)](https://travis-ci.org/meetup/docker-xray)

> AWS [XRay](https://aws.amazon.com/xray/) [daemon](https://docs.aws.amazon.com/xray/latest/devguide/xray-daemon.html) in a docker container

Mostly applied verbatim from [these docs](https://docs.aws.amazon.com/xray/latest/devguide/xray-daemon-ecs.html).

## Usage

AWS X-Ray is a managed distributed tracing system. It provides insight into
the relationships between services as well as causality of performance bottlenecks
and service quality.

Applications typically interface the the service indirectly with a local
daemon process over udp. The daemon buffers trace data and periodically flushes
it to the AWS xray API.

This repository wraps that daemon in a docker container as recommended by [these docs](https://docs.aws.amazon.com/xray/latest/devguide/xray-daemon-ecs.html) exposing a udp listener on port 2000.

See the xray [pricing](https://aws.amazon.com/xray/pricing/) guide to understand
the cost impact of using this service

You can run this locally with the following command

```bash
$ docker run \
      --attach STDOUT \
      -v ~/.aws/:/root/.aws/:ro \
      --net=host \
      -e AWS_REGION=us-east-2 \
      --name xray-daemon \
      -p 2000:2000/udp \
      meetup/xray:{TAG_HERE}
```

Find the latest docker tag [here](https://hub.docker.com/r/meetup/xray/tags/)