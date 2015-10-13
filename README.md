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

## Sample Interaction

```
user1>> hubot hello
hubot>> hello!
```
