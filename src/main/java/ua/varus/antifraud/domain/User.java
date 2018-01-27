package ua.varus.antifraud.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashSet;
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
    private String username;
    private String password;
    private String position;
    private String firstname;
    private String lastname;
    private boolean enabled;
    private Set<UserRole> userRole = new HashSet<UserRole>(0);
}
