# Description
#   A script that listens for a specific event posted to the particle cloud and logs it into a google spreadsheet. Can be extended to post info to a chat client.
#
# Configuration:
#
# Commands:
#
# Notes:
#    Requires a file name es-config.json to be in the base directory (same dir as 'package.json'). See README for how to format file.
#
# Author:
#    <john.paul.quicksall@gmail.com>

EventSource = require 'eventsource'
http = require 'http'
QS = require 'querystring'
url = require 'url'
fs = require 'fs'
es_config = {}
data = ""

fs.readFile './es-config.json', (err, contents) ->
  if err
    console.log "Encountered an error: #{err}"
  else
    es_config = JSON.parse(contents.toString())

addr = es_config['particle-url']
event_name = es_config['event']
token = es_config['auth-token']

module.exports = (robot) ->
  eventSourceInitDict =
    rejectUnauthorized: false
    headers: 'Authorization': 'Bearer #{token}'
  es = new EventSource("#{addr}", eventSourceInitDict)
  es.addEventListener "#{event_name}", ((event) ->
    #Function code goes here
    data = JSON.parse(event.data)
    robot.logger.info "This is the data we got...#{data}"
    robot.logger.info "This is the event type...#{event.type}"
    robot.logger.info "The core ID is -#{data.coreid}- and it's data is -#{data.data}"
    robot.http(es_config['google-sheet-url'])
      .header('Content-Type', 'application/x-www-form-urlencoded')
      .post("Core_ID=#{data.coreid}&Core_Data=#{data.data}") (err, res, body) ->
        if err
          robot.logger.info "Encountered an error: #{err}"
          return
        else
          robot.logger.info "We got back success!"
    return
  ), false
            
