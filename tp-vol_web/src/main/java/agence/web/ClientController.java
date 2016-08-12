package agence.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vol.model.Client;
import vol.model.ClientEI;
import vol.model.ClientMoral;
import vol.model.ClientPhysique;
import vol.model.Titre;
import vol.model.dao.ClientDao;




@Controller
@RequestMapping("/client") // URL de base (doit être unique pour tte l'appli
public class ClientController {
	
	
	
	@Autowired
	private ClientDao clientDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Client> listClient = clientDao.findAll();
		
		model.addAttribute("listClient", listClient); // nom à réutiliser dans la JSP
		
		return "client"; // nom du JSP
	}


	
	@RequestMapping("/addEI")
	public String addClientEI(Model model) {
		
		ClientEI clientEI = new ClientEI();
		clientEI.setTypeClient("EI");
		model.addAttribute("client",clientEI);
		model.addAttribute("titre", Titre.values());
		model.addAttribute("type", "saveEI");
		
		return "clientEdit";
	}
	
	@RequestMapping("/addMoral")
	public String addClientMoral(Model model) {
		
		ClientMoral clientMoral = new ClientMoral();
		clientMoral.setTypeClient("Moral");
		model.addAttribute("client",clientMoral);
		model.addAttribute("titre", Titre.values());
		model.addAttribute("type", "saveMoral");
		
		return "clientEdit";
	}
	
	@RequestMapping("/addPhysique")
	public String addClientPhysique(Model model) {
		
		ClientPhysique clientPhysique = new ClientPhysique();
		clientPhysique.setTypeClient("Physique");
		model.addAttribute("client",clientPhysique);
		model.addAttribute("titre", Titre.values());
		model.addAttribute("type", "savePhysique");
		
		return "clientEdit";
	}
	
	
	@RequestMapping("/edit")
	public String edit(@RequestParam (name = "idCli") Integer idCli, Model model) {
		
        Client objClient = clientDao.find(idCli);

        model.addAttribute("client", objClient);
        model.addAttribute("titre", Titre.values());
        
        if(objClient.getTypeClient().equals("EI")){
        	model.addAttribute("type", "saveEI");
        }
        else if(objClient.getTypeClient().equals("Moral")){
        	model.addAttribute("type", "saveMoral");
        }
        else if(objClient.getTypeClient().equals("Physique")){
        	model.addAttribute("type", "savePhysique");
        }
		
		return "clientEdit";
	}
	
	
	
	@RequestMapping("/saveEI")
	public String saveEI(@ModelAttribute("client") @Valid ClientEI clientEI, BindingResult result, Model model) {
		// BindingResult objet de récupération d'erreur
		if(result.hasErrors()) {
			
			model.addAttribute("titre", Titre.values());
			return "clientEdit";
		}
		
		if(clientEI.getIdCli() != null) {
			clientDao.update(clientEI);
		} else { 
			clientDao.create(clientEI);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/saveMoral")
	public String saveMoral(@ModelAttribute("client") @Valid ClientMoral clientMoral, BindingResult result, Model model) {
		// BindingResult objet de récupération d'erreur
		if(result.hasErrors()) {
			
			model.addAttribute("titre", Titre.values());
			return "clientEdit";
		}
		
		if(clientMoral.getIdCli() != null) {
			clientDao.update(clientMoral);
		} else { 
			clientDao.create(clientMoral);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/savePhysique")
	public String savePhysique(@ModelAttribute("client") @Valid ClientPhysique clientPhysique, BindingResult result, Model model) {
		// BindingResult objet de récupération d'erreur
		if(result.hasErrors()) {
			
			model.addAttribute("titre", Titre.values());
			return "clientEdit";
		}
		
		if(clientPhysique.getIdCli() != null) {
			clientDao.update(clientPhysique);
		} else { 
			clientDao.create(clientPhysique);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name="id") Integer id) {
		Client client = clientDao.find(id);
		
		clientDao.delete(client);
		
		return new ModelAndView("client", "listClient", clientDao.findAll());
	}
}
