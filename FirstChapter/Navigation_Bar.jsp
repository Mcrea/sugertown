<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Navigation bar</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function(){
		$(".level1>a").click(function(){
			if(!$(this).hasClass("current")){
				$(this).addClass("current")
				.next().show()
				.parent().siblings().children("a").removeClass("current")
				.next().hide();
			}else{
				$(this).removeClass("current")
				.next().hide();
			}
		});
	})
</script>
<style type="text/css">
.current{
	color:red;
}
</style>
</head>
<body>
	<div class="box">
		<ul class="menu">
			<li class="level1">
				<a href="#none">护卫舰</a>
				<ul class="level2">
					<li><a href="#none">德拉米尔级</a></li>
					<li><a href="#none">潜龙级</a></li>
					<li><a href="#none">十字军级</a></li>
					<li><a href="#none">磨难级</a></li>
				</ul>
			</li>
			<li class="level1">
				<a href="#none">巡洋舰</a>
				<ul class="level2">
					<li><a href="#none">希尔波拉斯级</a></li>
					<li><a href="#none">海神级</a></li>
					<li><a href="#none">塞那波级</a></li>
					<li><a href="#none">复仇女神级</a></li>
				</ul>
			</li>
			<li class="level1">
				<a href="#none">战列舰</a>
				<ul class="level2">
					<li><a href="#none">马克瑞级</a></li>
					<li><a href="#none">多米尼克斯级</a></li>
					<li><a href="#none">末日沙场级</a></li>
					<li><a href="#none">台风级</a></li>
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>