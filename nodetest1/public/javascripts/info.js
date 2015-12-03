$(document).ready(function() {
	$("#likebtn").on('click', function(){
		var isLiked = this.src.indexOf(window.location.host+'/images/like.png') != -1;
    	this.src    = isLiked  ? this.src.replace('/images/like.png', '/images/like_select.png') : this.src.replace('/images/like_select.png','/images/like.png');
	});
	$("#favbtn").on('click', function(){
		var isLiked = this.src.indexOf(window.location.host+'/images/fav.png') != -1;
    	this.src    = isLiked  ? this.src.replace('/images/fav.png', '/images/fav_select.png') : this.src.replace('/images/fav_select.png','/images/fav.png');
	});

});