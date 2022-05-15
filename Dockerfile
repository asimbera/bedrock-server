FROM alpine:latest AS build

ARG version='1.18.33.02'

RUN apk add --no-cache unzip wget
WORKDIR /build

# Download, unpack and remove archive of bedrock-server.
RUN wget "https://minecraft.azureedge.net/bin-linux/bedrock-server-${version}.zip" \
  -O bedrock-server.zip \
  && unzip bedrock-server.zip \
  && rm bedrock-server.zip

# Set executable permissions
RUN chmod +x bedrock_server

# Create result image
FROM ubuntu:latest


RUN apt update && apt install -y \
  openssl \
  && rm -rf /var/lib/apt/lists/*

# Copy files to container
COPY --from=build /build /app

# Set cwd inside container
WORKDIR /app
ENV LD_LIBRARY_PATH=.

# Expose ports
EXPOSE 19132-19133/udp

ENTRYPOINT [ "./bedrock_server" ]
