<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Maintain User Details</title>
<link rel="stylesheet" href="MaintainUsers.css">

</head>

<body>
	<div class="f1">
		<div>
			<h1>CREATE NEW USER</h1>
		</div>
		<div>
			<form action="create" method="get">
				<table class="t1">
					<tr>
						<td><label for="name">NAME</label></td>
						<td><input name="name" type="text"></td>
						<td><button type="submit" name="val" value="UPDATE">UPDATE</button></td>
					</tr>
					<tr>
						<td><label for="contact">CONTACT</label></td>
						<td><input name="contact"></td>
						<td><button type="submit" name="val" value="UPDATE">UPDATE</button></td>
					</tr>
					<tr>
						<td></td>
						<td><button type="submit" name="val" value="CREATE"
								class="create">CREATE</button>
							<button type="submit" name="val" value="DELETE" class="delete">DELETE</button></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>

	</div>
	<div class="f2">
		<div>
			<h1>ALL USERS</h1>
		</div>
		<div>
			<table class="t2">
				<tr>
					<td class="td2">USER ID</td>
					<td class="td2">NAME</td>
					<td class="td2">CONTACT</td>
				</tr>

				<%
				Connection con =null;
				Statement st = null;
				ResultSet rs =null;
				try {
					String showAll = "select * from user";
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "root");
					st = con.createStatement();
					rs = st.executeQuery(showAll);
					
					while(rs.next())
					{
						out.print("<tr><td class='td3'>" + rs.getInt(1) + "</td><td class='td3'>" + rs.getString(2)
						+ "</td><td class='td3'>" + rs.getString(3) + "</td></tr>");

					}

				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					if (con != null || st != null || rs != null) {
						try {
					con.close();
					st.close();
					rs.close();

						} catch (SQLException e) {
					e.printStackTrace();
						}
					}
				}
				%>

			</table>
		</div>

	</div>

</body>

</html>