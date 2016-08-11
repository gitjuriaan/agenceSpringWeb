import java.util.ArrayList;
import java.util.List;

import vol.Application;
import vol.model.Aeroport;
import vol.model.AeroportVille;
import vol.model.Client;
import vol.model.CompagnieAerienneVol;
import vol.model.Escale;
import vol.model.Passager;
import vol.model.Reservation;
import vol.model.Ville;
import vol.model.Vol;
import vol.model.dao.AeroportVilleDao;

public class TestsupprTable {


	public static void main(String[] args) {
		
		List<CompagnieAerienneVol> compagnieAerienneVols = new ArrayList<>();
		compagnieAerienneVols = Application.getInstance().getCompagnieAerienneVolDao().findAll();
		for (CompagnieAerienneVol c : compagnieAerienneVols) {
			Application.getInstance().getCompagnieAerienneVolDao().delete(c);
		}
		
		List<Reservation> reservations = Application.getInstance().getReservationDao().findAll();
		for (Reservation r : reservations){
			Application.getInstance().getReservationDao().delete(r);
		}
		
		List<Escale> escales = Application.getInstance().getEscaleDao().findAll();
		for (Escale e : escales){
			Application.getInstance().getEscaleDao().delete(e);
		}
		
		List<AeroportVille> aeroportVilles = Application.getInstance().getAeroportVilleDao().findAll();
		for(AeroportVille a : aeroportVilles){
			Application.getInstance().getAeroportVilleDao().delete(a);
		}
		
		
		
		List<Client> clients = Application.getInstance().getClientDao().findAll();
		for(Client c : clients){
			Application.getInstance().getClientDao().delete(c);
		}
		
		
		List<Vol> vols = Application.getInstance().getVolDao().findAll();
		for (Vol v : vols){
			Application.getInstance().getVolDao().delete(v);
		}
		
		List<Passager> passagers = Application.getInstance().getPassagerDao().findAll();
		for (Passager p : passagers){
			Application.getInstance().getPassagerDao().delete(p);
		}
		List<Aeroport> aeroports = Application.getInstance().getAeroportDao().findAll();
		for (Aeroport a : aeroports){
			Application.getInstance().getAeroportDao().delete(a);
		}
		
		
		
		List<Ville> villes = Application.getInstance().getVilleDao().findAll();
		for (Ville v : villes) {
			Application.getInstance().getVilleDao().delete(v);
		}
		
		Application.close();
	}

}
