<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQueryObjectAndDom</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("#Alex").click(function(){
			//this变量就是dom对象，jQuery对象和dom对象可以进行转换。取决于你想使用的方法
			var $j = $(this);
			var dom = $j.get(0);
			//if($j.is(":checked")){
			if(this.checked){
				alert("to be");
			}else{
				alert("not to be");
			}
		});
	})
</script>
</head>
<body>
<input type="checkbox" id="Alex"><label for="Alex">to be or not to be</label>

</body>
</html>