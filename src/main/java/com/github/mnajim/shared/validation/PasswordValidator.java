package com.github.mnajim.shared.validation;

import jdk.nashorn.api.scripting.NashornScriptEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import javax.script.ScriptException;

@Component
public class PasswordValidator implements Validator {

    @Autowired
    private NashornScriptEngine nashornScriptEngine;

    @Override
    public boolean supports(Class<?> aClass) {
        return User.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, Errors errors){
        User user = (User) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.password", "password is required.");

        if(!isValidPassword(user.getPassword())){
            errors.rejectValue("password", "error.password", null, "password is too weak");

        }
    }

    public Boolean isValidPassword(String password) {
        try {
            return (Boolean) nashornScriptEngine.invokeFunction("isValidPassword", password);
        } catch (ScriptException | NoSuchMethodException e) {
            throw new RuntimeException(e);
        }
    }
}
