$(document).ready(function () {
	var $icons = $('.sidebar .iconLinks');

	if (/^\/path/.test(location.pathname)) {
		$icons.find('.path').addClass('active');
	} else if (/^\/entry/.test(location.pathname)) {
		$icons.find('.entry').addClass('active');
	} else {
		$icons.find('.index').addClass('active');
	}
});