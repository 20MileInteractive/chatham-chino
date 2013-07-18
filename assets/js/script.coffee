window.carousel = null

$ ->

	# Initialize Foundation
	$(document).foundation()

	##############################################################
	# Product Detail scripts
	##############################################################

	# Product gallery builder
	setupProductGallery = ( product_images )->

		if window.carousel != null
			window.carousel.destroy()
			$("ul#product-image-carousel").remove()

		selectProductImage = (el, pos, evt)->
			evt.preventDefault()
			el.siblings().removeClass("active")
			el.addClass("active")
			carousel.setCurrent( pos )
			$(".product-spotlight img").attr('src', el.find("img").data("largeimg"))

		resizeCarouselAction = ()->
			$('#product-image-carousel li:eq(0)').addClass 'active'
			$('#product-image-carousel li:eq(0)').click()

		carousel_options =
			start: 0
			minItems: 3
			onClick: selectProductImage
			onReady: resizeCarouselAction

		product_image_carousel = $('<ul id="product-image-carousel"></ul>')

		product_images.each (index, elem)->
			elem = $(elem)

			product_option 	= elem.data "product-option"
			image_src 		= elem.attr "src"
			large_src 		= elem.data "largeimg"

			image 		= new Image
			image.src 	= image_src
			image 		= $(image).data "largeimg", large_src

			anchor 	= $('<a href="#"></a>')
			anchor.append image

			li 		= $('<li></li>')
			li.data "product-option", product_option
			li.append anchor

			product_image_carousel.append li

		$("span.product-spotlight").after(product_image_carousel)
		window.carousel = $("#product-image-carousel").elastislide carousel_options

	# Initial setup
	setupProductGallery $("#product-option img")

	selectProductModifier = (evnt)->
		evnt.preventDefault()
		parent = $(@).parent().parent()
		parent.find("a.selected").removeClass "selected"
		$(@).addClass "selected"
		option_name = $(@).data('option-name')
		parent.prev("input[type=hidden]").val( $(@).data("modifier-id") ).prev("h6").children("span:first").text(option_name)
		
		images = $("#product-option img[data-product-option='#{option_name}']")

		if images.length > 0
			setupProductGallery images

	$("ul.modifiers a").on "click", selectProductModifier






	##############################################################
	# Cart page scripts
	##############################################################

	toggleItemQuantity = (evnt)->
		evnt.preventDefault()
		$(@).parent().parent("div").children("p").show();
		$(@).parent("p").hide();		

	$("a.edit-quantity").on "click", toggleItemQuantity


	removeItemFromCart = (evnt)->
		evnt.preventDefault()
		$(@).prev().find("input[type=text]").val(0)
		$("form").submit()

	$(".product a.remove-button").on "click", removeItemFromCart



	##############################################################
	# Contact page scripts
	##############################################################
	submitContactFormAction = ()->
		return false

	$("form#contact-form").on "submit", submitContactFormAction