package vol.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Ville {
	
	private Integer idVil;
	private String nom;
	private List<AeroportVille> AeroportVille = new ArrayList<AeroportVille>();
	
	public Ville(){
		
	}

	public Ville(Integer idVil, String nom) {
		this.idVil = idVil;
		this.nom = nom;
		}

	@Id
	@GeneratedValue
	public Integer getIdVil() {
		return idVil;
	}

	public void setIdVil(Integer idVil) {
		this.idVil = idVil;
	}

	@Column(length = 100)
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}
	
	@OneToMany(mappedBy = "ville")
	public List<AeroportVille> getAeroportVille() {
		return AeroportVille;
	}

	public void setAeroportVille(List<AeroportVille> aeroportVille) {
		AeroportVille = aeroportVille;
	}

	public String toString() {
		String reponse="La Ville : "+this.nom;
				
		return reponse;
}

}
