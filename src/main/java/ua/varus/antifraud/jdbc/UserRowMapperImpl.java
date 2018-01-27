package ua.varus.antifraud.jdbc;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import ua.varus.antifraud.domain.User;
import ua.varus.antifraud.domain.UserRole;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserRowMapperImpl implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet rs, int rowNum) throws SQLException {

        List<SimpleGrantedAuthority> auths = new ArrayList<>();
        auths.add(new SimpleGrantedAuthority(rs.getString("role")));

        UserRole userRole = UserRole.builder()
                .role(rs.getString("role"))
                .userRoleId(rs.getInt("user_role_id"))
                .build();
        Set<UserRole> userRoleSet = new HashSet<>();
        userRoleSet.add(userRole);


        User user = User.builder()
                .username(rs.getString("userName"))
                .password(rs.getString("password"))
                .enabled(rs.getBoolean("enabled"))
                .firstname(rs.getString("firstname"))
                .lastname(rs.getString("lastname"))
                .position(rs.getString("position"))
                .userRole(userRoleSet)
                .build();

        return user;
    }
}
