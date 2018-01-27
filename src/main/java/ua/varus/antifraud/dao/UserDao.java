package ua.varus.antifraud.dao;


import ua.varus.antifraud.domain.User;

public interface UserDao {
    User findByUserName(String username);
}
