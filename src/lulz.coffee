# Description:
#   A bot that will always laugh with you, not at you
#
# Dependencies:
#   figlet
#
#
# Commands:
#   !ascii <message> - show funky-font-formatted message
#
# Author:
#   srang

figlet = require 'figlet'
module.exports = (robot) ->
  robot.hear /(lol(ol)*)/i, (msg) ->
    message = msg.match[1]
    font = msg.random figlet.fontsSync()
    robot.logger.info("Selected font #{font}")
    figlet(message, {font: font}, (err, data) ->
      if (err)
        robot.logger.error("Could not render #{message} with figlet")
        msg.send "Could not render #{message}"
      else
        msg.send "```\n#{data}```"
    )

  robot.hear /^!ascii(-[a-zA-Z]+)? ([a-zA-Z ]*)/, (msg) ->
    message = msg.match[2]
    font = msg.match[1]
    font = font?.slice(1).charAt(0).toUpperCase() + font?.slice(2)
    font = font or "Ghost"
    if font == "Random"
      font = msg.random figlet.fontsSync()
    robot.logger.info("Selected font #{font}")
    figlet(message, {font: font}, (err, data) ->
      if (err)
        robot.logger.error("Could not render #{message} with figlet")
        msg.send "Could not render #{message}"
      else
        msg.send "```\n#{data}```"
    )