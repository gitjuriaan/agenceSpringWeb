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


import vol.model.Ville;
import vol.model.dao.VilleDao;



@Controller
@RequestMapping("/ville")
public class VilleController {
	
	@Autowired
	private VilleDao villeDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Ville> villes = villeDao.findAll();
		
		model.addAttribute("villes", villes);
		
		return "ville";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		
		model.addAttribute("ville",new Ville());
		
		
		return "villeEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name="id") Integer id, Model model) {
		Ville ville = villeDao.find(id);
		
		model.addAttribute("ville", ville);
		
		
		return "villeEdit";
	}
	
	@RequestMapping("/save")
	public String save(@ModelAttribute("ville") @Valid Ville ville, BindingResult result,Model model) {
		
		if(result.hasErrors()) {
			
			return "villeEdit";
		}
		
		if(ville.getIdVil() != null) {
			villeDao.update(ville);
		} else {
			villeDao.create(ville);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name="id") Integer id) {
		Ville ville = villeDao.find(id);
		
		villeDao.delete(ville);
		
		return new ModelAndView("ville", "villes", villeDao.findAll()); // s ou sans s
	}	
	
	
	
	

}
