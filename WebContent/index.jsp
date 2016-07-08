<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>
	<style type="text/css">
		form{
			width: 500px;
			height:300px;
			margin: auto;
			border: 1px solid black;
			
		}
		span{
			font-size: 25px;
			margin-left: 0px;
			float:left;
		}
		input{
			margin-left: 50px;
		}
	</style>
</head>
<body>
	<center>
	<table width="100%" rules="all">
		<tr>
			<th>Student ID</th>
			<th>Student Name</th>
			<th>Action</th>	
		</tr>
		<tr>
			<td>S001</td>
			<td>SS</td>
			<td>Delete</td>
		</tr>
	</table>
	<br>
	<hr>
	<br>
		<form action="">
		<tr>
			<td><span>Student ID:</span></td>
			<td><input type="text" id="stu_id"></td>
		</tr>
		<br>
		<tr>
			<td><span>Student Name:</span></td>
			<td><input type="text" id="stu_name"></td>
		</tr>	
		<tr>
			<td><input type="button" onClick="insert()" value="Add">	</td>
		</tr>
		</form>
	</center>
</body>
<input type="hidden" id="url" value="${pageContext.request.contextPath}">
<script type="text/javascript">
	$(document).ready(function(){
		list();
	});

	function list(){
		/* $.ajax(function{
			
		}); */
	}

	 function insert()
	{
		var stuid = $("#stu_id").val();
		var stuname = $("#stu_name").val();
		var url = $("#url").val();
		$.ajax({
			url: url+ '/addstudent',
			type:'POST',
			data:{
				id:stuid,
				name:stuname
			},
			success:function(result)
			{
				list();
			}
		});
	
	}
	





</script>
</html>