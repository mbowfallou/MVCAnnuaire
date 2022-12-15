<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="domaine.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Détail | Opérations</title>
<style>
	a.navig {
	display: inline;
	}
	#detail {
		margin: 10px; 
		margin-left: 10%;
		padding: 5px;
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
	
	.ajout, .modif, .suppress {
		text-align: center;
		font-weight: bold;
		font-size: 18pt;
		color : white;
	}
	#detail {
		font-size: 18pt;
	}
		
	.ajout, .modif {		
		background-color: green;
	}
	
	.suppress {
		background-color: red;
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
	<%
	String op = (String) request.getAttribute("operation");
	String message = (String) request.getAttribute("message");
	String classe = (String) request.getAttribute("classe");
	%>
	<h1>Feedback de <%=op %></h1>
	<div class="<%=classe %>" >
		<%=message %>
	</div>
	<div id="detail">
	<%if(op.equals("l'ajout") || op.equals("la modification") || op.equals("la suppression") || op.equals("show")){
		Contact c = (Contact) request.getAttribute("contact");%>
		<p>Prénom(s) : <%=c.getPrenom() %></p>
		<p>Nom : <%=c.getNom() %></p>
		<p>Adresse : <%=c.getAdresse() %></p>
		<p>Email : <%=c.getEmail() %></p>
		<p>Téléphone : <%=c.getTelephone() %></p>
	<% } %>
	</div>
</body>
</html>