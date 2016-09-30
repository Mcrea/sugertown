<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-3.1.0.js"></script>
<title>TableApplication3</title>
<script type="text/javascript">
	$(function(){//firefox无效，chrome有效
		$("#keyword").keyup(function(){
			$("tbody>tr").hide()
						 .filter(":contains('"+($(this).val())+"')").show();
		}).keyup();
	});
</script>
<style>
fieldset,table{
	text-align:center;
	margin:0 auto;
}
tr{
	cursor:pointer;
}

</style>
</head>
<body>
<fieldset>
	<legend>速查表</legend>
	<label for="keyword">关键字</label>
	<input type="text" id="keyword" />
	<table>
		<thead>
			<tr>
				<th>名称</th>
				<th>种族</th>
				<th>类别</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>马克瑞级</td>
				<td>天使</td>
				<td>战列舰</td>
			</tr>
			<tr>
				<td>毒蜥级</td>
				<td>古斯塔斯</td>
				<td>巡洋舰</td>
			</tr>
			<tr>
				<td>希尔波拉斯级</td>
				<td>加达里合众国</td>
				<td>重型突击巡洋舰</td>
			</tr>
			<tr>
				<td>万王宝座级</td>
				<td>盖伦特联邦</td>
				<td>战列舰</td>
			</tr>
			<tr>
				<td>地狱天使级</td>
				<td>艾玛帝国</td>
				<td>战列舰</td>
			</tr>
			<tr>
				<td>饿狼级</td>
				<td>米玛塔尔共和国</td>
				<td>掠夺舰</td>
			</tr>
	</tbody>
</table>
</fieldset>
</body>
</html>