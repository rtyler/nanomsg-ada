#!/bin/sh -e

./build/pipeline &
node0=$!

sleep 1

./build/c_pipeline node1 tcp://127.0.0.1:5019 "Hello, World" || true

echo ">> Killing pid ${node0}"
kill ${node0}
echo
