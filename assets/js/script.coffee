$ ->
	$(document).foundation()
	# Write scripts here

	zoomImageWindowResizeAction = ()->
		demo4obj = $('#demo4').data('imagezoom')
		winWidth = $(window).width()
		if winWidth > 900
			demo4obj.changeZoomSize(480,300)
		else
			demo4obj.changeZoomSize( winWidth*0.4,winWidth*0.4*0.625)
		

	carsouselClickAction = ( el, pos, evt )->
		el.siblings().removeClass "active"
		el.addClass "active"
		carsousel.setCurrent pos
		evt.preventDefault()
		# for imagezoom to change image 
		demo4obj = $('#demo4').data('imagezoom')
		demo4obj.changeImage(el.find('img').attr('src'),el.find('img').data('largeimg'))

	carsouselReadyAction = ()->
		# init imagezoom with many options
		imageZoomOptions = {
			type: 'standard'
			zoomSize: [480,300]
			bigImageSrc:'demo_assets/large/2.jpg'
			offset:[10,-4]
			zoomViewerClass:'standardViewer'
			onShow: (obj)->
				obj.$viewer.hide().fadeIn(500)
			onHide: (obj)->
				obj.$viewer.show().fadeOut(500)
		}

		$('#product-image-spotlight').ImageZoom imageZoomOptions
		
		$('#product-image-carousel li:eq(0)').addClass('active')
		
		# change zoomview size when window resize
		$(window).resize zoomImageWindowResizeAction

	carsouselOptions = {
		start: 1
		minItems: 4
		onClick: carsouselClickAction
		onReady: carsouselReadyAction
	}

	carsousel = $('#product-image-carousel').elastislide carsouselOptions