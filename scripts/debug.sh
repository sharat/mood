if [[ "$(docker images -q ruby:2.4.0 2> /dev/null)" == "" ]]; then
  docker pull ruby:2.4.0
fi

docker run -v $(pwd):/work -it --entrypoint /bin/bash ruby:2.4.0