$(function() {
	var $container = $('#container');
	formToCenter();

	$container.imagesLoaded(function() {
		setSize(300,1);
		formToCenter();
		
	});

	$(window).resize(function() {
		setSize(300,1);
		formToCenter();
	});

	function setSize(maxWidth, columnNum) {
		var windowWidth = $container.width();
		var adj_width = windowWidth/columnNum;

		if (adj_width < maxWidth) {
			console.log(adj_width);

			$('.item').width((100/columnNum - 0.2) + "%");

			$container.isotope({
				itemSelector: '.item',
				resizable: false,
				layout: 'masonry',
				transformsEnabled: false,
			    masonry: { columnWidth: adj_width }
			});

			$container.find('img').width(adj_width);

		} else {
			setSize(maxWidth,columnNum + 1);
		}
	}

	function formToCenter() {
		$form = $('.signup');
		$form.css('left', ($(window).width() / 2 - $form.width() / 2));
		$form.css('top', ($(window).height() / 2 - $form.height() / 2));
	}

});