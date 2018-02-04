package ua.varus.antifraud.dao;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.SqlLobValue;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import ua.varus.antifraud.domain.User;
import ua.varus.antifraud.jdbc.UserRowMapperImpl;

import java.sql.Types;
import java.util.List;

import static ua.varus.antifraud.dao.Constants.TABLE_USERS;
import static ua.varus.antifraud.dao.Constants.TABLE_USER_ROLES;

@Repository
@Slf4j
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static final String FIND_BY_USERNAME =
            "select u.username, u.password, u.enabled,u.firstname,u.lastname,u.position, r.role, r.user_role_id from "+
                    TABLE_USERS+" u " +
            "join "+ TABLE_USER_ROLES+" r on u.username = r.username where u.username =?";

    private static final String GET_ALL_USERS =
            "select a.user_role_id, a.userName, a.role,b.password, b.enabled, b.firstname, b.lastname, b.position from "+
            TABLE_USER_ROLES +" a join "+ TABLE_USERS +" b on a.userName = b.userName";

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

    private static final String CREATE_USER = "insert into "+ TABLE_USERS +
            "(username,password,position,enabled,firstname,lastname) values(?,?,?,?,?,?); insert into "+
            TABLE_USER_ROLES+"(username, role) values(?,?)";
    @Override
    public User createUser(User user) {
        try{
            jdbcTemplate.update(CREATE_USER, new Object[]{user.getUsername(), user.getPassword(),user.getPosition(), 1,user.getFirstname(),user.getLastname(),
                    user.getUsername(), user.getUserRole().getRole()});
            log.info("createUser {}", user);
            return findByUserName(user.getUsername());
        }catch (Exception ex){
            log.error("Error createUser : {}, {}", ExceptionUtils.getMessage(ex), ExceptionUtils.getMessage(ex.getCause()));
        }
        return null;
    }

    @Override
    public List<User> getAllUsers() {
        try{
            List<User> list = jdbcTemplate.query(GET_ALL_USERS, new UserRowMapperImpl());
            return list;
        }catch (Exception ex){
            log.error("Error getAllUsers : {}, {}", ExceptionUtils.getMessage(ex), ExceptionUtils.getMessage(ex.getCause()));

        }
        return null;
    }
    private static final String GET_AVATAR = "select avatar from "+ TABLE_USERS+" where username =?";

    @Override
    public byte[] getAvatar(String userName) {
        try {
            byte[] image = jdbcTemplate.queryForObject(GET_AVATAR, (rs, rowNum) -> rs.getBytes(1), userName);
            return image;
        } catch (Exception ex) {
            log.error("Error getAvatar : {}, {}", ExceptionUtils.getMessage(ex), ExceptionUtils.getMessage(ex.getCause()));
        }
        return new byte[0];
    }

    private static final String DELETE_USER = "delete from "+TABLE_USER_ROLES +" where user_role_id =?; delete from "+TABLE_USERS+" where username =?";

    @Override
    public boolean deleteUser(User user) {
        try{
            int result = jdbcTemplate.update(DELETE_USER, new Object[]{user.getUserRole().getUserRoleId(), user.getUsername()});
            if(result==1){
                return true;
            }
        }catch (Exception ex){
            log.error("Error deleteUser: {}, {}", ExceptionUtils.getMessage(ex), ExceptionUtils.getMessage(ex.getCause()));
        }
        log.info(" deleteUser {}", user);
        return false;
    }

    private static final String EDIT_USER = "update "+TABLE_USERS +" set firstname=?, lastname=?, position=? where username=?;"+
            "update "+TABLE_USER_ROLES+" set role=? where user_role_id=?";

    @Override
    public User editUser(User user) {
        try{
            int result = jdbcTemplate.update(EDIT_USER, new Object[]{user.getFirstname(), user.getLastname(), user.getPosition(), user.getUsername(),
                    user.getUserRole().getRole(), user.getUserRole().getUserRoleId()
            });
            if(result==1){
                return findByUserName(user.getUsername());
            }
        }catch (Exception ex){
            log.error("Error editUser {}, {}", ExceptionUtils.getMessage(ex), ExceptionUtils.getMessage(ex.getCause()));
        }
        return null;
    }

    private static final String UPLOAD_AVATAR = "update "+ TABLE_USERS+" set avatar = ? where userName = ? ";

    @Override
    public boolean uploadUserImage(MultipartFile multipartFile, String user) {
        try{
            LobHandler lobHandler = new DefaultLobHandler();
            int result = jdbcTemplate.update(UPLOAD_AVATAR, new Object[] {new SqlLobValue(multipartFile.getInputStream(), (int)multipartFile.getSize(), lobHandler), user},
                    new int[] {Types.BLOB, Types.VARCHAR} );
            if(result==1){
                return true;
            }
        }catch (Exception ex){
            log.error("Error uploadUserImage : {}, {}", ExceptionUtils.getMessage(ex), ExceptionUtils.getMessage(ex.getCause()));
        }
        log.info(" uploadUserImage {}, {}", user, multipartFile);
        return false;
    }
}
