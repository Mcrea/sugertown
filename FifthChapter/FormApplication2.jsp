<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>FormApplication2</title>
<script type="text/javascript">
	$(function(){
		$("#rightOne").click(function(){
			$("#select1 option:selected").appendTo($("#select2"));
		});
		$("#rightAll").click(function(){
			$("#select1 option").appendTo($("#select2"));
		});
		$("#leftOne").click(function(){
			$("#select2 option:selected").appendTo($("#select1"));
		});
		$("#leftAll").click(function(){
			$("#select2 option").appendTo($("#select1"));
		});
		$("option").dblclick(function(){
			var id = $(this).parent().attr("id");
			if(id=="select1"){
				$(this).appendTo("#select2");
			}else{
				$(this).appendTo("#select1");
			}
		});
	})
</script>
<style type="text/css">
.list,#center{
	float:left;
}
#center{
	height:300px;
}
#select1,#select2{
	width:150px;
	height:300px;
}
input{
	width:39px;
	height:20px;
}
</style>
</head>
<body>
	<div class="list">
		<select multiple id="select1">
			<option value="地狱天使">地狱天使</option>
			<option value="末日沙场">末日沙场</option>
			<option value="灾难">灾难</option>
			<option value="台风">台风</option>
			<option value="狂暴">狂暴</option>
			<option value="死亡漩涡">死亡漩涡</option>
			<option value="鹏鲲">鹏鲲</option>
			<option value="乌鸦">乌鸦</option>
			<option value="毒蝎">毒蝎</option>
			<option value="亥伯龙神">亥伯龙神</option>
			<option value="万王宝座">万王宝座</option>
			<option value="多米尼克斯">多米尼克斯</option>
		</select>
	</div>
	<div id="center">
		<input type="button" id="rightOne" value=">|"><br>
		<input type="button" id="rightAll" value=">>"><br>
		<input type="button" id="leftOne" value="|<"><br>
		<input type="button" id="leftAll" value="<<">
	</div>
	<div class="list">
		<select multiple id="select2">
		</select>
	</div>
</body>
</html>