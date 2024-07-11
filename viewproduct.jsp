<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Users</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
	<style>
    th, td {
        font-size: 14px; /* Adjust the font size as needed */
    }
</style>
</head>
<body>
	<div class="container mt-5">
		<h2 class="text-center mb-4">Products</h2>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<!-- 						<th>Brand Id</th>
 -->
						<th>Brand Name</th>
						
						<th>Price</th>
						<th>Color</th>
						<th>Specification</th>
												<th>Image</th>
						
						<th>Edit</th>
						<th>Delete</th>


					</tr>
				</thead>
				<tbody>
					<%
                    	Connection conn = null;
                                        Statement stmt = null;
                                        ResultSet rs = null;
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ultras", "root", "");
                                            stmt = conn.createStatement();
                                            String sql = "SELECT p.id, p.name, p.brand_id, p.price, p.color, p.specification, p.image, b.brand_name " +
                                                    "FROM products p " +
                                                    "JOIN brands b ON p.brand_id = b.id";
                    		rs = stmt.executeQuery(sql);
                    		while (rs.next()) {
                    			int id = rs.getInt("id");
                    			String name = rs.getString("name");
                    			String brand_id = rs.getString("brand_id");
                    			String brand_name = rs.getString("brand_name");

                    			double price = rs.getDouble("price");
                    			String color = rs.getString("color");
                    			String specification = rs.getString("specification");
                    			String image = rs.getString("image");

                    %>
					<tr>
						<td><%=id%></td>
						<td><%=name%></td>
<%-- 						<td><%=brand_id%></td>
 --%>												<td><%=brand_name%></td>
						
						<td><%=price%></td>

						<td><%=color%></td>
						<td><%=specification%></td>
<td>
    <img src="<%= image %>" alt="Image Description" style="max-width: 100%; height: auto;" />
</td>
						
						<td><a href="editproduct.jsp?id=<%=id%>"
							class="btn btn-primary btn-sm">Edit</a></td>

						<td><a href="deleteproduct.jsp?id=<%=id%>"
							class="btn btn-danger btn-sm">Delete</a></td>
					</tr>
					<%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null)
                            try {
                                rs.close();
                            } catch (SQLException ignore) {
                            }
                        if (stmt != null)
                            try {
                                stmt.close();
                            } catch (SQLException ignore) {
                            }
                        if (conn != null)
                            try {
                                conn.close();
                            } catch (SQLException ignore) {
                            }
                    }
                    %>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Bootstrap JS (optional) -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>