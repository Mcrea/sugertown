<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>WebFontSize</title>
<script type="text/javascript">
	$(function(){
		$("span").click(function(){
			var Ele = $("p").css("font-size");
			var textFontSize = parseFloat(Ele,10);//以10进制取字体大小的值，不带单位
			var unit = Ele.slice(-2);//取单位
			if($(this).prop("class")=="bigger"){
				textFontSize+=2;
			}else{
				textFontSize-=2;
			}
			$("p").css("font-size",textFontSize+unit);
		});
	});
</script>
</head>
<body>
	<div>
		<span class="bigger">放大</span><br>
		<span class="smaller">缩小</span>
	</div>
	<div>
		<p id="para">
			EVE is the BEST GAME!
		</p>
	</div>
</body>
</html>