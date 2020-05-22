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
</head>
<body>
 	<div id="d" class="webdesigntuts-workshop"> 
		<%
			String URL="jdbc:mysql://localhost:3306/studentmanagement?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=utf-8";
			String USERNAME = "root";
			String PWD="";
			Connection connection = null;
			PreparedStatement pStmt=null;
			ResultSet re=null;
			try {
				// 导入驱动，加载具体的驱动类
				Class.forName("com.mysql.jdbc.Driver");// 加载驱动类
				// 与数据库建立连接
				connection = DriverManager.getConnection(URL, USERNAME, PWD);
				// 发送sql，执行
				String sql = "update student set name=?,gender=?,birthday=?,address=? where sno=?";
				
				pStmt = connection.prepareStatement(sql);//预编译
				
				request.setCharacterEncoding("utf-8");
				String id=request.getParameter("id");
				String name=request.getParameter("name");
				String gender=request.getParameter("gender");
				String birthday=request.getParameter("birthday");
				String address=request.getParameter("address");
				
				pStmt.setString(1, name);
				pStmt.setString(2, gender);
				pStmt.setString(3, birthday);
				pStmt.setString(4, address);
				pStmt.setString(5, id);
				
			    int count=pStmt.executeUpdate();
			    				
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
				response.sendRedirect("student.jsp");
			}
		%>	
</body>
</html>
