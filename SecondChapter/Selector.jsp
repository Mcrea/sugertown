<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Selector</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
//基本选择器，id class tag等
	$(function(){
		function perform($obj){
			if($obj.is(".second")){
				$obj.removeClass("second");
				$obj.css("background","#aaa");
			}else{
				$obj.addClass("second");
				$obj.css("background","#bbffaa");
			}
		}
		$("#button1").click(function(){
			var $obj = $("#one");
			perform($obj);
		});
		$("#button2").click(function(){
			var $obj = $(".mini");
			perform($obj);
		});
		$("#button3").click(function(){
			var $obj = $("div");
			perform($obj);
		});
		$("#button4").click(function(){
			var $obj = $("*");
			perform($obj);
		});
		$("#button5").click(function(){
			var $obj = $("span,#two");
			perform($obj);
		});
	//层次选择器
		$("#button6").click(function(){
			var $obj = $("body div");
			perform($obj);
		});
		$("#button7").click(function(){
			var $obj = $("body>div");
			perform($obj);
		});
		$("#button8").click(function(){
			//var $obj = $("#one+div");
			var $obj = $("#one").next("div");
			perform($obj);
		});
		$("#button9").click(function(){
			//var $obj = $("#one~div");
			var $obj = $("#one").nextAll("div");
			perform($obj);
		});
		$("#button10").click(function(){
			//var $obj = $("#two").nextAll("div");
			//var $obj = $("#two").siblings("div");
			var $obj = $("[title=tesst]").siblings("div");
			perform($obj);
		});
	//过滤选择器(过滤选择器是一般选择器的补充)
		//基本过滤
		$("#button11").click(function(){
			var $obj = $("div:first");
			perform($obj);
		});
		$("#button12").click(function(){
			//var $obj = $("#one~div");
			var $obj = $("div:last");
			perform($obj);
		});
		$("#button13").click(function(){
			var $obj = $("div:not(#one)");
			perform($obj);
		});
		$("#button14").click(function(){
			var $obj = $("div:even");
			perform($obj);
		});
		$("#button15").click(function(){
			var $obj = $("div:odd");
			perform($obj);
		});
		$("#button16").click(function(){
			var $obj = $("div:eq(3)");
			perform($obj);
		});
		$("#button17").click(function(){
			var $obj = $("div:gt(3)");
			perform($obj);
		});
		$("#button18").click(function(){
			var $obj = $("div:lt(3)");
			perform($obj);
		});
		$("#button19").click(function(){
			var $obj = $(":header");
			perform($obj);
		});
		/* $("#button20").click(function(){
			var $obj = $("div:focus");
			perform($obj);
		}); */
		//内容过滤(文本和子元素)
		$("#button21").click(function(){
			var $obj = $("div:contains(one)");
			perform($obj);
		});
		$("#button22").click(function(){
			var $obj = $("div:empty()");
			perform($obj);
		});
		$("#button23").click(function(){
			var $obj = $("div:has(div)");
			perform($obj);
		});
		$("#button24").click(function(){
			var $obj = $("div:parent");
			perform($obj);
		});
		//可见性过滤
		$("#button25").click(function(){
			var $obj = $("div:visible");
			perform($obj);
		});
		$("#button26").click(function(){
			var $obj = $("div:hidden");
			$obj.show(3000);
		});
		//属性过滤
		$("#button27").click(function(){
			var $obj = $("div[title]");
			perform($obj);
		});
		$("#button28").click(function(){
			var $obj = $("div[title=test]");
			perform($obj);
		});
		$("#button29").click(function(){
			var $obj = $("div[title!=test]");
			perform($obj);
		});
		$("#button30").click(function(){
			var $obj = $("div[title^=te]");
			perform($obj);;
		});
		$("#button31").click(function(){
			var $obj = $("div[title$=sst]");
			perform($obj);
		});
		$("#button32").click(function(){
			var $obj = $("div[title*=th]");
			perform($obj);
		});
		$("#button33").click(function(){
			var $obj = $("div[title|=te]");
			perform($obj);
		});
		$("#button34").click(function(){
			var $obj = $("div[title~=sk]");
			perform($obj);
		});
		$("#button35").click(function(){
			var $obj = $("div[id][title=test]");
			perform($obj);
		});
		//子元素过滤选择器
		$("#button36").click(function(){
			//var $obj = $("div.one :nth-child(2)");
			//var $obj = $("div.mini:nth-child(2)");
			var $obj = $("div .mini:nth-child(2)");
			perform($obj);
		});
		$("#button37").click(function(){
			var $obj = $("div.one :first-child");
			perform($obj);
		});
		$("#button38").click(function(){
			var $obj = $("div.one :last-child");
			perform($obj);
		});
		$("#button39").click(function(){
			var $obj = $("div.one :only-child");
			perform($obj);
		});
	});
</script>
<style type="text/css">
div,span,p{
	width:140px;
	height:140px;
	margin:5px;
	background:#aaa;
	border:#000 1px solid;
	float:left;
	font-size:17px;
	font-family:Verdana;
}
div.mini{
	width:55px;
	height:55px;
	background-color:#aaa;
	font-size:12px;
}
div.hide{
	display:none;
}
</style>
</head>
<body>
<div class="one" id="one">
	id is one，class is one；
	<div class="mini">class is mini;</div>
</div>
<div class="one" id="two" title="test">
	id is one，class is two,title is test；
	<div class="mini" title="other">class is mini,title is other;</div>
	<div class="mini" title="test">class is mini,title is test;</div>
</div>
<div class="one">
	<div class="mini">class is mini;</div>
	<div class="mini">class is mini;</div>
	<div class="mini">class is mini;</div>
	<div class="mini"></div>
</div>
<div class="one">
	<div class="mini" title="te-sk">class is mini,title is te-sk;</div>
	<div class="mini" title="te sk">class is mini,title is te sk;</div>
	<div class="mini" title="tesk">class is mini,title is tesk;</div>
	<div class="mini" title="tesst">class is mini,title is tesst;</div>
</div>
<div style="display:none;" class="none" title="te">
	style's display is none;
</div>
<div class="hide">class is hide</div>
<div>
	include input with type is hidden;<input type="hidden" size="8" />
</div>
<span id="mover">span is moving~</span>
<br><br><br><br><br><br><br><br>
<h3>基本选择器</h3>
<input type="button" id="button1" value="#one" />
<input type="button" id="button2" value=".mini" />
<input type="button" id="button3" value="div" />
<input type="button" id="button4" value="*" />
<input type="button" id="button5" value="span.#two" /><br>
<h3>层次选择器</h3>
<input type="button" id="button6" value="ancestor descendant" />
<input type="button" id="button7" value="parent>child" />
<input type="button" id="button8" value="prev+next" />
<input type="button" id="button9" value="prev~siblings" />
<input type="button" id="button10" value="siblings()" /><br>
<h3>基本过滤选择器</h3>
<input type="button" id="button11" value=":first" />
<input type="button" id="button12" value=":last" />
<input type="button" id="button13" value="not(selector)" />
<input type="button" id="button14" value=":even" />
<input type="button" id="button15" value=":odd" />
<input type="button" id="button16" value="eq()" />
<input type="button" id="button17" value="gt()" />
<input type="button" id="button18" value="lt()" />
<input type="button" id="button19" value=":header" />
<input type="button" id="button20" value=":animate" />
<input type="button" id="button20" value=":focus" /><br>
<h3>内容过滤选择器</h3>
<input type="button" id="button21" value=":contains(text)" />
<input type="button" id="button22" value=":empty" />
<input type="button" id="button23" value=":has(selector)" />
<input type="button" id="button24" value=":parent" /><br>
<h3>可见性过滤选择器</h3>
<input type="button" id="button25" value=":visible" />
<input type="button" id="button26" value=":hidden" /><br>
<h3>属性过滤选择器</h3>
<input type="button" id="button27" value="[attribute]" />
<input type="button" id="button28" value="[attribute=value]" />
<input type="button" id="button29" value="[attribute!=value]" />
<input type="button" id="button30" value="[attribute^=value]" />
<input type="button" id="button31" value="[attribute$=value]" />
<input type="button" id="button32" value="[attribute*=value]" />
<input type="button" id="button33" value="[attribute|=value]" />
<input type="button" id="button34" value="[attribute~=value]" />
<input type="button" id="button35" value="[attribute1][attribute2][attribute3]" /><br>
<h3>属性过滤选择器</h3>
<input type="button" id="button36" value=":nth-child(index/odd/even/equation)" />
<input type="button" id="button37" value=":first-child" />
<input type="button" id="button38" value=":last-child" />
<input type="button" id="button39" value=":only-child" /><br>
</body>

</html>