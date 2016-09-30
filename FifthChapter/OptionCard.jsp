<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>OptionCard</title>
<script type="text/javascript">
	$(function(){
		$("#tabs li").click(function(){
			var index = $("#tabs li").index(this);
			$(".tab_con").eq(index).show()
						 .siblings().hide();
		});
		$("#tabs li:eq(0)").click();
	})
</script>
<style type="text/css">
body,ul,li{margin: 0;padding: 0;font: 12px normal "宋体", Arial, Helvetica, sans-serif;list-style: none;}
a{text-decoration: none;color: #000;font-size: 14px;}

#tabbox{ width:600px; overflow:hidden; margin:0 auto;}
.tab_conbox{border: 1px solid #999;border-top: none;}
.tab_con{ display:none;}

.tabs{height: 32px;border-bottom:1px solid #999;border-left: 1px solid #999;width: 100%;}
.tabs li{height:31px;line-height:31px;float:left;border:1px solid #999;border-left:none;margin-bottom: -1px;background: #e0e0e0;overflow: hidden;position: relative;}
.tabs li a {display: block;padding: 0 20px;border: 1px solid #fff;outline: none;}
.tabs li a:hover {background: #ccc;}    
.tabs .thistab,.tabs .thistab a:hover{background: #fff;border-bottom: 1px solid #fff;}

.tab_con {padding:12px;font-size: 14px; line-height:175%;}
</style>
</head>
<body>
<div id="tabbox">

    <ul class="tabs" id="tabs">
       <li><a href="#">学汇</a></li>
       <li><a href="#">百川</a></li>
       <li><a href="#">德济</a></li>
       <li><a href="#">四海</a></li>
    </ul>
    <ul class="tab_conbox">
        <li id="tab1" class="tab_con">
           <p>1</p>
        </li>
            
        <li id="tab2" class="tab_con">
            <p>2</p>
        </li>
    
        <li id="tab3" class="tab_con">
            <p>3</p>
        </li>
    
        <li id="tab4" class="tab_con">
            <p>4</p>
        </li>
    </ul>
    
</div>
</body>
</html>