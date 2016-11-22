<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<body>
<p>
Language : <a href="?language=nl_NL">Spanish</a>|<a href="?language=en">English</a>|<a href="?language=np">Nepali</a>
	 
	<h3>
	Add New Staff  <spring:message code="add.staff" text="" />

	</h3>
</p>
	<form:form modelAttribute="newStaff"  method="post">
		<table>
			<tr><td> FirstName <spring:message code="staff.firstName" text="" /> : </td><td>
			 <form:input path="firstName" type="text" /> </td> <td>
						<form:errors path="firstName" cssStyle="color:red;"></form:errors>
					</td></tr>
			<tr><td> LastName <spring:message code="staff.lastName" text="" /> : </td><td> <form:input path="lastName" type="text" /> </td> <td>
						<form:errors path="lastName" cssStyle="color:red;"></form:errors>
					</td></tr>
			<tr><td> Country <spring:message code="staff.country" text="" />: </td><td> <form:input path="address.country" type="text" /> </td><td>
						<form:errors path="address.country" cssStyle="color:red;"></form:errors>
					</td></tr>
			<tr><td> State <spring:message code="staff.state" text="" />: </td><td> <form:input path="address.state" type="text" /> </td><td>
						<form:errors path="address.state" cssStyle="color:red;"></form:errors>
					</td></tr>
			<tr><td> City <spring:message code="staff.city" text="" />: </td><td> <form:input path="address.city" type="text" /> </td><td>
						<form:errors path="address.state" cssStyle="color:red;"></form:errors>
					</td></tr>
			<tr><td> Street <spring:message code="staff.street" text="" />: </td><td> <form:input path="address.street" type="text" /> </td><td>
						<form:errors path="address.street" cssStyle="color:red;"></form:errors>
					</td></tr>
			<tr><td> ZipCode <spring:message code="staff.zip" text="" />: </td><td> <form:input path="address.zip" type="text" /> </td><td>
						<form:errors path="address.zip" cssStyle="color:red;"></form:errors>
					</td></tr>
					
			<tr><td> Contact <spring:message code="staff.contact" text="" />: </td><td> <form:input path="contact" type="text" /> </td> <td>
						<form:errors path="contact" cssStyle="color:red;"></form:errors>
					</td></tr>		
			
			<tr>
				<td>Position <spring:message code="staff.position" text="" />:</td>
			<td>
				<select name="position">
					<option value="Manager"> Manager <spring:message code="staff.manager" text="" /> </option>
					<option value="Staff" selected> Staff <spring:message code="staff.staff" text="" /> </option>
					<option value="Engineer"> Engineer <spring:message code="staff.engineer" text=""/> </option>
					<option value="Accountant"> Accountant <spring:message code="staff.accountant" text="" /> </option>
				</select>
			</td>
			</tr>		
			<tr><td> </td><td> <button>Create New Staff</button> </td></tr>
			
		</table>
	</form:form>
	
	<h1>Staff List</h1>
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
	<!-- <a href="/OnlineInvestment/list">View AllStaff</a> -->
</body>
</html>