#!/bin/sh

old_path="$(pwd)"
cd /tmp
mkfifo docker.socket.fifo
while true; do
  nc docker.for.mac.localhost 12345 <docker.socket.fifo | nc -Ul docker.sock >docker.sock.fifo
  sleep .1
done &
cd "$old_path"

exec "$@"

