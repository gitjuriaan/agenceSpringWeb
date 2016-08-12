package agence.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vol.model.Client;
import vol.model.dao.ClientDao;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private ClientDao clientDao;

	@RequestMapping("/formulaire")
	public String formulaire() {

		return "login";
	}

	@RequestMapping("/connect")
	public String connect(@RequestParam(name = "username") String username, @RequestParam(name = "password") String password,
			Model model) {

		if (password == null || username == null) {
			return "login";
		}

		List<Client> listClient = clientDao.findAll();

		Boolean userOk = false;
		Boolean passwordOk = true;
		Boolean adminOk = false;

		for (Client c : listClient) {
			if (username.equals(c.getLog().getLogin())) {
				userOk = true;
				if (password.equals(c.getLog().getMotDePasse())) {
					passwordOk = true;

					if (c.getLog().getAdmin()) {
						adminOk = true;
					}
				}
			}
		}

		if (userOk && passwordOk && adminOk) {
			model.addAttribute("msg", "welcome");
			model.addAttribute("connection", "oui");
			return "index";
		} else {
			if (userOk) {
				model.addAttribute("error", "Login inconnu");
			}
			if (passwordOk) {
				model.addAttribute("error", "Mot de passe incorrect");
			}
			if (adminOk) {
				model.addAttribute("error", "Vous n'êtes pas Admin");
			}
			return "login";
		}
	}

}
