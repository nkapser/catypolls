// JavaScript Document

$(document).ready(function() { 
 $(".cit_sel").click(function(){
				$(".city_cont").slideToggle("fast");		
				return false;
				});	
				
				$(".signin_butt"). click( function(){
					$('.signin_butt').addClass('signin_butt_active');
					$("#signin").fadeIn("slow");
					return false;
				})
				$(".signin .cancel_button"). click( function(){
					$("#signin").fadeOut("slow");
					$('.signin_butt').removeClass('signin_butt_active').addClass('signin_butt');
					return false;
				})
				
				$(".register_butt"). click( function(){
					$('.register_butt').addClass('register_butt_active');
					$("#register").fadeIn("slow");
					return false;
				})
				$(".register .cancel_button"). click( function(){
					$("#register").fadeOut("slow");
					$('.register_butt').removeClass('register_butt_active').addClass('register_butt');
					return false;
				})
				
				
				$(".shoppersstop").hover(
  function () {
    $(".overlay").fadeIn("fast");
  },
  function () {
   $(".overlay").fadeOut("fast");
  }
);
				
				
				
				
								
				 
 });

$(document).ready(function(){	
	$("#slider").easySlider({
		auto: true,
		continuous: true,
		numeric: true
	});
});



$(document).ready(function() {

	//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
	
	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});

});


