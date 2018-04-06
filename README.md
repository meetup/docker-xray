# Docker XRay

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