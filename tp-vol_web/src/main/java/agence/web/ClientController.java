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
		
	
		model.addAttribute("client",new ClientEI());
		model.addAttribute("titre", Titre.values());
		
		return "clientEdit";
	}
	
	@RequestMapping("/addMoral")
	public String addClientMoral(Model model) {
		
	
		model.addAttribute("client",new ClientMoral());
		model.addAttribute("titre", Titre.values());
		
		return "clientEdit";
	}
	
	@RequestMapping("/addPhysique")
	public String addClientPhysique(Model model) {
		
	
		model.addAttribute("client",new ClientPhysique());
		model.addAttribute("titre", Titre.values());
		
		return "clientEdit";
	}
	
	
	@RequestMapping("/edit")
	public String edit(@RequestParam (name = "id") Integer id, Model model) {
		
        Client objClient = clientDao.find(id);

        model.addAttribute("client", objClient);
        model.addAttribute("titre", Titre.values());
		
		return "clientEdit";
	}
	
	@RequestMapping("/save")
	public String save(@ModelAttribute("client") @Valid Client client, BindingResult result, Model model) {
		// BindingResult objet de récupération d'erreur
		if(result.hasErrors()) {
			
			model.addAttribute("titre", Titre.values());
			return "clientEdit";
		}
		
		if(client.getIdCli() != null) {
			clientDao.update(client);
		} else { 
			clientDao.create(client);
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
