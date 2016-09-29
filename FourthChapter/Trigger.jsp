<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>Trigger</title>
<script type="text/javascript">
	$(function(){
		$("#glk").click(function(){
			alert("the bullet is flying~~");
		});
		$("#trigger").click(function(){
			$("#glk").trigger("click");//也可以绑定一个自定义事件的函数，让trigger来触发
		});
		//trigger传递参数的介绍先放一放吧，里面牵扯到js函数参数的问题
		$("#text").focus(function(){
			$(this).val("love~");
		});
		$("#trigger2").click(function(){
			//$("#text").trigger("focus");
			$("#text").triggerHandler("focus");//阻止默认行为，在这里focus的默认行为是让文本框获得焦点
		});
	});
</script>
</head>
<body>
<div id="glk">this is a ordinary gun,click here and let the bullet fly</div>
<input type="text" id="text" />
<input type="button" id="trigger2" value="trigger2" title="这个用来测试是否执行默认操作" />
<input type="button" id="trigger" value="trigger" title="this is a magic button that make the gun fire" />
</body>
</html>