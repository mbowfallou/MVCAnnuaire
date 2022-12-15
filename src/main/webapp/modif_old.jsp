<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="domaine.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modification</title>
</head>
<body>
	<nav>
		<ul>
		<li><a href="index.jsp">Accueil</a></li>
		<li><a href="Controleur?lien=list">Liste des contacts</a></li>
		<li><a href="Controleur?lien=add">Ajouter un nouvel contact</a></li>
		</ul>
	</nav>
	<h1>Modification d'un contact</h1>
	<% Contact c = (Contact) request.getAttribute("contact"); %>
	<form action="Controleur" method="POST">
		<div>
			<label for="prenom">Prénom(s)</label> <input type="text" name="prenom" id="prenom" value="<%=c.getPrenom() %>">
		</div>
		<div>
			<label for="nom">Nom</label> <input type="text" name="nom" id="nom" value="<%=c.getNom() %>">
		</div>
		<div>
			<label for="adresse">Adresse</label> <input type="text" name="adresse" id="adresse" value="<%=c.getAdresse() %>">
		</div>
		<div>
			<label for="email">Email</label> <input type="email" name="email" id="email" value="<%=c.getEmail() %>">
		</div>
		<div>
			<label for="telephone">Téléphone</label> <input type="tel" name="telephone" id="telephone" value="<%=c.getTelephone() %>">
		</div>
		<div>
			<input type="hidden" name="id" value="<%=c.getId() %>">
			<input type="hidden" name="forme" value="update">
			<input type="submit" value="Modifier">
		</div>
	</form>
</body>
</html>