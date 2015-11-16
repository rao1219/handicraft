module.exports = (grunt) ->
  grunt.registerMultiTask 'aglio', 'Grunt task to generate html from api blueprint with aglio', ->
    aglio = require 'aglio'
    Q = require 'q'
    done = @async()
    # Directly passed to aglio
    options = @options({})

    getLineNo = (warning, input) ->
      for location in warning.location
        input.substr(0, location.index).split('\n').length

    warningToString = (warning, input) ->
      "Line #{getLineNo(warning, input).join(', ')}: #{warning.message} (warning code #{warning.code})"

    compile = (file) ->
      apib = file.src
      .filter (filepath) ->
        if grunt.file.exists filepath
          true
        else
          grunt.log.errorln "#{filepath} does not exist."
          false
      .map(grunt.file.read)
      .join('\n')

      grunt.verbose.writeln "Compiled api blueprint is: \n#{apib}"

      deferred = Q.defer()

      aglio.render apib, options, (err, html, warnings) ->
        if err
          deferred.reject(new Error(err))
        else
          grunt.log.errorlns warningToString warning, warnings.input for warning in warnings
          deferred.resolve(html)
      deferred.promise

    results = for file in @files
      compile(file)
      .then (html) ->
        grunt.file.write(file.dest, html)
      .catch (err) ->
        grunt.fail.fatal(err)

    Q.all(results).then done
