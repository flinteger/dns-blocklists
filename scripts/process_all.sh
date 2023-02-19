#!/bin/sh

cleanup()
{
    pids=$(jobs -p)
    echo "Kill background jobs: $pids"
    # Kill all the background jobs
    kill $pids
}

trap cleanup INT

mkdir -p blocklists

./scripts/process.py ./sources/ad.json &
./scripts/process.py ./sources/dating.json &
./scripts/process.py ./sources/gambling.json &
./scripts/process.py ./sources/malicious.json &
./scripts/process.py ./sources/piracy.json &
./scripts/process.py ./sources/porn.json &
./scripts/process.py ./sources/social_networks.json &
./scripts/process.py ./sources/game.json &

# wait all background jobs finished
wait
