<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TableApplication</title>
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function(){
		$("tbody>tr:even").addClass("even");
		$("tbody>tr:odd").addClass("odd");
		$("tbody :radio:checked").parents("tr").addClass("selected");//此处有无空格？
		$("tbody :checkbox:checked").parents("tr").addClass("selected");//此处有无空格？
		$("tbody>tr").click(function(){
			$(this).addClass("selected")
				   .siblings()
				   .removeClass("selected")
				   .end()//重新放回上一个对象
				   .find(":radio").prop("checked",true)
				   .end()
				   .find(":checkbox").prop("checked",!$(this).find(":checkbox").prop("checked"));
		});
	});
</script>
<style>
table{
	text-align:center;
	margin:0 auto;
}
.even{
	
	background:#FFF38F;
}
.odd{
	background:#FFFFEE;
}
.selected{
	background:red;
}
tr{
	cursor:pointer;
}
</style>
</head>
<body>
<table>
	<thead>
		<tr>
			<th></th>
			<th></th>
			<th>名称</th>
			<th>种族</th>
			<th>类别</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><input type="radio" name="choice" /></td>
			<td><input type="checkbox" /></td>
			<td>马克瑞级</td>
			<td>天使</td>
			<td>战列舰</td>
		</tr>
		<tr>
			<td><input type="radio" name="choice" /></td>
			<td><input type="checkbox" /></td>
			<td>毒蜥级</td>
			<td>古斯塔斯</td>
			<td>巡洋舰</td>
		</tr>
		<tr>
			<td><input type="radio" name="choice" /></td>
			<td><input type="checkbox" /></td>
			<td>希尔波拉斯级</td>
			<td>加达里合众国</td>
			<td>重型突击巡洋舰</td>
		</tr>
		<tr>
			<td><input type="radio" name="choice" /></td>
			<td><input type="checkbox" /></td>
			<td>万王宝座级</td>
			<td>盖伦特联邦</td>
			<td>战列舰</td>
		</tr>
		<tr>
			<td><input type="radio" name="choice" /></td>
			<td><input type="checkbox" /></td>
			<td>地狱天使级</td>
			<td>艾玛帝国</td>
			<td>战列舰</td>
		</tr>
		<tr>
			<td><input type="radio" name="choice" /></td>
			<td><input type="checkbox" /></td>
			<td>饿狼级</td>
			<td>米玛塔尔共和国</td>
			<td>掠夺舰</td>
		</tr>
	</tbody>
</table>
</body>
</html>