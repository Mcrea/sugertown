<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>Animation</title>
<script type="text/javascript">
	$(function(){
		//$("#text").css("display","block");元素css属性的初始值会被记录下来。
		$("#text").css("display","none");
		$("p").hover(function(){
			//$("#text").show("slow");//参数值可以是fast、normal或者是数字，单位是毫秒。下同。长、宽、不透明度都会改变
			//$("#text").fadeIn(5000);//只改变不透明度
			$("#text").stop()
					  .slideDown(5000);//只改变高度
		},function(){
			//$("#text").hide(5000);//从firebug可以看到元素style属性值的变化
			//$("#text").fadeOut(5000);
			$("#text").stop()
					  .slideUp(5000);
		});
		$("#box").click(function(){
			//$(this).animate({"left":"+=500px"},"slow");//+=500px是累加。如果没有+=，那么是一个固定值。animate函数实质是在规定时间内将元素的样式调整到参数给定的样式。
			$(this).animate({"left":"500px"},5000)//动画队列
				   .animate({"width":"1000px","height":"1000px","left":"200px"},"fast")
				   .fadeOut(5000,function(){
					   alert("gone with the wind");//回调函数会在动画执行完毕后执行，如果用链式方式调用非动画方法，由于非动画方法不会加入动画队列，所以会立即执行。
				   });
		}).hover(function(){
			$(this).stop(true,false);//stop可以立即停止当前正在执行的动画，根据参数来决定下一步的执行。第一个参数决定是否清空未执行的动画队列，第二个参数决定是否将元素跳到当前动画的末状态。无他
		},function(){
			//$(this).is(":animated");判断是否在动画中
		});
	})
</script>
<style>
#box{
	position:absolute;
	width:200px;
	height:200px;
	border:1px solid #0050D0;
	background:#96E555;
	cursor:pointer;
}
</style>
</head>
<body>
<p>jQuery动画</p>
<div id="text">show()和hide()是jQuery中最基本的动画方法，hide()在把display属性设置为none之前，会记住原先的display属性值（block or inline or anything else except none）
当执行show()方法时会根据hide()记住的属性值来显示元素。</div>
<br>
<div id="box">要把元素的position样式设置为position或relative，才可以修改该元素的left、top、right、bottom</div>
</body>
</html>