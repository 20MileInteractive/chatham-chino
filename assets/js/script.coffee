$ ->
	$(document).foundation()
	# Write scripts here

	selectProductModifier = (evnt)->
		evnt.preventDefault()
		parent = $(@).parent().parent()
		parent.find("a.selected").removeClass "selected"
		$(@).addClass "selected"
		parent.prev("input[type=hidden]").val( $(@).data("modifier-id") )

	$("ul.modifiers a").on "click", selectProductModifier


	toggleItemQuantity = (evnt)->
		evnt.preventDefault()
		$(@).parent().parent("div").children("p").show();
		$(@).parent("p").hide();		

	$("a.edit-quantity").on "click", toggleItemQuantity


	carousel_options =
		start: 0
		minItems: 3

	carousel = $("#product-image-carousel").elastislide carousel_options