package controleur;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Acces;
import domaine.Contact;

@WebServlet("/Controleur")
public class Controleur extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	private Contact contact = null;
	private ArrayList<Contact> contacts = null;
	private Acces connexion = new Acces();
	private RequestDispatcher disp = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String lien = request.getParameter("lien");
		String identifiant = "";
		int id;
		
		switch (lien) 
		{
			case "add":
				response.sendRedirect("ajout.jsp");
				break;
			
			case "update":
				identifiant = request.getParameter("id");
				id = Integer.parseInt(identifiant);
				
				contact = connexion.researchContact(id);
				request.setAttribute("contact", contact);
				
				disp = request.getRequestDispatcher("modif.jsp");
				disp.forward(request, response);
				break;
				
			case "delete":
				identifiant = request.getParameter("id");
				id = Integer.parseInt(identifiant);
				
				contact = connexion.researchContact(id);
				
				connexion.deleteCntact(id);
				
				request.setAttribute("operation", "la suppression");
				request.setAttribute("message", "Le contact a été supprimé avec succès.");
				request.setAttribute("classe", "suppress");
				request.setAttribute("contact", contact);
				
				disp = request.getRequestDispatcher("detail.jsp");
				disp.forward(request, response);
				break;
				
			case "list":
				contacts = connexion.showContatcts();
				request.setAttribute("contacts", contacts);
				
				disp = request.getRequestDispatcher("liste.jsp");
				disp.forward(request, response);
				break;
				
			case "show":
				identifiant = request.getParameter("id");
				id = Integer.parseInt(identifiant);
				
				contact = connexion.researchContact(id);				
				request.setAttribute("contact", contact);
				request.setAttribute("operation", "show");
				
				disp = request.getRequestDispatcher("detail.jsp");
				disp.forward(request, response);
				break;
				
			default:
				response.sendRedirect("index.jsp");
				break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int id;
		String prenom = "";
		String nom = "";
		String adresse = "";
		String email = "";
		String telephone = "";
		
		String forme = request.getParameter("forme");
		if (forme.equals("add"))
		{
			prenom = request.getParameter("prenom");
			nom = request.getParameter("nom");
			adresse = request.getParameter("adresse");
			email = request.getParameter("email");
			telephone = request.getParameter("telephone");
			
			contact = new Contact(nom, prenom, adresse, email, telephone);			
			connexion.addContact(contact);
			
			request.setAttribute("operation", "l'ajout");
			request.setAttribute("message", "Le contact a été ajouté avec succès.");
			request.setAttribute("classe", "ajout");
			request.setAttribute("contact", contact);
			
			disp = request.getRequestDispatcher("detail.jsp");
			disp.forward(request, response);
		}
		else if (forme.equals("update")) 
		{
			String identifiant = request.getParameter("id");
			id = Integer.parseInt(identifiant);
			prenom = request.getParameter("prenom");
			nom = request.getParameter("nom");
			adresse = request.getParameter("adresse");
			email = request.getParameter("email");
			telephone = request.getParameter("telephone");
			
			contact = new Contact(nom, prenom, adresse, email, telephone);		
			contact.setId(id);
			connexion.updateContact(contact);
			
			request.setAttribute("operation", "la modification");
			request.setAttribute("message", "Le contact a été mis à jour avec succès.");
			request.setAttribute("classe", "modif");
			request.setAttribute("contact", contact);
			
			disp = request.getRequestDispatcher("detail.jsp");
			disp.forward(request, response);
		}
	}

}
