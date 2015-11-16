module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    jade:
      install:
        cwd: './frontend'
        src: ['./**/*.jade']
        dest: './public'
        ext: '.html'
        extDot: 'last'
        expand: true
        options:
          doctype: 'html'
          filters:
            'coffee-script': require('coffee-script').compile
    coffee:
      install:
        cwd: './frontend'
        src: ['./scripts/**/*.coffee']
        ext: '.js'
        dest: './public'
        expand: true
    stylus:
      install:
        cwd: './frontend'
        src: ['./styles/**/*.styl']
        ext: '.css'
        dest: './public'
        expand: true
    uglify:
      install:
        src: ['./public/**/*.js', '!./public/third_party/**/*']
        dest: './'
        expand: true
    clean:
      install:
        src: ['./public']
    copy:
      frontend:
        cwd: './frontend'
        src: ['./images/**/*']
        dest: './public'
        expand: true
      bower:
        cwd: './bower_components'
        src: ['./**/*']
        dest: './public/third_party'
        expand: true
    connect:
      serve:
        options:
          base: './public'
          options:
            index: 'index.html'
    watch:
      jade:
        files: ['frontend/**/*.jade']
        tasks: ['jade']
      coffee:
        files: ['frontend/scripts/**/*.coffee']
        tasks: ['coffee']
      stylus:
        files: ['frontend/styles/**/*.styl']
        tasks: ['stylus']
      copy:
        files: ['frontend/images/**/*']
        tasks: ['copy']
      msg:
        files: ['locales/**/*.po']
        tasks: ['nggettext_compile']
      apib:
        files: ['doc/api.md']
        tasks: ['aglio']
    open:
      install:
        path: 'http://localhost:8000'
    coffeelint:
      test:
        src: ['**/*.coffee', '!node_modules/**/*']
        options:
          arrow_spacing:
            level: 'error'
          braces_spacing:
            level: 'error'
            spaces: 0
            empty_object_spaces: 0
          colon_assignment_spacing:
            level: 'error'
            spacing:
              left: 0
              right: 1
          empty_constructor_needs_parens:
            level: 'error'
          ensure_comprehensions:
            level: 'error'
          eol_last:
            level: 'error'
          line_endings:
            level: 'error'
          max_line_length:
            level: 'ignore'
          newlines_after_classes:
            level: 'error'
          no_empty_functions:
            level: 'error'
          no_empty_param_list:
            level: 'error'
          no_this:
            level: 'error'
          no_unnecessary_double_quotes:
            level: 'error'
          no_unnecessary_fat_arrows:
            level: 'error'
          non_empty_constructor_needs_parens:
            level: 'error'
          space_operators:
            level: 'error'
          spacing_after_comma:
            level: 'error'
    nggettext_extract:
      all:
        files:
          'locales/messages.pot': ['public/**/*.html', 'public/scripts/*.js']
    nggettext_compile:
      all:
        options:
          format: 'json'
        cwd: './locales'
        src: ['*.po']
        dest: './public/languages/'
        ext: '.json'
        expand: true
    aglio:
      api:
        files:
          'public/doc/api.html': ['doc/api.md']
    apiary:
      api:
        src: ['doc/api.md']
        options:
          apiName: 'vsvsapi'
          token: 'f705fa3d532e07a6d884cecef124996b'

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-angular-gettext'
  grunt.loadNpmTasks 'grunt-open'
  grunt.loadTasks 'grunt_tasks'

  grunt.registerTask 'test', ['coffeelint']
  grunt.registerTask 'compile', ['clean', 'jade', 'coffee', 'stylus', 'copy', 'aglio', 'nggettext_compile', 'test']
  grunt.registerTask 'install', ['compile', 'uglify']
  grunt.registerTask 'serve', ['compile', 'connect', 'open', 'watch']
  grunt.registerTask 'dev', ['compile', 'watch']
  grunt.registerTask 'default', ['dev']
  grunt.registerTask 'i18n', ['jade', 'coffee', 'nggettext_extract']
