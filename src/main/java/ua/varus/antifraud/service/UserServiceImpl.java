package ua.varus.antifraud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ua.varus.antifraud.dao.UserDao;
import ua.varus.antifraud.domain.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private SessionRegistry sessionRegistry;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;


    @Autowired
    @Qualifier("bCryptPasswordEncoder")
    private PasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private UserDao userDao;



    @Override
    public List<Object> getAllPrincipals(){
        return sessionRegistry.getAllPrincipals();
    }



    @Override
    public List<User> getUsersFromSessionRegistry() {
        return sessionRegistry.getAllPrincipals().stream()
                .filter(u -> !sessionRegistry.getAllSessions(u, false).isEmpty())
                .map(u-> (User)u)
                .collect(Collectors.toList());
    }

    @Override
    public String getUser() {
        return request.getRemoteUser();
    }

    @Override
    public boolean hasRole(String role) {
        return request.isUserInRole(role);
    }

    @Override
    public User createUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        return userDao.createUser(user);
    }

    @Override
    public boolean killSessionUser(String login) {
        UserDetails userName = userDetailsService.loadUserByUsername(login);
        List<Object> users = sessionRegistry.getAllPrincipals();
        for (Object user: users) {
            if(userName.equals(user)){
                List<SessionInformation> sessions = sessionRegistry.getAllSessions(user, false);
                sessionRegistry.getSessionInformation(sessions.get(0).getSessionId()).expireNow();
                return true;
            }
        }
        return false;
    }

    @Override
    public List<User> getOnlineUsers() {
        List<User> list = userDao.getAllUsers();
        for(User emp: list){
            for(Object user: sessionRegistry.getAllPrincipals()){
                List<SessionInformation> sessions = sessionRegistry.getAllSessions(user, false);
                if(emp.getUsername().equals(((UserDetails)user).getUsername())){
                    emp.setOnline(true);
                }
            }
        }
        return list;
    }

    @Override
    public byte[] getAvatar(String userName) {
        return userDao.getAvatar(userName);
    }

    @Override
    public boolean deleteUser(User user) {

        killSessionUser(user.getUsername());

        return userDao.deleteUser(user);
    }

    @Override
    public User editUser(User user) {
        return userDao.editUser(user);
    }

    @Override
    public boolean uploadUserImage(MultipartFile multipartFile, String user) {
        return userDao.uploadUserImage(multipartFile, user);
    }

}