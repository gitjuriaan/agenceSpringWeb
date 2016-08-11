package banque.web;

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

import banque.dao.ClientDao;
import banque.model.Civilite;
import banque.model.Client;

@Controller
@RequestMapping("/client")
public class ClientController {

	@Autowired
	private ClientDao clientDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Client> clients = clientDao.findAll();
		model.addAttribute("clients", clients);
		
		return "clients";								// renvoie à clients.jsp
	}
	
	@RequestMapping("/add")													
	public String add(Model model) {	
		model.addAttribute("client", new Client());
		model.addAttribute("civilites",  Civilite.values());
		return "clientEdit";													
	}
	
	@RequestMapping("/edit")													// url /edit
	public String edit(@RequestParam(name="id")Long id, Model model) {			// va cherche l'id dans l'url au moment de l'edit
        Client client = clientDao.find(id);										// on récupère le client
        model.addAttribute("client", client);									// on le balance dans le model
		model.addAttribute("civilites",  Civilite.values());
		return "clientEdit";													// on renvoi le client dans le model à la jsp
	}
	
	@RequestMapping("/save")
	public String save(@ModelAttribute("client") @Valid Client client, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("civilites", Civilite.values());
			return "clientEdit";
			}
		
		if(client.getId() != null) {
			clientDao.update(client);
		} else {
			clientDao.create(client);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name="id") Long id) {
		Client client = clientDao.find(id);
		
		clientDao.delete(client);
		
		return new ModelAndView("clients", "clients", clientDao.findAll());
	}
	
	public ClientController() {
	}

}
