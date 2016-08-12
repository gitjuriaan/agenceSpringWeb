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

import vol.model.Passager;
import vol.model.dao.PassagerDao;

@Controller
@RequestMapping("/passager")
public class PassagerController {

	@Autowired
	private PassagerDao passagerDao;

	@RequestMapping("/list")
	public String list(Model model) {
		List<Passager> passager = passagerDao.findAll();

		model.addAttribute("passager", passager);

		return "passager";
	}

	@RequestMapping("/add")
	public String add(Model model) {

		model.addAttribute("passager", new Passager());

		return "passagerEdit";
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam(name = "idPas") Integer id, Model model) {
		Passager passager = passagerDao.find(id);

		model.addAttribute("passager", passager);

		return "passagerEdit";
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("passager") @Valid Passager passager, BindingResult result) {

		if (result.hasErrors()) {
			return "passagerEdit";
		}

		if (passager.getIdPas() != null) {
			passagerDao.update(passager);
		} else {
			passagerDao.create(passager);
		}

		return "redirect:list";
	}

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name = "idPas") Integer id) {
		Passager passager = passagerDao.find(id);

		passagerDao.delete(passager);

		return new ModelAndView("passager", "passager", passagerDao.findAll());
	}
}
