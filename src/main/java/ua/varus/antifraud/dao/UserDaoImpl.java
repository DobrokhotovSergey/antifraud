package ua.varus.antifraud.dao;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import ua.varus.antifraud.domain.User;
import ua.varus.antifraud.jdbc.UserRowMapperImpl;

@Repository
@Slf4j
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final String FIND_BY_USERNAME =
            "select u.username, u.password, u.enabled,u.firstname,u.lastname,u.position, r.role, r.user_role_id from "+
                    Constants.TABLE_USERS+" u " +
            "join "+Constants.TABLE_USER_ROLES+" r on u.username = r.username where u.username =?";


    @Override
    public User findByUserName(String username) {
        User user = null;
        try{
            user = jdbcTemplate.queryForObject(FIND_BY_USERNAME, new UserRowMapperImpl(), username);
        }catch (Exception ex){
            System.out.println(ex);
            log.error("Error findByUsername : {}, {}", ExceptionUtils.getMessage(ex), ExceptionUtils.getMessage(ex.getCause()));
        }
        return user;
    }
}
