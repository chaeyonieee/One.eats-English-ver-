function fn_toggle(num){
	if(num==1){
		$("#category_motnan").slideToggle();
		
		
		$("#motnan_arrow").rotate({
			angle:rotate1,
			animateTo:rotate1+180
			});
		rotate1 += 180;
		if(rotate1==360){
				rotate1=0;
			}
	
	}else{
		$("#category_meal").slideToggle();
		
		$("#meal_arrow").rotate({
			angle:rotate2,
			animateTo:rotate2+180
			});
		rotate2+=180;
		if(rotate2==360){
			rotate2=0;
		}
	}
	
}


function fn_slideToggle(num){
	$("#category_"+num).slideToggle();
	$("#arrow_"+num).rotate(
		{
			angle:rotateArray[num],
			animateTo:rotateArray[num]+180
		}
	);
	rotateArray[num] += 180;
	if(rotateArray[num]==360){
			rotateArray[num]=0;
		}
}



