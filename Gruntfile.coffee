module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'
  grunt.initConfig
    coffeelint:
      app:
        files:
          src: [
            'Gruntfile.coffee',
            'src/**/*.coffee',
            'test/**/*.coffee'
          ]
    simplemocha:
      all:
        src: ['test/**/*.coffee']
        options:
          ui: 'bdd'
    coffee:
      compile:
        files: [
           expand: true,
           cwd: 'src',
           src: '*.coffee',
           dest: 'js',
           ext: '.js'
        ]
    haml:
      dist:
        files: [
          expand: true,
          cwd: 'haml',
          src: '*.haml',
          dest: '.',
          ext: '.html'
        ]
    sass:
      dist:
        options:
          style: 'expanded'
        files: [
          expand: true,
          cwd: 'sass',
          src: ['*.scss'],
          dest: 'css',
          ext: '.css'
        ]
    watch:
      css:
        files: 'sass/*.scss'
        tasks: ['sass']
      haml:
        files: 'haml/*.haml'
        tasks: ['haml']
      scripts:
        files: [
          'src/**/*.coffee',
          'test/**/*.coffee',
        ]
        tasks: [
          'coffeelint',
          'coffee'
          'simplemocha'
        ]
  for t of pkg.devDependencies
    if t.substring(0, 6) is 'grunt-'
      grunt.loadNpmTasks t

  grunt.registerTask 'default', ['watch']
