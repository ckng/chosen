module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)
  grunt.loadNpmTasks('grunt1.0-dom-munger') # the naming convention of the package does not allow auto-discovery.

  `const sass = require('node-sass')`

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    version_tag: 'v<%= pkg.version %>'
    comments: """
/*!
Chosen, a Select Box Enhancer for jQuery and Prototype
Version <%= pkg.version %>
Full source at https://github.com/ItsTino/chosen
Copyright (c) 2011-<%= grunt.template.today('yyyy') %> ItsTino
MIT License, https://github.com/ItsTino/chosen/blob/master/LICENSE.md
This file is generated by `grunt build`, do not edit it by hand.
*/
\n
"""
    minified_comments: "/* Chosen <%= version_tag %> | (c) 2011-<%= grunt.template.today('yyyy') %> ItsTino | MIT License, https://github.com/ItsTino/chosen/blob/master/LICENSE.md */\n"

    concat:
      options:
        banner: '<%= comments %>'
      jquery:
        src: ['docs/chosen.jquery.js']
        dest: 'docs/chosen.jquery.js'
      proto:
        src: ['docs/chosen.proto.js']
        dest: 'docs/chosen.proto.js'
      css:
        src: ['docs/chosen.css']
        dest: 'docs/chosen.css'

    copy:
      main:
        src: 'LICENSE.md'
        dest: 'docs/'
      php:
        src: 'composer.json'
        dest: 'docs/'

    coffee:
      options:
        join: true
      jquery:
        files:
          'docs/chosen.jquery.js': ['coffee/lib/select-parser.coffee', 'coffee/lib/abstract-chosen.coffee', 'coffee/chosen.jquery.coffee']
      proto:
        files:
          'docs/chosen.proto.js': ['coffee/lib/select-parser.coffee', 'coffee/lib/abstract-chosen.coffee', 'coffee/chosen.proto.coffee']
      test:
        files:
          'spec/public/jquery_specs.js': 'spec/jquery/*.spec.coffee'
          'spec/public/proto_specs.js': 'spec/proto/*.spec.coffee'

    uglify:
      options:
        banner: '<%= minified_comments %>'
      jquery:
        options:
          mangle:
            reserved: ['jQuery']
        files:
          'docs/chosen.jquery.min.js': ['docs/chosen.jquery.js']
      proto:
        files:
          'docs/chosen.proto.min.js': ['docs/chosen.proto.js']

    sass:
      options:
        outputStyle: 'expanded'
        implementation: sass
      chosen_css:
        files:
          'docs/chosen.css': 'sass/chosen.scss'

    postcss:
      options:
        processors: [
          require('autoprefixer')(browsers: 'last 1 version')
        ]
      main:
        src: 'docs/chosen.css'

    cssmin:
      options:
        banner: '<%= minified_comments %>'
        keepSpecialComments: 0
      main:
        src: 'docs/chosen.css'
        dest: 'docs/chosen.min.css'

    watch:
      default:
        files: ['coffee/**/*.coffee', 'sass/*.scss']
        tasks: ['build', 'jasmine']
      test:
        files: ['spec/**/*.coffee']
        tasks: ['jasmine']

    jasmine:
      jquery:
        options:
          vendor: [
            'docs/docsupport/jquery-3.5.1.min.js'
          ]
          specs: 'spec/public/jquery_specs.js'
        src: [ 'docs/chosen.jquery.js' ]
      jquery_old:
        options:
          vendor: [
            'docs/docsupport/jquery-1.12.4.min.js'
          ]
          specs: 'spec/public/jquery_specs.js'
        src: [ 'docs/chosen.jquery.js' ]
      proto:
        options:
          vendor: [
            'docs/docsupport/prototype-1.7.0.0.js'
            'node_modules/simulant/dist/simulant.umd.js'
          ]
          specs: 'spec/public/proto_specs.js'
        src: [ 'docs/chosen.proto.js' ]

  grunt.loadTasks 'tasks'

  grunt.registerTask 'default', ['build']
  grunt.registerTask 'build', ['coffee:jquery', 'coffee:proto', 'sass', 'concat', 'uglify', 'postcss', 'cssmin', 'copy']
  grunt.registerTask 'test',  ['coffee', 'jasmine']
  grunt.registerTask 'test:jquery',  ['coffee:test', 'coffee:jquery', 'jasmine:jquery', 'jasmine:jquery_old']
  grunt.registerTask 'test:proto',  ['coffee:test', 'coffee:proto', 'jasmine:proto']


