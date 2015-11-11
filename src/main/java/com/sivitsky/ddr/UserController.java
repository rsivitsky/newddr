package com.sivitsky.ddr;

import com.sivitsky.ddr.model.User;
import com.sivitsky.ddr.service.RoleService;
import com.sivitsky.ddr.service.UserService;
import com.sivitsky.ddr.service.VendorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@SessionAttributes({"user"})
public class UserController {

	private UserService userService;
	private RoleService roleService;
	private VendorService vendorService;

	@Autowired(required=true)
	public void setUserService(UserService userService)
	{
		this.userService = userService;
	}

	@Autowired(required=true)
	public void setRoleService(RoleService roleService)
	{
		this.roleService = roleService;
	}

	@Autowired(required=true)
	public void setVendorService(VendorService vendorService)
	{
		this.vendorService = vendorService;
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String startPage(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("listUsers", userService.listUsers());
		model.addAttribute("listRoles", roleService.listRole());
		model.addAttribute("listVendors", vendorService.listVendor());
		return "user";
	}

	//For add and update person both
	@RequestMapping(value= "/user/add", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user, BindingResult result){
		user = this.userService.saveUser(user);
		return "redirect:/user";
	}
	
	@RequestMapping("/remove/{user_id}")
    public String removeUser(@PathVariable("user_id") Long id){
        this.userService.removeUser(id);
        return "redirect:/user";
    }
 
    @RequestMapping("/edit/{user_id}")
    public String editUser(@PathVariable("user_id") Long id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        model.addAttribute("listUsers", this.userService.listUsers());
		model.addAttribute("listRoles", this.roleService.listRole());
		model.addAttribute("listVendors", this.vendorService.listVendor());
        return "user";
    }
}
