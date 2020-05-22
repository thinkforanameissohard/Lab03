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
<style>
	#table th {
	    display: block;
	    width: 50px;
	}
	#table tr {
	    display: inline-flex;
	    margin-top: 5px;
	    margin-bottom: 5px;
		margin-left: 60px;
		font-size: 16px;
	}
	input{
		border-radius: 5px;
	}
	#close_img{
		vertical-align: middle;
		width: 30px;
	}
	#input1 {
	    margin-left: 40px;
	    margin-right: 60px;
	}


</style>
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
				String sql = "select * from student where sno=?";
				pStmt = connection.prepareStatement(sql);//预编译
				request.setCharacterEncoding("utf-8");
				String id=request.getParameter("id");
				pStmt.setString(1, id);
			    re=pStmt.executeQuery();
				if(re.next())
				{
					%>
					<form action="editsave.jsp" method="post">
						<table id="table" style="width:50%">
							<tr>
								<th width="30%">姓名：</th>
								<td width="70%"><input name="name" type="text"
									value="<%=re.getString("name")%>"></td>
							</tr>
							<tr>
								<th>性别：</th>
								<td><input name="gender" type="text"
									value="<%=re.getString("gender")%>"></td>
							</tr>
							<tr>
								<th>生日：</th>
								<td><input name="birthday" type="text"
									value="<%=re.getString("birthday")%>"></td>
							</tr>
							<tr>
								<th>地址：</th>
								<td><input name="address" type="text"
									value="<%=re.getString("address")%>"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="hidden" name="id" id="input1" value="<%=id%>">
									<input type="submit" value="修改"><input type="reset"
									value="重置"></td>
							</tr>
						</table>
					</form>
					<%
				}
				else
				{
					response.sendRedirect("student.jsp");
				}
					
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
</body>
</html>