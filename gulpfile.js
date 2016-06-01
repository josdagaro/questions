var gulp = require('gulp'),
    browserify = require('browserify'),
    jadeify = require('jadeify'),
    babelify = require('babelify'),
    buffer = require('vinyl-buffer'),
    source = require('vinyl-source-stream'),
    stylus = require('gulp-stylus'),
    concat = require('gulp-concat-css'),
    nib = require('nib'),
    minify = require('gulp-minify-css'),
    uglify = require('gulp-uglify'),
    jade = require('gulp-jade');

gulp.task('build', ['jade','styl', 'js'])

gulp.task('js', function() {
  return browserify({
    entries: './sources/app.js', //punto de entrada js
    transform: [ babelify, jadeify] //transformaciones
  })
  .bundle()
  .pipe(source('app.js')) // archivo destino
  .pipe(buffer())
  .pipe(uglify())
  .pipe(gulp.dest('./client/js/')) // en dónde va a estar el archivo destino
})

gulp.task('styl', function() {
  return gulp.src('./sources/style.styl') // entry point de styl
    .pipe(stylus({ use: nib() })) //inicializo stylus con nib como plugin
    .pipe(concat('style.css'))
    .pipe(minify())
    .pipe(gulp.dest('./client/css/'));
})

gulp.task('jade', function() {
    return gulp.src('sources/*.jade')
        .pipe(jade()) // pip to jade plugin
        .pipe(gulp.dest('./views/')); // tell gulp our output folder
});

gulp.task('watch', function () {
    gulp.watch('./sources/*.js', ['js']);
    gulp.watch('./sources/*.styl', ['styl']);
    gulp.watch('./sources/*.jade', ['jade']);
});
