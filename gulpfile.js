var gulp = require('gulp');
var jade = require('gulp-jade');
 
gulp.task('templates', function () {
	var YOUR_LOCALS = {
		nfc: true,
		development: true,
	};
//Jade transfer
	gulp.src('userApp/views/*.jade')
	.pipe(jade({
		locals: YOUR_LOCALS
	}))
	.pipe(gulp.dest('nativeUserApp/www/'));

//CSS transfer
	gulp.src('userApp/public/stylesheets/*.css')
	.pipe(gulp.dest('nativeUserApp/www/stylesheets'));

//Images transfer
	gulp.src('userApp/public/images/*')
	.pipe(gulp.dest('nativeUserApp/www/images'));

//Javascripts transfer
	gulp.src(['userApp/public/javascripts/*','!userApp/public/javascripts/NFC.js','!userApp/public/javascripts/nfc_utils.js'])
	.pipe(gulp.dest('nativeUserApp/www/javascripts'));

});
