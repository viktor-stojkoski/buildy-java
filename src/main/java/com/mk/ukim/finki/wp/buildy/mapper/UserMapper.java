package com.mk.ukim.finki.wp.buildy.mapper;

import com.mk.ukim.finki.wp.buildy.model.dto.RoleDto;
import com.mk.ukim.finki.wp.buildy.model.dto.UserDto;
import com.mk.ukim.finki.wp.buildy.model.entity.Role;
import com.mk.ukim.finki.wp.buildy.model.entity.User;

import java.util.List;
import java.util.stream.Collectors;

public final class UserMapper {

    public static UserDto toUserDto(User user) {
        UserDto userDto = new UserDto();

        userDto.setId(user.getId());
        userDto.setUid(user.getUid());
        userDto.setEmailAddress(user.getEmailAddress());
        userDto.setUsername(user.getUsername());
        userDto.setRoles(toRoleDtos(user.getRoles()));

        return userDto;
    }

    public static List<RoleDto> toRoleDtos(List<Role> roles) {
        return roles
                .stream()
                .map(UserMapper::toRoleDto)
                .collect(Collectors.toList());
    }

    public static RoleDto toRoleDto(Role role) {
        RoleDto roleDto = new RoleDto();

        roleDto.setName(role.getName());

        return roleDto;
    }
}
