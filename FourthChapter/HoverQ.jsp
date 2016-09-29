<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hoverQ</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
$(function(){
	$("ul li").hover(function(){
					$(this).toggleClass("mark");
				  },function(){
					$(this).toggleClass("mark");
				  });
});
</script>
<style>
.mark{
	color:red;
}
</style>
</head>
<body>
<p>你最喜欢的游戏是？</p>
<ul>
	<li title="EVE">EVE</li>
	<li title="英雄联盟">英雄联盟</li>
	<li title="三国杀">三国杀</li>
</ul>
</body>
</html>