set -e

docker build . -t mood.web:latest -f Dockerfile.web

docker build . -t mood.worker:latest -f Dockerfile.worker