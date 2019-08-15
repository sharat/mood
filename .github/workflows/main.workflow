workflow "Deploy to Heroku" {
  on = "push"
  resolves = "release"
}

action "login" {
  uses = "actions/heroku@master"
  args = "container:login"
  secrets = ["HEROKU_API_KEY"]
}

action "push-worker" {
  uses = "actions/heroku@master"
  needs = "login"
  args = "container:push -a sarath-mood worker"
  secrets = ["HEROKU_API_KEY"]
}

action "push" {
  uses = "actions/heroku@master"
  needs = "push-worker"
  args = "container:push -a sarath-mood web"
  secrets = ["HEROKU_API_KEY"]
}

action "release-worker" {
  uses = "actions/heroku@master"
  needs = "push"
  args = "container:release -a sarath-mood worker"
  secrets = ["HEROKU_API_KEY"]
}


action "release" {
  uses = "actions/heroku@master"
  needs = "release-worker"
  args = "container:release -a sarath-mood web"
  secrets = ["HEROKU_API_KEY"]
}
