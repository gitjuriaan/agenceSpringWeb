package banque.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import banque.dao.AgenceDao;
import banque.model.Agence;
import banque.model.AgenceId;

@Controller
@RequestMapping("/agence")
public class AgenceController {

	@Autowired
	private AgenceDao agenceDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Agence> agences = agenceDao.findAll();
		model.addAttribute("agences", agences);
		
		return "agences";								// renvoie à clients.jsp
	}
	
	@RequestMapping("/add")													
	public String add(Model model) {	
		model.addAttribute("agence", new Agence());
		model.addAttribute("mode", "add");
		
		return "agenceEdit";													
	}
	
	@RequestMapping("/edit")													// url /edit
	public String edit(	@RequestParam(name="numAgence") String numAgence, 
						@RequestParam(name="numBanque") String numBanque, 
						Model model) {											// va cherche l'id dans l'url au moment de l'edit
        AgenceId agenceId = new AgenceId(numBanque, numAgence);
		Agence agence = agenceDao.find(agenceId);										// on récupère le client
        model.addAttribute("agence", agence);	
		model.addAttribute("mode", "edit");// on le balance dans le model
		return "agenceEdit";													// on renvoi le client dans le model à la jsp
	}
	
	@RequestMapping("/save")
	public String save(	@ModelAttribute("agence") Agence agence, 
						@ModelAttribute("mode") String mode) {
		if(mode.equals("edit")) {
			agenceDao.update(agence);
		} else { 	
			agenceDao.create(agence);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(	@RequestParam(name="numAgence") String numAgence, 
								@RequestParam(name="numBanque") String numBanque)  {
		AgenceId agenceId = new AgenceId(numBanque, numAgence);
		Agence agence = agenceDao.find(agenceId);	
		agenceDao.delete(agence);
		
		return new ModelAndView("agences", "agences", agenceDao.findAll());
	}
	
	public AgenceController() {
	}

}
