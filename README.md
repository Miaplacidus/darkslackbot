# DarkSlackBot
A Ruby Slackbot that returns the weather and the phases of the moon. The commands are as follows:

```
@[bot_name] help
# returns a list of commands for the bot
```

```
@[bot_name] weather now
# reports the weather right now
```

```
@[bot_name] weather tomorrow
# reports the weather tomorrow
```

```
@[bot_name] moon phase
# reports the phase of the moon
```

## Usage
To start the bot, `cd` into it and run

```
ruby app.rb
```

Open the Slack app in your browser or via the desktop app and use one of the commands above to communicate with the bot.

## Running Tests
The tests can be run using the `rspec` command.

## Future Updates
Future iterations of this app will allow for forecasts outside of NYC.
