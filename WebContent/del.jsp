<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生数据库管理系统</title>
 <style>
* {
	margin: 0;
	padding: 0;
}
body {
	overflow: hidden;
}
</style> 
<link href="css/font.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style-search.css" media="screen" type="text/css" />
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript">
	   function is_empty()
	   {
		   var n=document.getElementById("name").value;
		   var p=document.getElementById("pwd").value;
		   if(!n||n=="请输入用户名")
		   {
		   		alert("用户名不为空");
		   		return false;
		   }
		   else if(!p||p=="请输入密码")
	   		{
			   alert("密码不为空");
	   			return false;
	   		}
		   else
		   {
			   return true;	
		   }	   
	   }
	   		
</script> 
<style>
	*{
	   	color:white;
	   	margin:0px;
	   	position:0px;
	}
	#d{
		padding:10px;
		position: absolute;
		top: 30%;
		left: 50%;
		transform: translateX(-50%);
		width: 400px;
		height: 400px;	
		padding-left:150px;
		 
	}
	#nid{
		position: fixed;
		margin-top:10px;
		text-align:left;
	}
	#pid{
		position: fixed;
		margin-top:110px;
		text-align:left;
	}
	#sid{
		position:fixed;
		margin-top:210px;
		text-align:left;
	}
	.input {
	 /*  z-index: 2; */
	  font-size: 20px;
	  font-family: helvetica, sans-serif;
	  background: none;
	  border: 1px solid #ddd;
	  color: #eee;
	}
</style>
</head>
<body>
	<canvas id="canvas" width="1280" height="1024"> 您的浏览器不支持canvas标签，请您更换浏览器 </canvas>
	<script src="js/word.js"></script>
	<p id="offscreen-text" class="offscreen-text"></p>
	<p id="text" class="text"></p>
	
 	<div id="d" class="webdesigntuts-workshop"> 
		<%
			String URL="jdbc:mysql://localhost:3306/studentmanagement?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=utf-8";
			String USERNAME = "root";
			String PWD="";
			Connection connection = null;
			PreparedStatement pStmt=null;
			ResultSet re=null;
			int flag=-1;
			try {
				// 导入驱动，加载具体的驱动类
				Class.forName("com.mysql.jdbc.Driver");// 加载驱动类
				// 与数据库建立连接
				connection = DriverManager.getConnection(URL, USERNAME, PWD);
				// 发送sql，执行
				String sql = "delete from student where sno=? ";
				pStmt = connection.prepareStatement(sql);//预编译
				request.setCharacterEncoding("utf-8");
				int id=Integer.parseInt(request.getParameter("id"));
				pStmt.setInt(1,id);
			    int count=pStmt.executeUpdate();
				response.sendRedirect("student.jsp");
					
			} 
			catch (ClassNotFoundException e) 
			{
				e.printStackTrace();
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			finally 
			{
				try
				{
					if(re!=null) re.close();
					if(pStmt!=null)	pStmt.close();
					if(connection!=null)	connection.close();
				}catch(SQLException e)
				{
					e.printStackTrace();
				}catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		%>
	 </div>
	<script  src='js/index.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.1/TweenMax.min.js"></script>
</body>
</html>