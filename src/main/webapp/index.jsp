<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
<style>
	body {
		margin-top: 100px;
	}
	div.conteneur {
		text-align: center;
	}
	a {
		text-decoration: none;
		color: blue;
		font-size: 16pt;
		font-weight: bolder;
		padding: 5px;
		padding-right: 10px;
		padding-left: 10px;
	}
	
	a:hover {
		color: white;
		background: blue;
}
</style>
</head>
<body>
	<div class="conteneur">
		<h1>Bienvenu sur votre Annuaire de Contacts</h1>
		<a href="Controleur?lien=add">Cliquez-ici pour démarrer l'application</a>
	</div>
</body>
</html>