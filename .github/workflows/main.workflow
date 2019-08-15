action "GitHub Action for Heroku" {
  uses = "actions/heroku@1.0.0"
}

workflow "Deploy to Heroku" {
  on = "push"
  resolves = "release"
}

action "login" {
  uses = "actions/heroku@master"
  args = "container:login"
  secrets = ["HEROKU_API_KEY"]
}

action "push" {
  uses = "actions/heroku@master"
  needs = "login"
  args = "container:push --recursive"
  secrets = ["HEROKU_API_KEY", "HEROKU_APP"]
}

action "release" {
  uses = "actions/heroku@master"
  needs = "push"
  args = "container:release web worker"
  secrets = ["HEROKU_API_KEY", "HEROKU_APP"]
}
