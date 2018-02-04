package ua.varus.antifraud.service;

import org.springframework.web.multipart.MultipartFile;
import ua.varus.antifraud.domain.User;

import java.util.List;

public interface UserService {

    List<Object> getAllPrincipals();
    List<User> getUsersFromSessionRegistry();
    String getUser();
    boolean hasRole(String role);
    User createUser(User user);
    boolean killSessionUser(String userName);
    List<User> getOnlineUsers();
    byte[] getAvatar(String userName);
    boolean deleteUser(User user);
    User editUser(User user);
    boolean uploadUserImage(MultipartFile multipartFile, String user);

}
