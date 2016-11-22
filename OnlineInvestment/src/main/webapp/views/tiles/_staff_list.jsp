<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<h1>Staff Details</h1>
	<%-- First Name : ${newStaff.firstName}
	<br /> Last Name : ${newStaff.lastName} --%>
			
		<table>
		<tr>
			<td> First Name </td>
			<td> Last Name </td>
			<td> Country </td>
			<td> State </td>
			<td> City </td>
			<td> Street </td>
			<td> ZipCode </td>
			<td> Contact </td>
			<td> Position </td>
			<td> Edit|Delete </td>
			
		</tr>
		<c:forEach  var="newStaff" items="${stafflist}" >
		<tr>
			
			<td> ${newStaff.firstName}</td>
			
			<td>${newStaff.lastName} </td>
			
			<td>${newStaff.address.country} </td>
			
			<td>${newStaff.address.state} </td>
			
			<td>${newStaff.address.city} </td>
					
			<td>${newStaff.address.street} </td>
				
			<td>${newStaff.address.zip}</td>
			
			<td>${newStaff.contact}</td>
			
			<td>${newStaff.position}</td>
			
			 <td> <a href="staffEdit/${newStaff.id}">Edit</a>|
			 	  <a href="staffDelete/${newStaff.id}">Delete </a>
			 </td>

		</tr>
		</c:forEach>
			
	</table>
	 <a href="/OnlineInvestment/staff/add">Back to add staff</a>
</body>
</html>