<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>FormApplication</title>
<script type="text/javascript">
	$(function(){
		$("#race").focus(function(){
			$(this).addClass("focus");
		}).blur(function(){
			$(this).removeClass("focus");
		});
		$("#increase").click(function(){
			if(!$("#origin").is(":animated")){
				if($("#origin").height()<200){
					$("#origin").animate({height:"+=50px"},"slow");
				}else{
					alert("please don't click again");
				}
			}
		});
		$("#reduce").click(function(){
			if(!$("#origin").is(":animated")){
				if($("#origin").height()>50){
					$("#origin").animate({height:"-=50px"},"slow");
				}else{
					alert("please don't click again");
				}	
			}
		});
		$("#up").click(function(){
			if(!$("#origin").is(":animated")){
				$("#origin").animate({scrollTop:"-=50px"},"slow");
			}
		});
		$("#down").click(function(){
			if(!$("#origin").is(":animated")){
				$("#origin").animate({scrollTop:"+=50px"},"slow");
			}
		});
		$("#AllorNo").click(function(){//attr和prop的不同，prop函数是jQuery1.6之后新增的，待续。
			//alert(this.checked);//true or false
			//alert($(this).attr("checked"));//元素属性的初始值，如果没有初始值则为空
			//alert($(this).prop("checked"));//true or false
			$("[name=technology]").prop("checked",$(this).prop("checked"));
		});
		$("#checkrev").click(function(){
			$("[name=technology]").each(function(){
				$(this).prop("checked",!this.checked);
			});//只能依次设置
			$("[name=technology]").trigger("change");//问题：在js中修改了复选框的属性但是没有触发change方法。
		});
		$("[name=technology]").change(function(){
			var result = true;
			$("[name=technology]").each(function(){
				result = result&&($(this).prop("checked"));
			});
			$("#AllorNo").prop("checked",result);
		});
		
	});
</script>
<style type="text/css">
.focus{
	background:red;
}
</style>
</head>
<body>
<fieldset>
	<legend>渡神级货舰</legend>
	<div>
		<label for="race">种族</label>
		<input type="text" id="race"><br>
		<div>
			<input type="button" id="increase" value="increase">
			<input type="button" id="reduce" value="reduce">
			<input type="button" id="up" value="up">
			<input type="button" id="down" value="down">
		</div>
		<label for="origin">起源</label>
		<textarea id="origin" rows="10" cols="23"></textarea>
	</div>
	<div>
		<span>技能需求</span>&nbsp&nbsp&nbsp<input type="checkbox" id="AllorNo" />全选/全不选<br>
		<input type="checkbox" name="technology" value="高级飞船操控学" />高级飞船操控学
		<input type="checkbox" name="technology" value="飞船操控学" />飞船操控学
		<input type="checkbox" name="technology" value="加达里货舰操作" />加达里货舰操作
		<input type="checkbox" name="technology" value="加达里工业舰操作" />加达里工业舰操作<br>
		<input type="button"  id="checkrev" value="反选" />
	</div>
</fieldset>
</body>
</html>