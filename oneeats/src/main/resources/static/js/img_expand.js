
$(document).ready(function () {
		var overlayDiv = $('<div class="overlay_gray"></div>');
  		$('body').append(overlayDiv);
  		
		$('.expand_img').click(
			function(){
				if($(this).hasClass('clicked')){
					$(this).removeClass('clicked');
					$('.overlay_gray').hide();
				}else{
					$('.overlay_gray').show();
					$(this).addClass('clicked');	
				}
							
			}
		);

});
