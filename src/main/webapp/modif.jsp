<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="domaine.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modification</title>
<style>
	div#conteneur {
		margin-left: 100px;
	}
	
	div.donnee {
		display: block;
		margin-bottom: 10px;
	}
	div.label {
		width: 100px;
		display: inline-block;
	}
	
	input.entree {
		min-width: 400px;
	}
	
	input#modifier{
		background-color: #ffc107; 
		color: white; 
		font-size: 14pt; 
		font-weight: bold; 
		padding: 5px; 
		margin: 5px;
		margin-left: 425px;
		border-radius: 5px;
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
<div id="conteneur">
	<h1>Modification d'un contact</h1>
	<% Contact c = (Contact) request.getAttribute("contact"); %>
	<form action="Controleur" method="POST">
		<div class="donnee">
			<div class="label"><label for="prenom">Prénom(s)</label></div> 
			<input type="text" class="entree" name="prenom" id="prenom" value="<%=c.getPrenom() %>">
		</div>
		<div class="donnee">
			<div class="label"><label for="nom">Nom</label></div>
			<input type="text" class="entree" name="nom" id="nom" value="<%=c.getNom() %>">
		</div>
		<div class="donnee">
			<div class="label"><label for="adresse">Adresse</label></div>
			<input type="text" class="entree" name="adresse" id="adresse" value="<%=c.getAdresse() %>">
		</div>
		<div class="donnee">
			<div class="label"><label for="email">Email</label></div>
			<input type="email" class="entree" name="email" id="email" value="<%=c.getEmail() %>">
		</div>
		<div class="donnee">
			<div class="label"><label for="telephone">Téléphone</label></div>
			<input type="tel" class="entree" name="telephone" id="telephone" value="<%=c.getTelephone() %>">
		</div>
		<div>
			<input type="hidden" name="forme" value="update">
			<input type="hidden" name="id" value="<%=c.getId() %>">
			<input type="submit" value="Modifier" id="modifier">
		</div>
	</form>
</div>
</body>
</html>