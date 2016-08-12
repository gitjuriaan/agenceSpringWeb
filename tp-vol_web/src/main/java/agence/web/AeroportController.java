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

import vol.model.Aeroport;
import vol.model.dao.AeroportDao;

@Controller
@RequestMapping("/aeroport")
public class AeroportController {

	@Autowired
	private AeroportDao aeroportDao;

	@RequestMapping("/list")
	public String list(Model model) {
		List<Aeroport> aeroports = aeroportDao.findAll();

		model.addAttribute("aeroports", aeroports);

		return "aeroport";
	}

	@RequestMapping("/add")
	public String add(Model model) {

		model.addAttribute("aeroport", new Aeroport());

		return "aeroportEdit";
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "id") Integer id, Model model) {
		Aeroport aeroport = aeroportDao.find(id);

		model.addAttribute("aeroport", aeroport);

		return "aeroportEdit";
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("aeroport") @Valid Aeroport aeroport, BindingResult result) {

		 if(result.hasErrors()) {
		 return "aeroportEdit";
		 }
		
		if (aeroport.getIdAer() != null) {
			aeroportDao.update(aeroport);
		} else {
			aeroportDao.create(aeroport);
		}

		return "redirect:list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam(name = "id") Integer id, Model model) {
		Aeroport aeroport = aeroportDao.find(id);

		aeroportDao.delete(aeroport);

		List<Aeroport> aeroports = aeroportDao.findAll();

		model.addAttribute("aeroports", aeroports);

		return "redirect:list";
	}

}
