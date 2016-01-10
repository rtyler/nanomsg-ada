#!/usr/bin/env bats

@test "send a Hello to the pipeline" {
   ./build/pipeline &
   node0=$!

   sleep 1

   ./build/c_pipeline node1 tcp://127.0.0.1:5019 "Hello, World" || true

   kill ${node0}
}
