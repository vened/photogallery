// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery.ui.nestedSortable
//= require sortable_tree/initializer

$(function(){
	var $wrapper = $('#wrapper');
	var $header = $('#header');
	var $footer = $('#footer');
	var $container = $('#container');
	var offsetTop = $wrapper.offset().top;

	function updateHtml() {
		var winHeight = $(window).height();
		var wrapperHeight = winHeight - offsetTop;
		
		$wrapper.css('min-height', wrapperHeight);
		$container.css('min-height', wrapperHeight - $footer.outerHeight(true));
	}
	
	$(window).on('resize', updateHtml);
	
	// init
	updateHtml();
});