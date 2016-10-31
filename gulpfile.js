var gulp       = require('gulp');
var browserify = require('browserify');
var source     = require('vinyl-source-stream');
var watchify   = require('watchify');
var sass       = require('gulp-sass');
var bourbon    = require('node-bourbon');
var neat       = require('node-neat');

// settings ---
var jsConf = {
  srcPath:      'source/assets/javascripts/main.js',
  destPath:     '.tmp/dest/assets/javascripts',
  destFileName: 'bundle.js'
}
var cssConf = {
  srcPath:      'source/assets/stylesheets/**/*.scss',
  destPath:     '.tmp/dest/assets/stylesheets'
}

var b = browserify({
  entries: jsConf.srcPath,
  cache: {},
  packageCache: {}
});

// gulp tasks ---
gulp.task('default', ['build']);
gulp.task('build', ['sass', 'bundle']);
gulp.task('server', ['sass', 'bundle'], watch);
gulp.task('bundle', jsBundle);
gulp.task('sass', sassPreCompile);

// functions ---
function watch() {
  // watchify
  b.plugin(watchify);
  b.on('update', jsBundle);
  jsBundle();

  // sass watch
  gulp.watch(cssConf.srcPath, ['sass']);
}

function jsBundle() {
  return b.bundle()
    .pipe(source(jsConf.destFileName))
    .pipe(gulp.dest(jsConf.destPath));
}

function sassPreCompile(){
  gulp.src(cssConf.srcPath)
    .pipe(sass({
      includePaths: neat.includePaths
    }))
    .pipe(gulp.dest(cssConf.destPath));
}

