<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>Event</title>
<script type="text/javascript">
	$(function(){
		$("ul li").click(function(e){
			demofunction(e);
		}).hover(function(e){
			demofunction(e);
		},function(e){
			$("#tips").remove();
			//alert(e.type);
		}).mousemove(function(e){
			//alert(e.type);
		});
	});
	function demofunction(e){
		var tips = $("<div id='tips'>触发事件为"+e.type+",id是"+e.target.id+",title是"+e.target.title+"</div>");
		$("body").append(tips);
		tips.css({"top":e.pageY,"left":e.pageX,"position":"absolute"}).show("fast");
	}

</script>
</head>
<body>
<ul>
	<li id="EVE" title="EVE is the hardest game" class="online">EVE</li>
	<li id="LOL" title="LOL is the most value game" class="online">LOL</li>
</ul>
</body>
</html>