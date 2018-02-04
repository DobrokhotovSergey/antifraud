package ua.varus.antifraud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import ua.varus.antifraud.dao.UserDao;
import ua.varus.antifraud.domain.User;

@Service
public class UserValidator implements Validator {
    @Autowired
    private UserDao userDao;

    public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

    public void validate(Object o, Errors errors) {
        User user = (User) o;
        if (userDao.findByUserName(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

    }
}
