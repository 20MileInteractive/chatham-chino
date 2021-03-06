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



	# Select product modifier action
	selectProductModifier = (evnt)->
		evnt.preventDefault()
		parent = $(@).parent().parent()
		parent.find("a.selected").removeClass "selected"
		$(@).addClass "selected"
		option_name = $(@).data('option-name')

		parent.prev("select")
			.val( $(@).data("modifier-id") ) # set the value to the selected id
			.trigger("change")				 # fire the "change" event on the <select>, to trigger event listeners
			.prev("h6")						 # \ 
			.children("span:first")			 # -> update selected option label
			.text(option_name)				 # /
		
		images = $("#product-option img[data-product-option='#{option_name}']")

		if images.length > 0
			setupProductGallery images


	# Product page constructor
	productPageInit = ()->
		# Init product gallery
		setupProductGallery $("#product-option img")

		# Hook up product modifier
		$("ul.modifiers a").on "click", selectProductModifier

		# Init pre-selected modifier label
		$("h6 + select").each (index, elem)->
			this_elem = $(elem)
			this_elem.prev().children("span:first").text this_elem.children("option:first").text()


	if $.contains( document.body, $("#product-detail-page").get()[0] )
		productPageInit()





	##############################################################
	# Cart page scripts
	##############################################################

	# edit cart product quantities
	toggleItemQuantity = (evnt)->
		evnt.preventDefault()
		console.log "clicked"
		$(@).parent().next().show();
		$(@).parent("p").hide();		

	$("a.edit-quantity").on "click", toggleItemQuantity


	# remove from cart
	removeItemFromCart = (evnt)->
		evnt.preventDefault()
		$(@).prev().find("input[type=text]").val(0)
		$("form").submit()

	$(".product a.remove-button").on "click", removeItemFromCart

	toggleShippingInfo = ()->
		if @.checked
			$('#shipping_details_drawer').slideUp()
		else
			$('#shipping_details_drawer').slideDown()

	# toggle "same as billing" checkbox on shipping
	$('#shipping_same_as_billing').on "change", toggleShippingInfo
	if $('#shipping_same_as_billing').is(':checked')
		$('#shipping_details_drawer').addClass "hide"



	##############################################################
	# Contact page scripts
	##############################################################

	contactFormResponseHandler = ( data )->
		console.log data
		$("input[type=text], textarea").removeClass("error")
		$("label small").text('')
		if data.success
			$("form#contact-form").remove()
			$("#thank-you-msg").removeClass "hide"
		else
			for k, v of data.errors
				$("[name=#{k}]").addClass("error")
								.prev("label")
								.children("small")
								.text(v)
			

	submitContactFormAction = ()->
		url = @.action
		if url !=""
			params = $(@).serialize()
			$.post url, params, contactFormResponseHandler
		return false

	$("form#contact-form").on "submit", submitContactFormAction


















	############################ END #############################