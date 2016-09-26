<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery_dom</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function(){
		//插入节点，在连续插入节点的时候注意节点的位置随着插入节点到进行已经改变，谨慎处理。
		$("#button1").click(function(){
			var $li = $("<li title='洛奇英雄传'>洛奇英雄传</li>");//jQuery创建节点
			$("ul:first").append($li);
		});
		$("#button2").click(function(){
			var $li = $("<li title='洛奇英雄传'>洛奇英雄传</li>");//jQuery创建节点
			//$("ul:first").append($li);
			$li.appendTo("ul:first");
		});
		$("#button3").click(function(){
			var $li = $("<li title='洛奇英雄传'>洛奇英雄传</li>");//jQuery创建节点
			//$("ul:first").prepend($li);
			$li.prependTo("ul:first");
		});
		$("#button4").click(function(){
			var $li = $("<li title='洛奇英雄传'>洛奇英雄传</li>");//jQuery创建节点
			//$("ul:first li:eq(1)").after($li);
			$li.insertAfter("ul:first li:eq(1)");//注意方法的参数（不一定非要jQuery对象）
		});
		$("#button5").click(function(){
			var $li = $("<li title='洛奇英雄传'>洛奇英雄传</li>");//jQuery创建节点
			//$("ul:first li:eq(1)").before($li);
			$li.insertBefore("ul:first li:eq(1)");
		});
		//移动节点
		$("#button6").click(function(){
			var $li = $("ul:first li:eq(1)");//获取想要移动的节点，然后插入预期的位置即可
			$li.insertBefore("ul:first li:eq(0)");
		});
		//删除节点
		$("#button7").click(function(){
			//var $li = $("ul:first li：eq(1)").remove();//这个方法可以返回被删除的节点的引用，我们可以继续使用
			var $re = $("ul:last li:eq(0)").remove();//比如插入等。而且后代是级联删除的。方法可以有参数，但是
			$("ul:last li:eq(0)").before($re);    //参数只能起到缩小范围的作用,但是如果加入了参数，在某些方面会有不同。待续
		});
		$("#button8").click(function(){
			var $li = $("ul:last li:eq(0)");//detach()删除后恢复的节点的事件依然存在，remove()则不会
			var $re = $li.detach();
			$("ul:last li:eq(0)").before($re);
		});
		$("#button9").click(function(){
			var $li = $("ul:first li:eq(1)");
			$li.empty();
		});
		//复制节点
		$("#button10").click(function(){
			var $li = $("ul:last li:eq(1)").clone(true);//true同时复制节点绑定的事件，false只复制节点，无绑定事件
			$li.appendTo("ul:last");
		});
		//替换节点（绑定事件会丢失，需要重新绑定）
		$("#button11").click(function(){
			var $p = $("<strong>在线人数只有五位数的游戏是？</strong>");
			//$("p:first").replaceWith($p[0]);参数可以是jQuery对象或者dom对象或者html标签
			$p.replaceAll("p:first");//这里的作用和上面这个相同。jQuery的方法貌似可以是选择器表达式即可，不一定必须是jQuery对象
		});
		//包裹节点
		
		$("#button12").click(function(){
			$("ul:first li").wrap("<b></b>");//依次单条包裹
		});
		$("#button13").click(function(){
			$("ul:first li").wrapAll("<b></b>");//全部包裹起来，如果内部有非选定元素，这个元素会被排到后面
		});
		$("#button14").click(function(){
			$("ul:first li").wrapInner("<b></b>");//内部包裹，包裹字节点和文本
		});
	});
</script>
</head>
<body>
<p>你最喜欢的游戏是？</p>
<ul>
	<li title="EVE">EVE</li>
	<li title="英雄联盟">英雄联盟</li>
	<li title="三国杀">三国杀</li>
</ul>
<p>有关操作</p>
<ul>
	<li><input type="button" value="创建并插入节点" id="button1"></li>
	<li><input type="button" value="内部追加" id="button2"></li>
	<li><input type="button" value="内部前插" id="button3"></li>
	<li><input type="button" value="相邻追加" id="button4"></li>
	<li><input type="button" value="相邻前插" id="button5"></li>
	<li><input type="button" value="移动节点" id="button6"></li>
	<li><input type="button" value="remove()" id="button7"></li>
	<li><input type="button" value="detach()" id="button8"></li>
	<li><input type="button" value="empty()" id="button9"></li>
	<li><input type="button" value="复制节点" id="button10"></li>
	<li><input type="button" value="替换节点" id="button11"></li>
	<li><input type="button" value="wrap()" id="button12"></li>
	<li><input type="button" value="wrapAll()" id="button13"></li>
	<li><input type="button" value="wrapInner()" id="button14"></li>
</ul>
</body>
</html>