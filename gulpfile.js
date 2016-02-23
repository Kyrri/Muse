var gulp = require('gulp');
var jade = require('gulp-jade');
 
gulp.task('templates', function () {
	var YOUR_LOCALS = {
		nfc: true,
		development: true,
	};

	gulp.src('userApp/views/*.jade')
	.pipe(jade({
		locals: YOUR_LOCALS
	}))
	.pipe(gulp.dest('nativeUserApp/www/'));

});
