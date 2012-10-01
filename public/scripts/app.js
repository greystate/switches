$(function() {
	$('.switchboard').on('click', '.switch a', function() {
		var $sw = $(this).parent();
		$sw.toggleClass('on off');
	});
});