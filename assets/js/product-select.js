$(document).ready(function(){
	$("a.color").on("click", function(event){
		event.preventDefault();
		$("a.color").children().removeClass("selected");
		$(this).children().toggleClass("selected");
		
	});
	
	$("a.size").on("click", function(event){
		event.preventDefault();
		$("a.size").removeClass("selected");
		$(this).toggleClass("selected");
		
	});
	


// @todo disable add to cart button until color and size are selected


	$("a.remove-button").on("click", function(event){
		event.preventDefault();
		$(this).parent().hide();
		$("div.undo").show();
						
	});
	
	$("a#undo").on("click", function(event){
		event.preventDefault();
		$("div.product").show();
		$("div.undo").hide();
						
	});
	
	$("a#edit-quantity").on("click", function(event){
		event.preventDefault();
		$(this).parent().parent("div").children("p").show();
		$(this).parent("p").hide();			
	});

});