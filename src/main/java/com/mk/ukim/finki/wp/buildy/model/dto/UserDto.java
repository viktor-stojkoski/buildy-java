package com.mk.ukim.finki.wp.buildy.model.dto;

import lombok.Data;

import java.util.List;

@Data
public class UserDto extends BaseDto {

    public String emailAddress;

    public String username;

    public List<RoleDto> roles;
}
