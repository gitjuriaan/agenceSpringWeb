/**
 * 
 */
package vol.model;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Version;

/**
 * @author ajc
 *
 */
@Entity
@Table(name="Client")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="typeClient", discriminatorType=DiscriminatorType.STRING)
public abstract class Client {

	/**
	 * 
	 */
	private Integer idCli;
	private String nom;
	private String numeroTel;
	private String numeroFax;
	private String email;
	private Titre titre;
	private int version;
	private List<Reservation> reservations = new ArrayList<Reservation>();
	private Adresse adresse;
	private Login Log;

	public Client() {
	}

	public Client(int idCli) {

		this();
		this.idCli = idCli;
	}

	public void setIdCli(Integer idCli) {
		this.idCli = idCli;
	}

	@Embedded
	public Adresse getAdresse() {
		return adresse;
	}

	public String getEmail() {
		return email;
	}

	@Id
	@GeneratedValue
	public Integer getIdCli() {
		return idCli;
	}



	@OneToMany(mappedBy="client")
	public List<Reservation> getReservations() {
		return reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}

	@Embedded
	public Login getLog() {
		return Log;
	}
	
	public void setLog(String login, String motdepasse, boolean admin){
		this.Log = new Login(login, motdepasse, admin);
	}

	public String getNom() {
		return nom;
	}

	public String getNumeroFax() {
		return numeroFax;
	}

	public String getNumeroTel() {
		return numeroTel;
	}

	@Enumerated (EnumType.STRING)
	public Titre getTitre() {
		return titre;
	}

	@Version
	public int getVersion() {
		return version;
	}

	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public void setLog(Login log) {
		Log = log;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public void setNumeroFax(String numeroFax) {
		this.numeroFax = numeroFax;
	}

	public void setNumeroTel(String numeroTel) {
		this.numeroTel = numeroTel;
	}

	public void setTitre(Titre titre) {
		this.titre = titre;
	}

	public void setVersion(int version) {
		this.version = version;
	}


	public String toString() {
		String reponse = "Le Client : " + this.nom  + " " + getNumeroTel()
				+ " a effectué la/les reservation(s) : \n";
		for (int i = 0; i < reservations.size(); i++) {
			reponse += "\n" + this.reservations.get(i).getNumero();
		}

		return reponse;
	}

}
