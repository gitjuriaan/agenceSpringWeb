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

import vol.model.EtatReservation;
import vol.model.Reservation;
import vol.model.dao.ReservationDao;



@Controller
@RequestMapping("/reservation") 
public class ReservationController {
	@Autowired
	private ReservationDao reservationDao;
	
	@RequestMapping("/list")
	public String list(Model model) {
		List<Reservation> reservations = reservationDao.findAll();
		
		model.addAttribute("reservations", reservations);
		
		return "reservation";
	}
	
	@RequestMapping("/add")
	public String add(Model model) {
		
		model.addAttribute("reservation",new Reservation());
		model.addAttribute("etatReservations", EtatReservation.values());
		
		return "reservationEdit";
	}
	
	@RequestMapping("/edit")
	public String edit(@RequestParam(name="id") Integer id, Model model) {
		Reservation reservation = reservationDao.find(id);
		
		model.addAttribute("reservation", reservation);
		model.addAttribute("etatReservations", EtatReservation.values());
		
		return "reservationEdit";
	}
	
	@RequestMapping("/save")
	public String save(@ModelAttribute("reservation") @Valid Reservation reservation, BindingResult result,Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("etatReservation", EtatReservation.values());
			return "reservationEdit";
		}
		
		if(reservation.getIdRes() != null) {
			reservationDao.update(reservation);
		} else {
			reservationDao.create(reservation);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam(name="id") Integer id) {
		Reservation reservation = reservationDao.find(id);
		
		reservationDao.delete(reservation);
		
		return new ModelAndView("reservation", "reservations", reservationDao.findAll()); // s ou sans s
	}
	
	
	

}
