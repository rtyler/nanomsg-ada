#!/usr/bin/env bats

@test "Simple pubsub" {
   ./build/pubsub &
   server=$!

   sleep 1

   ./build/c_pubsub client0 &
   client0=$!

   sleep 2

   kill $server $client0
}
