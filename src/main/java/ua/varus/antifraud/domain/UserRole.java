package ua.varus.antifraud.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserRole {
    private Integer userRoleId;
    private User user;
    private String role;
}
