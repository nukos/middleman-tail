var gulp        = require('gulp');
var browserify  = require('browserify');
var source      = require('vinyl-source-stream');
var watchify    = require('watchify');
var sass        = require('gulp-sass');
var bourbon     = require('node-bourbon');
var neat        = require('node-neat');
var fontAwesome = require('node-font-awesome');

// settings ---
var jsConf = {
  srcPath:      'source/assets/javascripts/main.js',
  destPath:     '.tmp/dest/assets/javascripts',
  destFileName: 'bundle.js'
}
var cssConf = {
  srcPath:      'source/assets/stylesheets/**/*.scss',
  destPath:     '.tmp/dest/assets/stylesheets',
  includePaths: Array.prototype.concat( neat.includePaths, fontAwesome.scssPath )
}
var fontConf = {
  destPath:     '.tmp/dest/assets/fonts'
}

var b = browserify({
  entries:      jsConf.srcPath,
  cache:        {},
  packageCache: {}
});

// gulp tasks ---
gulp.task('bundle',  jsBundle);
gulp.task('fonts',   copyFontAwesomeFonts);
gulp.task('sass',    ['fonts'], sassPreCompile);
gulp.task('build',   ['sass', 'bundle']);
gulp.task('server',  ['sass', 'bundle'], watch);
gulp.task('default', ['build']);

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
      includePaths: cssConf.includePaths
    }))
    .pipe(gulp.dest(cssConf.destPath));
}

function copyFontAwesomeFonts(){
  gulp.src(fontAwesome.fonts)
    .pipe(gulp.dest(fontConf.destPath));
}