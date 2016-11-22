package org.coop.sidc.controllers;

import java.util.List;

import org.coop.sidc.domain.Staff;
import org.coop.sidc.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value={"/staff"})
public class StaffController {
	@Autowired
	StaffService staffService;
	
	
	
	/*@RequestMapping(value={"/login","/"},method=RequestMethod.GET)
	public String login(){
		
		return "login";
	}*/
	
	// to show the  staff.jsp page to add new staff
	@RequestMapping(value={"/add"},method=RequestMethod.GET)
	public String getForm(@ModelAttribute("newStaff") Staff staff,Model model){
		return "staffForm";
	}
	//save the staff's data to the DB and redirect to the list with validation
	@RequestMapping(value={"/add"},method=RequestMethod.POST)// with validation 
	public String stsave(@ModelAttribute("newStaff") @Validated Staff staffObj, BindingResult result,Model model){
		if(result.hasErrors()){
			return "staffForm";
		}else{
		staffService.save(staffObj);
		
		model.addAttribute("stafflist", staffService.getAllStaff());
		
		return "redirect:/staff/list";
		}
	}
	//to gate the id to edit the staff's DB
	@RequestMapping(value="/staffEdit/{id}", method=RequestMethod.GET)
	public String get(@PathVariable long id, Model model) {
		model.addAttribute("editStaff", staffService.getStaffById(id));
		return "editStaffPage";
	}
	//to get the id along with it's data and again save into the DB along with the validation
	@RequestMapping(value="/staffEdit/{id}", method=RequestMethod.POST)
	public String update(Staff staff, @PathVariable long id, @ModelAttribute("editStaff") @Validated Staff editStaff, BindingResult result, Model model) {
		if(result.hasErrors()){
			return"editStaffPage";
		}else{
		staff.setId(id);
		staffService.save(editStaff);
		model.addAttribute("stafflist", staffService.getAllStaff());
		return "redirect:/staff/list";
		}
	}
	//to delete the staff member by id
	@RequestMapping(value="/staffDelete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable("id") Long id) {
		staffService.delete(id);
		return "redirect:/staff/list";
	}
	//to display the list 
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String getList(Model model) {
		List<Staff> staffList=staffService.getAllStaff();
		model.addAttribute("stafflist",staffList);
		return "stafflist";
	}
	
	@ModelAttribute("stafflist")
	public List<Staff> showList(){
		List<Staff> staffList=staffService.getAllStaff();
		return staffList;
	}

}
