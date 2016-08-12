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

import vol.model.CompagnieAerienne;
import vol.model.dao.CompagnieAerienneDao;

@Controller
@RequestMapping("/compagnieAerienne")
public class CompagnieAerienneController {

	@Autowired
	private CompagnieAerienneDao compagnieAerienneDao;

	@RequestMapping("/list")
	public String list(Model model) {
		List<CompagnieAerienne> compagnieAeriennes = compagnieAerienneDao.findAll();
		model.addAttribute("compagnieAeriennes", compagnieAeriennes);
		return "compagnieAerienne"; // renvoie à clients.jsp
	}

	@RequestMapping("/add")
	public String add(Model model) {
		model.addAttribute("compagnieAerienne", new CompagnieAerienne());
		model.addAttribute("mode", "add");

		return "compagnieAerienneEdit";
	}

	@RequestMapping("/edit") // url /edit
	public String edit(@RequestParam(name = "id") Integer id, Model model) { // va 
																				// cherche
																				// l'id
																				// dans
																				// l'url
																				// au
																				// moment
																				// de
																				// l'edit
		CompagnieAerienne compagnieAerienne = compagnieAerienneDao.find(id); // on
																				// récupère
																				// le
																				// client
		model.addAttribute("compagnieAerienne", compagnieAerienne);
		model.addAttribute("mode", "edit"); // on le balance dans le model
		return "compagnieAerienneEdit"; // on renvoi le client dans le model à
										// la jsp
	}

	@RequestMapping("/save")
	public String save(	@ModelAttribute("compagnieAerienne") @Valid CompagnieAerienne compagnieAerienne, 
						BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "compagnieAerienneEdit";
		}

		if (compagnieAerienne.getId() != null) {
			compagnieAerienneDao.update(compagnieAerienne);
		} else {
			compagnieAerienneDao.create(compagnieAerienne);
		}

		return "redirect:list";
	}

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name = "id") Integer id) {
		CompagnieAerienne compagnieAerienne = compagnieAerienneDao.find(id);
		compagnieAerienneDao.delete(compagnieAerienne);

		return new ModelAndView("compagnieAerienne", "compagnieAeriennes", compagnieAerienneDao.findAll());
	}

	public CompagnieAerienneController() {
	}

}
