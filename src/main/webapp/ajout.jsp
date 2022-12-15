<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajout</title>
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
	
	input#enregistrer{
		background-color: green; 
		color: white; 
		font-size: 14pt; 
		font-weight: bold; 
		padding: 5px; 
		margin: 5px;
		margin-left: 400px;
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
	<h1>Ajout d'un nouveau contact</h1>
	<form action="Controleur" method="POST">
		<div class="donnee">
			<div class="label"><label for="prenom">Prénom(s)</label></div> 
			<input type="text" class="entree" name="prenom" id="prenom" value="">
		</div>
		<div class="donnee">
			<div class="label"><label for="nom">Nom</label></div>
			<input type="text" class="entree" name="nom" id="nom" value="">
		</div>
		<div class="donnee">
			<div class="label"><label for="adresse">Adresse</label></div>
			<input type="text" class="entree" name="adresse" id="adresse" value="">
		</div>
		<div class="donnee">
			<div class="label"><label for="email">Email</label></div>
			<input type="email" class="entree" name="email" id="email" value="">
		</div>
		<div class="donnee">
			<div class="label"><label for="telephone">Téléphone</label></div>
			<input type="tel" class="entree" name="telephone" id="telephone" value="">
			<input type="hidden" name="forme" value="add">
		</div>
		<div>
			<input type="submit" value="Enregistrer" id="enregistrer">
		</div>
	</form>
</div>
</body>
</html>