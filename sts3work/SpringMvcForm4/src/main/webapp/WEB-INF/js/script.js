/**
 * 
 */

$(function(){
	
	//초기이미지
	$("#myimg").attr("src","../image/너의이름은.jpeg");
	
	//이벤트
	$("#myimg").hover(function(){
		
		$(this).attr("src","../image/드림.jpg");
	},function(){
		
		$(this).attr("src","../image/너의이름은.jpeg");
	});
});