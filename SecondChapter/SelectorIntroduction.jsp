<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SelectorIntroduction</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
</script>
<script type="text/javascript">
//只有当页面dom全部加载完之后才可以执行jQuery的动作，否则就像第二个一样无法获得jQuery对象，从而绑定事件函数失败。1、3可以。推荐1
	/* $(function(){
		$(".demo").click(function(){
		alert("wel done");
	}); */
	})
	/* $(".demo").click(function(){
		alert("wel done");
	}); */
</script>
<script type="text/javascript">
	var jqueryObject = $("p");
	//jQuery对象类似于数组对象，而且为了处理可能不存在的dom对象，jQuery采取的方式是以jQuery对象管理dom对象。
	//这样在对jQuery对象进行操作的时候，因为并没有直接对dom对象进行操作从而避免dom对象的问题影响到jQuery的逻辑


</script>
</head>
<body>
<p class="demo">click me</p>

</body>
<script type="text/javascript">
	$(".demo").click(function(){
		alert("wel done");
	});
</script>
</html>