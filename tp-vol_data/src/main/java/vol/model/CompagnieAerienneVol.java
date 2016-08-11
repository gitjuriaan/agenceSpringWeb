package vol.model;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Version;

@Entity
public class CompagnieAerienneVol {

	private CompagnieAerienneVolId id;
	private int version;
	private String numero;
	private Boolean ouvert;

	public CompagnieAerienneVol() {
		super();
	}

	public CompagnieAerienneVol(CompagnieAerienne compagnieAerienne, Vol vol) {
		super();
		this.id = new CompagnieAerienneVolId(compagnieAerienne, vol);
	}

	
	@EmbeddedId
	public CompagnieAerienneVolId getId() {
		return id;
	}

	public void setId(CompagnieAerienneVolId id) {
		this.id = id;
	}

	@Version
	public int getVersion() {
		return version;
	}

	public void setVersion(int version) {
		this.version = version;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public Boolean getOuvert() {
		return ouvert;
	}

	public void setOuvert(Boolean ouvert) {
		this.ouvert = ouvert;
	}

	
	/*
	 * @Override public String toString() { return
	 * "CompagnieAerienneVol [ compagnieAerienne=" + compagnieAerienne +
	 * ", vol=" + vol + ", numero=" + numero + ", ouvert=" + ouvert + "]"; }
	 */

}
