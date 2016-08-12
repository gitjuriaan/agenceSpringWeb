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


import vol.model.Vol;
import vol.model.dao.VolDao;

@Controller
@RequestMapping("/vol")
public class VolController {
	
	@Autowired
	private VolDao volDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Vol> vols = volDao.findAll();
		
		model.addAttribute("vols", vols);
		
		return "vol";
	}
	
	@RequestMapping("/add")
	public String add(Model model){
		
		model.addAttribute("vol", new Vol());
		return "volEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam (name="idVol") Integer id, Model model) {
		Vol vol = volDao.find(id);
		
		model.addAttribute("vol", vol);
				
		return "volEdit";
	}
	
	@RequestMapping("/save")
	public String save(@ModelAttribute("vol") @Valid Vol vol,BindingResult result, Model model) {
			
		if(result.hasErrors()) {
			return "volEdit";
		}
		
		if((vol.getDateArrivee()).before(vol.getDateDepart())){
			model.addAttribute("mode","error");
			return "volEdit";
		}
		
		
		if(vol.getIdVol() != null) {
			volDao.update(vol);
		} else {
			volDao.create(vol);
		}
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name="idVol")Integer id) {
		Vol vol = volDao.find(id);
		
		volDao.delete(vol);
		return new ModelAndView ("vol", "vols", volDao.findAll());
	}
}
