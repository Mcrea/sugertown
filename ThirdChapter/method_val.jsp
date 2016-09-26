<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>method_val</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function(){
		//清空和还原文本框
		$("#username").focus(function(){
			if($(this).val()==this.defaultValue){//defaultValue是dom对象的一个属性，不属于jQuery的方法
				$(this).val("");
			}
		});
		$("#username").blur(function(){
			if($(this).val()==""){
				$(this).val(this.defaultValue);
			}
		});
		//val()方法获取值
		$("#button1").click(function(){
			var $checkbox = $("#multiple");//当dom是一个select标签的时候，val()方法才会显示出所有被选择的值。同样，如果你把jQuery对象当成一个存放多个值的数组，那么val()方法只会显示第一个元素的值
			//var $checkbox = $(":checkbox:checked");//复选框即使多选，val()也只显示第一个元素的值
			alert($checkbox.val());
		});
		$("#button2").click(function(){
			var $checkbox = $("#multiple");
			$checkbox.val(["C","Java"]);//多个值无非就是数组的形式，复选框同理，其余处理单个值的都相同
			//$(":checkbox").val(["check2","check3"]);
		});
	})
</script>
</head>
<body>
<form>
<input type="text" id="username" value="请输入用户名" />
<select id="language">
	<option>C</option>
	<option>Java</option>
	<option>Python</option>
</select>
<select id="multiple" multiple="multiple" style="height:120px;">
	<option selected="selected">C</option>
	<option>Java</option>
	<option>Python</option>
</select>
<input type="checkbox" value="check1" name="checkboxx" />多选1
<input type="checkbox" value="check2" name="checkboxx" />多选2
<input type="checkbox" value="check3" name="checkboxx" />多选3
<input type="radio" value="radio1" name="radiox" />单选1
<input type="radio" value="radio2" name="radiox" />单选2
<input type="radio" value="radio3" name="radiox" />单选3
<input type="button" value="获取多选类型的val()" id="button1" />
<input type="button" value="设置多选类型的val()" id="button2" />
</form>
</body>
</html>