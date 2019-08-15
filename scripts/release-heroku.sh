set -e

heroku container:push --recursive --app $(HEROKU_APP)
heroku container:release web worker --app $(HEROKU_APP)
