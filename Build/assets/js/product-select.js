$(document).ready(function(){
			$("a.color").on("click", function(event){
				event.preventDefault();
				$("a.color").children().removeClass("selected");
				$(this).children().toggleClass("selected");
				
			});
			
			$("a.size").on("click", function(event){
				event.preventDefault();
				$("a.size").children().removeClass("selected");
				$(this).children().toggleClass("selected");
				
			});
			
			
			
	});

// @todo disable add to cart button until color and size are selected