FROM ubuntu:22.04
RUN apt-get update -y && apt-get install -y --no-install-recommends libgl1-mesa-dev build-essential python3
