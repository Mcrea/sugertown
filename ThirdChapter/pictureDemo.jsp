<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pictureDemo</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function(){
		$(".tooltip").mouseover(function(e){
			$div = $("<div>"+123+"</div>");
			$("body").append($div);
			$div.css({"top":(e.pageY+10)+"px",
					  "left":(e.pageX+10)+"px",
					  "position":"absolute"//这一句书上没有写，很坑
					  })
			    .show("fast");
		}).mouseout(function(){
			$("div").remove();
		}).mousemove(function(e){
			$div.css({"top":(e.pageY+10)+"px",
				  "left":(e.pageX+10)+"px",
				  "position":"absolute"//这一句书上没有写，很坑
				  })
				.show("fast");
		});
		$("#eve").mouseover(function(e){
			$div = $("<img id='bigeve' alt='picture' src='"+$(this).attr("src")+"' />");
			$("body").append($div);
			$div.css({"top":(e.pageY+10)+"px",
					  "left":(e.pageX+10)+"px",
					  "position":"absolute"//这一句书上没有写，很坑
					  })
			    .show("fast");
		}).mouseout(function(){
			$("#bigeve").remove();
		}).mousemove(function(e){
			$("#bigeve").css({"top":(e.pageY+10)+"px",
				  			  "left":(e.pageX+10)+"px",
				  			  "position":"absolute"//这一句书上没有写，很坑
				 			 })
					    .show("fast");
		});
	});
</script>
</head>
<body>
<p><a href="#" title="tips">this is a link</a></p>
<p><a href="#" class="tooltip">this is another link</a></p>
<p><img id="eve" alt="picture" src="../images/286365666496.jpg" width="100" /></p>
</body>
</html>