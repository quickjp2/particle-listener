# hubot-particle-listener

A script that listens for a specific event posted to the particle cloud and logs it into a google spreadsheet.

See [`src/particle-listener.coffee`](src/particle-listener.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-particle-listener --save`

Then add **hubot-particle-listener** to your `external-scripts.json`:

```json
[
  "hubot-particle-listener"
]
```

Once this is complete, add the config file to your base hubot directory

`touch es-config.json`

Add the following to that file:

```json
{
  "particle-url":"https://api.particle.io/v1/events",
  "google-sheet-url":"<url to your google sheet>",
  "auth-token":"<particle cloud access token>",
  "event":"<particle event name>"
}
```
  
