$ ->
	$(document).foundation()
	# Write scripts here

	options = 
		zoomType: 'standard'
		lens:true
		preloadImages: true
		alwaysOn:false
		zoomWidth: 300
		zoomHeight: 300
		xOffset:0
		yOffset:0
		position:'left'

	$('.product-detail-image').jqzoom( options );  