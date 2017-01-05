# Grunt configuration updated to latest Grunt.  That means your minimum
# version necessary to run these tasks is Grunt 0.4.
#
# Please install this locally and install `grunt-cli` globally to run.
module.exports = (grunt) ->
  
  # Initialize the configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    shell:
      start:
        command: "coffee server.coffee"
    clean: 
      tmp: ["tmp"]
      dist: ["dist/**/*.*", "!dist/uploaded_images/**/*.*"]
    copy:
      vendor:
        files: [
          {expand: true, cwd: 'vendor/', src: ['fonts/**/*.*', 'images/**/*.*' , 'img/**/*.*'], dest: 'dist/'}
        ]
      bootstrap:
        files: [
          {expand: true, cwd: 'node_modules/bootstrap/dist/fonts/', src: ['**'], dest: 'dist/fonts'}
        ]
      images2tmp:
        files: [
          {expand: true, cwd: 'dist/uploaded_images', src: ['**'], dest: 'tmp/uploaded_images'}
        ]
      images2backup:
        files: [
          {expand: true, cwd: 'dist/uploaded_images', src: ['**'], dest: 'images_backup'}
        ]
      tmp2images:
        files: [
          {expand: true, cwd: 'tmp/uploaded_images', src: ['**'], dest: 'dist/uploaded_images'}
        ]
    concat:
      vendor_js:
        src: [
          "vendor/parameters.js"
          "vendor/react.override.js"
          "vendor/accounting.js"
          "vendor/chosen.js"
          "vendor/maskinput.js"
          "vendor/scripts.js"
          "vendor/sharer.js"
          "vendor/autoresizer.js"
          "vendor/expert_filter.js"
          "vendor/jquery.scrolldepth.min.js"
          "vendor/filedrop-min.js"
        ]
        dest: "tmp/vendor.js"
      vendor_css:
        src: [
          "vendor/animate.css"
          "vendor/chosen.css"
          "vendor/jquery-ui.min.css"
        ]
        dest: "tmp/vendor.css"
      js:
        src: [
          "node_modules/jquery/dist/jquery.js"
          "node_modules/react/dist/react.js"
          "node_modules/bootstrap/dist/js/bootstrap.js"
          "node_modules/jquery.cookie/jquery.cookie.js"
          "node_modules/sweetalert/dist/sweetalert.min.js"
          "node_modules/chart.js/Chart.min.js"
          "node_modules/jquery.cookie/jquery.cookie.js"
          "node_modules/moment/moment.js"
          "tmp/vendor.js"
          "tmp/script.js"
          "node_modules/moment/moment.js"
        ]
        dest: "dist/script.js"
      js_admin:
        src: [
          "node_modules/jquery/dist/jquery.js"
          "node_modules/react/dist/react.js"
          "node_modules/bootstrap/dist/js/bootstrap.js"
          "node_modules/fancybox/dist/js/jquery.fancybox.js"
          "node_modules/sweetalert/dist/sweetalert.min.js"
          "node_modules/moment/moment.js"
          "node_modules/chart.js/Chart.min.js"
          "tmp/vendor.js"
          "tmp/admin/script.js"
          "node_modules/jquery.cookie/jquery.cookie.js"
          "node_modules/moment/moment.js"
          "vendor/jquery-ui.min.js"
          "vendor/admin.js"
        ]
        dest: "dist/admin/script.js"
      css:
        src: [
          "node_modules/bootstrap/dist/css/bootstrap.css"
          "node_modules/sweetalert/dist/sweetalert.css"
          "tmp/vendor.css"
          "tmp/style.min.css"
        ]
        dest: "dist/style.css"
      css_admin: 
        src: [
          "node_modules/bootstrap/dist/css/bootstrap.css"
          "node_modules/sweetalert/dist/sweetalert.css"
          "node_modules/blueimp-file-upload/css/jquery.fileupload.css"
          "node_modules/blueimp-file-upload/css/jquery.fileupload-ui.css"
          "node_modules/fancybox/dist/css/jquery.fancybox.css"
          "tmp/vendor.css"
          "tmp/admin/style.min.css"
        ]
        dest: "dist/admin/style.css"
      css_mails: 
        src: [
          "node_modules/bootstrap/dist/css/bootstrap.css"
          "tmp/vendor.css"
          "tmp/mails.min.css"
        ]
        dest: "dist/mails.css"
    stylus:
      app:
        options:
          define:
            import_tree: require 'stylus-import-tree'
            font_face: require 'stylus-font-face'
        files:
          "tmp/style.min.css": "src/app/stylus/style.styl"
          "tmp/admin/style.min.css": "src/app/stylus/admin.styl"
          "tmp/mails.min.css": "src/app/stylus/mails.styl"
    coffee:
      app:
        options:
          bare: true
        files:
          "tmp/script.js": ["src/app/coffee/libs/**/*.coffee", "src/app/coffee/script.coffee"]
          "tmp/admin/script.js": ["src/app/coffee/libs/**/*.coffee", "src/app/coffee/admin.coffee"]
    cjsx:
      app:
        expand: true
        cwd: 'src/app/cjsx/'
        src: ['**/*.cjsx']
        dest: 'dist/views'
        ext: '.js'
    uglify:
      js:
        files:
          "dist/script.min.js": ["dist/script.js"]
          "dist/admin/script.min.js": ["dist/admin/script.js"]
    cssmin:
      target:
        files:
          "dist/style.min.css": ["dist/style.css"]
          "dist/admin/style.min.css": ["dist/admin/style.css"]
          "dist/mails.min.css": ["dist/mails.css"]
    watch:
      development:
        files: ["src/app/**/*.*"]
        tasks: ["compile-development"]
      release:
        files: ["src/app/**/*.*"]
        tasks: ["compile-release"]
      styles:
        files: ["src/app/**/*.*"]
        tasks: ["compile-styles-short"]
    mkdir:
      csv:
        options: 
          create: ['dist/csv']
      uploaded_images:
        options: 
          create: ['dist/uploaded_images']      
      images_backup:
        options:
          create: ['images_backup']

  # Load external Grunt task plugins.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-coffee-react'
  grunt.loadNpmTasks 'grunt-mkdir'
  grunt.loadNpmTasks 'grunt-shell'

  # Default task.
  grunt.registerTask "compile-scripts", ["coffee", "concat:vendor_js", "concat:js", "concat:js_admin", "cjsx:app"]
  grunt.registerTask "compile-styles", ["stylus", "concat:vendor_css", "concat:css", "concat:css_admin", "concat:css_mails"]
  grunt.registerTask "compile-development", ["clean:tmp", "clean:dist", "compile-scripts", "compile-styles", "mkdir:csv", "copy:vendor", "copy:bootstrap", "clean:tmp"]
 
  grunt.registerTask "compile-release", ["compile-development", "uglify:js", "cssmin"]

  grunt.registerTask "start-development", ["compile-release", "shell:start", "watch:development"]  
  grunt.registerTask "start", ["compile-release", "shell:start"]

  grunt.registerTask "compile-scripts-nouglify", ["compile-scripts","clean:tmp"]
  grunt.registerTask "compile-styles-short", ["compile-styles", "cssmin","clean:tmp", "watch:styles"]
  grunt.registerTask "compile-scripts-short", ["compile-scripts", "uglify:js","clean:tmp"]
