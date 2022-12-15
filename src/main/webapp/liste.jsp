<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="domaine.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste</title>
<style>
	.operation {
		text-align: center;
		font-weight: bold;
		color: white;
	}
	
	a.op {
		text-decoration: none;
		padding: 3px;
	}
	
	#mod {
		background-color: #ffc107;
	}
	
	#mod:hover{
		background-color: white;
	}
	
	#supp {
		background-color: #dc3545;
	}
	
	#supp:hover{
		background-color: white;
		color: #dc3545;
	}
	
	#suppr:hover {
		color: #dc3545;
	}
	
	table {
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 90%;
	  margin-left: 4%;
	}
	
	thead {
		background-color: #6495ED;
		color: white;
	}
	
	td, th {
	  border: 1px solid #dddddd;
	  text-align: left;
	  padding: 8px;
	}
	
	tr:nth-child(even) {
	  background-color: #dddddd;
	}
</style>
</head>
<body>
	<nav>
		<ul>
		<li><a href="index.jsp">Accueil</a></li>
		<li><a href="Controleur?lien=list">Liste des contacts</a></li>
		<li><a href="Controleur?lien=add">Ajouter un nouvel contact</a></li>
		</ul>
	</nav>
	<table>
		<caption><h1>Liste des contacts</h1></caption>
		<thead>
			<tr>
				<th>ID</th>
				<th>Prénom(s)</th>
				<th>Nom</th>
				<th>Adresse</th>
				<th>Email</th>
				<th>Téléhone</th>
				<th colspan="2" style="text-align: center;">Opérations</th>
			</tr>
		</thead>
		<tbody>
		<%ArrayList<Contact> maList = (ArrayList<Contact>) request.getAttribute("contacts");
		for(Contact c: maList){%>
			<tr>
				<td><%=c.getId() %></td>
				<td><%=c.getPrenom() %></td>
				<td><%=c.getNom() %></td>
				<td><%=c.getAdresse() %></td>
				<td><%=c.getEmail() %></td>
				<td><%=c.getTelephone() %></td>
				<td class="operation" id="mod"><a class="op" href="Controleur?lien=update&id=<%=c.getId() %>">Modifier</a></td>
				<td class="operation" id="supp"><a class="op"id="suppr" href="Controleur?lien=delete&id=<%=c.getId() %>">Supprimer</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</body>
</html>