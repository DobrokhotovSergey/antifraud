package ua.varus.antifraud.dao;


import ua.varus.antifraud.domain.User;

import java.util.List;

public interface UserDao {
    User findByUserName(String username);
    User createUser(User user);
    List<User> getAllUsers();
    byte[] getAvatar(String userName);
}
