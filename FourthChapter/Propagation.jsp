<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>Propagation</title>
<script type="text/javascript">
	$(function(){
		$("body,div,span").click(function(event){//event是事件对象，只有事件处理函数才能访问。事件发生时创建，事件处理函数执行完毕后销毁。
			alert($(this).html());
			//event.stopPropagation();//如果没有这一句，就会发生事件冒泡。
			return false;//效果等同于上一句。by the way,这一句也可以代替event.preventDefault()。阻止标签的默认行为。
		});
	})
</script>
</head>
<body>
body
	<div>
		div
		<span>span</span>
	</div>
</body>
</html>