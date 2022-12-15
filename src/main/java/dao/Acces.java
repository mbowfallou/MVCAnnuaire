package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import domaine.Contact;

public class Acces 
{
	private Connection conn = null;
	private PreparedStatement st = null;
	private ResultSet rs = null;
	
	public Acces()
	{
		try 
		{
			String driverMySQL8 = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/annuaire?serverTimezone=UTC&useSSL=false";
			
			Class.forName(driverMySQL8);	// Chargement de la classe Principale du pilote
			
			// Connexion avec la base de données
			conn = DriverManager.getConnection(url, "fallou", "mbow");
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void addContact(Contact contact)
	{
		try {
			String req = "INSERT INTO contacts(nom, prenom, adresse, email, telephone) VALUES (?, ?, ?, ?, ?)";
			st = conn.prepareStatement(req);
			st.setString(1, contact.getNom());
			st.setString(2, contact.getPrenom());
			st.setString(3, contact.getAdresse());
			st.setString(4, contact.getEmail());
			st.setString(5, contact.getTelephone());
			
			st.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void updateContact(Contact contact)
	{
		try {
			String req = "UPDATE contacts SET nom=?, prenom=?, adresse=?, email=?, telephone=? WHERE id=?";
			st = conn.prepareStatement(req);
			st.setString(1, contact.getNom());
			st.setString(2, contact.getPrenom());
			st.setString(3, contact.getAdresse());
			st.setString(4, contact.getEmail());
			st.setString(5, contact.getTelephone());
			st.setInt(6, contact.getId());
			
			st.executeUpdate();	
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public void deleteCntact(int id)
	{
		try {
			String req = "DELETE FROM contacts WHERE id=?";
			st = conn.prepareStatement(req);
			st.setInt(1, id);
			
			st.executeUpdate();	
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	public ArrayList<Contact> showContatcts()
	{
		ArrayList<Contact> liste = null;
		try {
			liste = new ArrayList<Contact>();
			
			st = conn.prepareStatement("SELECT * FROM contacts");
			rs = st.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("id");
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String adresse = rs.getString("adresse");
				String telephone = rs.getString("telephone");
				String email = rs.getString("email");
				
				Contact c = new Contact(nom, prenom, adresse, email, telephone);
				c.setId(id);
				
				liste.add(c);
			}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return liste;
	}
	
	public Contact researchContact(int id)
	{
		Contact contact = null;
		try {
			st = conn.prepareStatement("SELECT * FROM contacts where id = ?");
			st.setInt(1, id);
			rs = st.executeQuery();
			
			if(rs.next()) {
				String nom = rs.getString("nom");
				String prenom = rs.getString("prenom");
				String adresse = rs.getString("adresse");
				String telephone = rs.getString("telephone");
				String email = rs.getString("email");
				
				contact = new Contact(nom, prenom, adresse, email, telephone);
				contact.setId(id);
				}
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return contact;
	}
}
