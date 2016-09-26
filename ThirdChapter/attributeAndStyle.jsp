<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>attributeAndStyle</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function(){
		//属性操作
		$("#button1").click(function(){
			var title = $("ul:first li:eq(1)").attr("title");
			alert(title);
		});
		$("#button2").click(function(){
			var $li = $("ul:first li:eq(1)");
			alert("设置前title属性值是"+$li.attr("title"));
			//$li.attr("title","lol");
			$li.attr({"title":"lol","class":"alex"});//一次设置多个属性值，参数为一个js对象
			alert("设置后title属性值是"+$li.attr("title"));//在这里就可以直接看到设置的结果
		});
		$("#button3").click(function(){
			var $li = $("ul:first li:eq(1)");
			alert("删除前title属性值是"+$li.attr("title"));
			$li.removeAttr("title");
			alert("删除后title属性值是"+$li.attr("title"));//
		});
		//样式操作
		//样式操作与属性操作有一点相似的地方，但是样式操作比属性操作要略微复杂
		$("#button4").click(function(){
			var $li = $("ul:first li:eq(1)");//追加样式的关键在于不会覆盖元素原来存在的样式
			$li.addClass("another");
			
		});
		$("#button5").click(function(){
			var $li = $("ul:first li:eq(1)");
			$li.removeClass();//删除样式，参数是class属性的某个值，也可以一次删除多个属性，值用空格分开。或者不加参数，全部删除，此时class值为空，但是class属性还在
		});
		$("#button6").click(function(){
			var $li = $("ul:first li:eq(1)");
			$li.toggleClass("another");//amazing!
		});
		$("#button7").click(function(){
			var $li = $("ul:first li:eq(1)");
			alert($li.hasClass("another"));
			alert($li.is(".another"));//上下等同。jQuery内部调用
		});
		//html and text
		$("#button8").click(function(){
			var $li = $("ul:first li:eq(1)");
			$li.html("<strong>2moons</strong>");
		});
		//text()方法会获取所有后代节点的文本。而在设置的时候直接将子标签元素覆盖掉。只剩下文本元素
		$("#button9").click(function(){
			var $li = $("ul:first li:eq(1)");
			$li.text("lol");//这个方法会覆盖标签
		});
	})

</script>
<style type="text/css">
.high{
	font-weight:bold;
	color:red;
}
.another{
	font-style:italic;
	color:blue;
}
</style>
</head>
<body>
<p>你最喜欢的游戏是？</p>
<ul>
	<li title="EVE">EVE</li>
	<li title="英雄联盟" class="high">英雄联盟</li>
	<li title="三国杀">三国杀</li>
</ul>
<p>有关操作</p>
<ul>
	<li><input type="button" value="获取属性" id="button1"></li>
	<li><input type="button" value="设置属性" id="button2"></li>
	<li><input type="button" value="删除属性" id="button3"></li>
	<li><input type="button" value="追加样式" id="button4"></li>
	<li><input type="button" value="删除样式" id="button5"></li>
	<li><input type="button" value="切换样式" id="button6"></li>
	<li><input type="button" value="判断" id="button7"></li>
	<li><input type="button" value="html()" id="button8"></li>
	<li><input type="button" value="text()" id="button9"></li>
</ul>
</body>
</html>