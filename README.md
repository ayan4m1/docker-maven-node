# Docker Maven Node

This repository hosts Docker images which bundle Java, Maven, and Node.js in a single image.

## Quick Reference

- Maintained by [ayan4m1](https://github.com/ayan4m1)

- Get help on [the GitHub issues page](https://github.com/ayan4m1/docker-maven-node/issues)

## Image Tag Format

The images are offered in two base flavors - one based on Eclipse Temurin and Ubuntu, and one based on Alpine Linux. The Alpine images are much smaller but your application may need extra packages installed or compiled in order to work correctly on them.

The `latest` and `latest-alpine` tags are always pinned at the most recent release.

The tag format is `mvn<x>-jdk<y>-n<z>`, where `x`, `y`, and `z` are versions of Maven, Java, and Node respectively. Alpine images have an `-alpine` suffix.

## Supported Versions

I will try to keep images for the current LTS/stable releases of Node, Java, and Maven available.
