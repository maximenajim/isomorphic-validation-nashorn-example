package com.github.mnajim.shared.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
public class HomeController {

    @Autowired
    PasswordValidator passwordValidator;

    @ModelAttribute("user")
    public User getPassword() {
        return new User();
    }

    @RequestMapping(value="/", method=RequestMethod.GET)
    public String password() {
        return "form";
    }

    @RequestMapping(value="/results", method=RequestMethod.GET)
    public String results() {
        return "results";
    }

    @RequestMapping(value = "/addPassword", method = RequestMethod.POST)
    public String addPassword(@ModelAttribute("user") @Valid User user, BindingResult bindingResult) {
        passwordValidator.validate(user, bindingResult);

        if (bindingResult.hasErrors()) {
            return "form";
        }
        return "redirect:/results";
    }




}
