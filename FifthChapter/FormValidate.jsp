<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>FormValidate</title>
<script type="text/javascript">
	$(function(){
		$(".required").each(function(){
			$(this).parent().append("<strong style='color:red;'>*</strong>");
		}).blur(function(){
			if($(this).is("#username")){
				if($(this).val()==""||$(this).val().length<6){
					$(this).parent().find(".onError").remove();
					$(this).parent().append("<span class='onError'>invalid username!</span>");
				}
			}else{
				if("\\"$(this).val()){
					$(this).parent().find(".onError").remove();
					$(this).parent().append("<span class='onError'>invalid username!</span>");
				}
			}
		});
	})
</script>
</head>
<body>
<form method="post" action="">
	<div>
		<label for="username">用户名</label>
		<input type="text" id="username" class="required" />
	</div>
	<div>
		<label for="email">邮箱</label>
		<input type="text" id="email" class="required" />
	</div>
	<div>
		<input type="submit" id="send" value="提交" />&nbsp&nbsp
		<input type="reset" id="res" value="重置" />
	</div>

</form>
</body>
</html>