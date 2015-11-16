rest = require 'restler'
fs = require 'fs'
path = require 'path'

module.exports = (grunt) ->
  grunt.registerMultiTask 'apiary', 'Grunt task to push API blueprint document to apiary.io', ->
    done = @async()
    options = @options
      apiName: null
      token: null
      messageToSave: 'Saving blueprint with API'

    grunt.fail.fatal 'apiName is needed' if not options.apiName?
    grunt.fail.fatal 'token is needed' if not options.token?


    apib = @filesSrc
    .filter (filepath) ->
      if grunt.file.exists filepath
        true
      else
        grunt.log.errorln "#{filepath} does not exist."
        false
    .map(grunt.file.read)
    .join('\n')

    grunt.verbose.writeln "Compiled api blueprint is: \n#{apib}"

    url = "https://api.apiary.io/blueprint/publish/#{options.apiName}"
    args =
      data:
        code: apib
        messageToSave: options.messageToSave
      headers:
        authentication: "Token #{options.token}"
        'content-type': 'application/json'
        accept: 'application/json'

    grunt.verbose.writeln "url is #{url}"
    grunt.verbose.writeln "args is #{JSON.stringify args}"

    rest.post(url, args)
    .on 'complete', (data) ->
      grunt.verbose.writeln "data is #{JSON.stringify data}"
      if data.error
        grunt.fail.fatal data.message
      else
        grunt.log.ok data.message if data.message?
        done()
