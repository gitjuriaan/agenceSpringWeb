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
import vol.model.CompagnieAerienneVol;
import vol.model.CompagnieAerienneVolId;
import vol.model.Vol;
import vol.model.dao.CompagnieAerienneDao;
import vol.model.dao.CompagnieAerienneVolDao;
import vol.model.dao.VolDao;

@Controller
@RequestMapping("/compagnieAerienneVol")
public class CompagnieAerienneVolController {

	@Autowired
	private CompagnieAerienneVolDao compagnieAerienneVolDao;

	@Autowired
	private VolDao volDao;

	@Autowired
	private CompagnieAerienneDao compagnieAerienneDao;

	@RequestMapping("/list")
	public String list(Model model) {
		List<CompagnieAerienneVol> compagnieAerienneVols = compagnieAerienneVolDao.findAll();

		model.addAttribute("compagnieAerienneVols", compagnieAerienneVols);
		return "compagnieAerienneVol"; // renvoie à clients.jsp
	}

	@RequestMapping("/add")
	public String add(Model model) {
		List<CompagnieAerienne> compagnieAeriennes = compagnieAerienneDao.findAll();
		List<Vol> vols = volDao.findAll();
		model.addAttribute("compagnieAeriennes", compagnieAeriennes);
		model.addAttribute("vols", vols);
		
		model.addAttribute("compagnieAerienneVol", new CompagnieAerienneVol());
		model.addAttribute("mode", "add");

		return "compagnieAerienneVolEdit";
	}

	@RequestMapping("/edit") // url /edit
	public String edit(@RequestParam(name = "compagnieAerienneVolId") CompagnieAerienneVolId id,
			// Vol vol, CompagnieAerienne compagnieAerienne,
			Model model) { // va cherche l'id dans l'url au moment de l'edit

		// Vol vol = volDao.find(idVol);
		// CompagnieAerienne compagnieAerienne = compagnieAerienneDao.find(id);

		CompagnieAerienneVol compagnieAerienneVol = compagnieAerienneVolDao.find(id); // on
																						// récupère
																						// le
																						// client

		model.addAttribute("compagnieAerienneVol", compagnieAerienneVol);

		// model.addAttribute("vol", vol);
		// model.addAttribute("compagnieAerienne", compagnieAerienne);

		return "compagnieAerienneVolEdit"; // on renvoi le client dans le model
											// à la jsp
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("compagnieAerienneVol") 
//	@Valid 
	CompagnieAerienneVol compagnieAerienneVol,	
	BindingResult result, 
	Model model
	) {
		if (result.hasErrors()) {
//			List<CompagnieAerienne> compagnieAeriennes = compagnieAerienneDao.findAll();
//			List<Vol> vols = volDao.findAll();
//			model.addAttribute("compagnieAeriennes", compagnieAeriennes);
//			model.addAttribute("vols", vols);
//			return "compagnieAerienneVolEdit";
		}
		

		
		if (compagnieAerienneVol.getId() != null) {
			compagnieAerienneVolDao.update(compagnieAerienneVol);
		} else {
			compagnieAerienneVolDao.create(compagnieAerienneVol);
		}

		return "redirect:list";
	}

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name = "id") CompagnieAerienneVolId id) {
		CompagnieAerienneVol compagnieAerienneVol = compagnieAerienneVolDao.find(id);
		compagnieAerienneVolDao.delete(compagnieAerienneVol);

		return new ModelAndView("compagnieAerienne", "compagnieAeriennes", compagnieAerienneVolDao.findAll());
	}

	public CompagnieAerienneVolController() {
	}

}
