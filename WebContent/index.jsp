<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>
	<style type="text/css">
		form{
			margin: auto;
			margin-left: 0px;
		}
		span{
			font-size: 16px;
			margin-left: 0px;
			float:left;
		}
		#container{
			margin: auto;
			margin-left: 20%;
		}
	</style>
</head>
<body>
<div id="container">


	<h2>Student Information</h2>
	<form action="">
		<table>
		<tr>
			<td><span>Student ID:</span></td>
			<td><input type="text" id="stu_id" placeholder="Student ID"></td>
		</tr>
		
		<tr>
			<td><span>Student Name:</span></td>
			<td><input type="text" id="stu_name" placeholder="Student Name"></td>
		</tr>	
		<tr>
			<td><input type="button" onClick="insert()" value="Add"></td>
		</tr>
		</table>
	</form>
	<div id="display">
		
	</div>
</div>
</body>
<input type="hidden" id="url" value="${pageContext.request.contextPath}">
<script type="text/javascript">

$(document).ready(function(){
	getAllStudents();
	
});


	function getAllStudents(){
		
		var url = $("#url").val();
		var table = "<table border='1'>";
			table += "<tr>";
			table += "<td>Student ID</td><td>Student Name</td><td>Action</td>";
			table += "</tr>"; 
			
			$.ajax({
				url: url+ '/getallstudents',
				success:function(result)
				{
					for(var i =0 ; i<result.length ;i++){
						table +="<tr>";
						table +="<td>"+result[i].id+ "</td>";
						table +="<td>"+result[i].name+"</td>";
						table +="<td><input type='button' onClick='Edit()' value='Edite'>/<input type='button' onClick='Delete()' value='Delete'></td>";
						table +="</tr>";
					}
				table +="</table>";
				$('#display').append(table);
				}
			});
	}
	
	//function insert data from form
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
				alert(result)
				
			}
		});
	
	}
	
	//function edit data
	function Edit(){
		
	}
		
	function Delete(){
		alert("Delte");
	}

	





</script>
</html>