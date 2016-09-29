<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>AnimationDemo</title>
<script type="text/javascript">
	$(function(){
		$("#forward").click(function(e){
			$("img:first").animate({"margin-left":"-=155px"},"slow");
			e.preventDefault();
		});
		$("#backward").click(function(e){
			$("img:first").animate({"margin-left":"+=155px"},"slow");
			e.preventDefault();
		});
		$(".little").click(function(e){
			$(".big").attr("src",e.target.src)
					 .attr("title",e.target.alt);;
		});
	});
</script>
<style type="text/css">
#picbar{
	margin:0 auto;
	height:100px;
	width:615px;
	overflow:hidden;
}
.little{
	height:100px;
	width:150px;
	top:0;
}
.big{
	height:300px;
	width:500px;
}
#button{
	text-align:center;
}
#origin{
	margin:0 auto;
	height:300px;
	width:500px;
}
</style>
</head>
<body>
<div id="picbar">
<img class="little" alt="寒鸭级战术驱逐舰"  src="../images/286365666496.jpg">
<img class="little" alt="阿尔格斯级驱逐舰" src="../images/114d2f0c1cfa61d15065ea206ea02e5a.jpg">
<img class="little" alt="龙卷风级战列巡洋舰" src="../images/1cce01d766b0d951511dc0b8cdc9ae6c.jpg">
<img class="little" alt="多米尼克斯级战列舰" src="../images/1ef1892ea80ec0053b3eecc6014d90f4.jpg">
<img class="little" alt="龙骑兵级驱逐舰" src="../images/2ed729b737819b9fa91f4fdbc613e3e9.jpg">
<img class="little" alt="神使级泰坦" src="../images/48a5301af5a26fa20bc53724b55b647d.jpg">
<img class="little" alt="蝎尾怪级隐形轰炸舰" src="../images/ce1bce358c9b6efe18b0703484fb11a2.jpg">
<img class="little" alt="黑夜级打捞舰" src="../images/d8863fd6e2f0bacd647190885b297185.jpg">
<img class="little" alt="战狼级护卫舰" src="../images/f47a95c4475d62f51cf33dd9d75adac0.jpg">
<img class="little" alt="马克瑞级战列舰" src="../images/f6aad372fba488d4d86f2d586ea1e314.jpg">
</div>
<div id="button">
<a id="forward" href="#">向前</a>&nbsp&nbsp<a id="backward" href="#">向后</a>
</div>
<div id="origin">
<img class="big" alt="" title="" src="../images/1ef1892ea80ec0053b3eecc6014d90f4.jpg">
</div>
</body>
</html>