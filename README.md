# mood 

<img src="/assets/screenshot.png" width="300" align="right"/>

> If today were the last day of my life, would I want to do what I am about to do today?" And whenever the answer has been "No" for too many days in a row, I know I need to change something.

Steve Jobs

## Background

I've been a heavy user of [1 Second Everyday](https://1se.co/), where I created a very personal video of the full year for the last 730 days. (Check out a [public sample video here](https://www.youtube.com/watch?v=m_xlkC2DsSI))

One thing I noticed is that I associate the mood and happiness when seeing the videos, however, I know that this will slowly fade away as time passes.

I wanted a way to track my overall happiness and excitement in my life, allowing me to monitor, analyze and react to it. As Steve Jobs said, if you notice a downwards trend, it might be time to apply some changes to your life.

## How it works

It's a simple [Telegram Bot](https://core.telegram.org/bots) that will send you a message 3 times a day:

- One in the morning (I'd never reply to the bot before showering)
- One after lunch
- One when going to bed

You can always just text your bot a number, however, I know I'd forget it. That's why the bot sends you those reminders.

It then pulls up this really nice, optimized keyboard in Telegram, with a short description of what each number means.

If you forget to track a day, that's no big deal at all. The database is simple, it looks like this:

```ruby
@_db.create_table :moods do
  primary_key :id
  DateTime :time
  Integer :value
end
```

I decided not to store the information about breakfast, lunch and dinner, as it would make time zones more complex.

> Stripped out Felix's content here

## How to use it

You'll have to setup a few things

- Create a Telegram bot using @BotFather and get the API key, and message ID with you
- Provide those values using `TELEGRAM_TOKEN` and `TELEGRAM_CHAT_ID`
  - To get the `TELEGRAM_CHAT_ID`, send a message to your bot and then access the following URL in your browser `https://api.telegram.org/bot[TELEGRAM_TOKEN]/getUpdates`. You'll see a message, and within that, the Chat ID to use
- And host it on any server, like Heroku, and use the Heroku scheduler feature to call `rake morning`, `rake noon` and `rake evening`
- Make sure the Heroku worker is enabled

> End of Felix Readme

## Deploy to Heroku

Deploying the code on Heroku is the addition changes made in the forked repository. This uses GitHub Action to make a simple container-based build process using Heroku CLI. Heroku look for `HEROKU_API_KEY` and `HEROKU_APP` as environment variables. Configure this under [`Settings/Secrets`](https://github.com/sharat/mood/settings/secrets) page. Have a looka at `.github/workflows/push.yml`. Currently it deploys every push made in the repo. You can configure this per branch. [Read More*](https://help.github.com/en/categories/automating-your-workflow-with-github-actions).
