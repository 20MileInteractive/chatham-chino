$ ->
	$(document).foundation()
	# Write scripts here

	selectProductModifier = (evnt)->
		evnt.preventDefault()
		parent = $(@).parent().parent()
		parent.find("a.selected").removeClass "selected"
		$(@).addClass "selected"
		parent.prev("input[type=hidden]").val( $(@).data("modifier-id") )
		color_name = $(@).data('color-name')
		$("#product-image-carousel li#" + color_name).click()

	$("ul.modifiers a").on "click", selectProductModifier


	toggleItemQuantity = (evnt)->
		evnt.preventDefault()
		$(@).parent().parent("div").children("p").show();
		$(@).parent("p").hide();		

	$("a.edit-quantity").on "click", toggleItemQuantity

	selectProductImage = (el, pos, evt)->
		evt.preventDefault()
		el.siblings().removeClass("active")
		el.addClass("active")
		carousel.setCurrent( pos )
		$(".product-spotlight img").attr('src', el.find("img").data("largeimg"))

	resizeCarouselAction = ()->
		$('#product-image-carousel li:eq(0)').addClass('active');

	carousel_options =
		start: 0
		minItems: 3
		onClick: selectProductImage
		onReady: resizeCarouselAction

	carousel = $("#product-image-carousel").elastislide carousel_options


	removeItemFromCart = (evnt)->
		evnt.preventDefault()
		console.log $(@).data('key')
		$(@).prev().find("input[type=text]").val(0)
		$("form").submit()

	$(".product a.remove-button").on "click", removeItemFromCart