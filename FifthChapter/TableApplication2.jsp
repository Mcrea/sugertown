<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>TableApplication2</title>
<script type="text/javascript">
	$(function(){
		$(".parent").click(function(){
			$(this).parent()
				   .toggleClass("open")
				   //.parent()
				   //.find("."+$(this).prop("id")).toggle();
				   .siblings("."+$(this).prop("id")).toggle()
		}).click();
	})
</script>
<style type="text/css">
table{
	text-align:center;
	margin:0 auto;
}
.open{
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
			<th>名称</th>
			<th>种族</th>
			<th>类别</th>
		</tr>
	</thead>
	<tbody>
		<tr class="open">
			<td colspan="3" class="parent" id="parent1">混血势力</td>
		</tr>
		<tr class="parent1">
			<td>马克瑞级</td>
			<td>天使</td>
			<td>战列舰</td>
		</tr>
		<tr class="parent1">
			<td>毒蜥级</td>
			<td>古斯塔斯</td>
			<td>巡洋舰</td>
		</tr>
		<tr class="open">
			<td colspan="3" class="parent" id="parent2">CG之战</td>
		</tr>
		<tr class="parent2">
			<td>希尔波拉斯级</td>
			<td>加达里合众国</td>
			<td>重型突击巡洋舰</td>
		</tr>
		<tr class="parent2">
			<td>万王宝座级</td>
			<td>盖伦特联邦</td>
			<td>战列舰</td>
		</tr>
		<tr class="open">
			<td colspan="3" class="parent" id="parent3">米玛塔尔永不为奴</td>
		</tr>
		<tr class="parent3">
			<td >地狱天使级</td>
			<td>艾玛帝国</td>
			<td>战列舰</td>
		</tr>
		<tr class="parent3">
			<td>饿狼级</td>
			<td>米玛塔尔共和国</td>
			<td>掠夺舰</td>
		</tr>
	</tbody>
</table>
</body>
</html>