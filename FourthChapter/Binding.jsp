<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>binding</title>
<script type="text/javascript">
	$(function(){
		$("div.box").bind("click",fun1 = function(){//这样写是为了可以移除指定函数
			$("body").append("<div id='function1'>function1 is executed</div>");
		}).bind("click",fun2 = function(){
			$("body").append("<div id='function2'>function2 is executed</div>");
		}).bind("mouseover",fun3 = function(){
			$("body").append("<div id='function3'>function3 is executed</div>");
		}).bind("mouseout",fun4 = function(){
			$("#function3").remove();
		});
		$("div.one").one("click",fun1 = function(){//处理函数只执行一次，随后移除。
			alert("HELLO!");
		})
		$("#button1").bind("click",function(){
			$("div.box").unbind("click",fun1);//unbind([type],[data])
		});
		$("#button2").bind("click",function(){
			$("div.box").unbind("mouseover").unbind("mouseout");
		});
		$("#button3").bind("click",function(){
			$("div.box").unbind();
		});
	})
</script>
</head>
<body>
<div class="box">click here</div>
<div class="one">click here and say hello only once</div>
<input type="button" id="button1" value="移除指定函数" />
<input type="button" id="button2" value="移除指定事件函数" />
<input type="button" id="button3" value="移除全部函数" />
</body>
</html>