<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	var stuid = $('#stu_id').val();
	
	getAllStudents();
	
});

	function getIndex(index){
		
	}
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
						//1. First Strategy I put the id with parameter
						table +="<td><input id='btnedit' type='button' onClick='Edit("+result[i].id+")' value='Edit'><input type='button' onClick='Delete("+result[i].id+")' value='Delete'></td>";
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
		if(stuid==''){
			alert("Please input field id");
			
		}
		else if(stuname == ''){
			alert("Please input field name")
		}
		
		$.ajax({
			url: url+ '/addstudent',
			type:'POST',
			data:{
				id:stuid,
				name:stuname
			},
			success:function(result)
			{
				alert(result);
				
			}
		});
	
	}
	
	//function edit data
	function Edit(id, name){
		$("#stu_id").val(id);
		$("#stu_name").val(name);
		/* var stuid = $("#stu_id").val();
		var stuname = $("#stu_name").val();
		var url = $("#url").val();
		
		$.ajax({
			url: url+ '/editstudent',
			type:'POST',
			data:{
				id:stuid,
				name:stuname
			},
			success:function(result)
			{
				for(var i=0; i<result.length; i++){
					var cstuid = result[i].id;
					var cstuname = result[i].name;
				}
			}
		}); */
		
		
	}
		
	//code delete is ok.
	function Delete(id){
		var url = $("#url").val(); 
		alert(id);
		$.ajax({
			url: url+ '/deletestudent',
			type:'POST',
			data:{
				id:id,
				//name:stuname
			},
			success:function(result)
			{
				alert(result);	
				$("#display").html("");
				getAllStudents();
			}
		});
	
	}

	





</script>
</html>