module.exports = (grunt) ->
  pkg = grunt.file.readJSON 'package.json'
  grunt.initConfig
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
        files: '**/*.scss',
        tasks: ['sass']
      haml:
        files: '**/*.haml',
        tasks: ['haml']

  for t of pkg.devDependencies
    if t.substring(0, 6) is 'grunt-'
      grunt.loadNpmTasks t

  grunt.registerTask 'default', ['watch']
