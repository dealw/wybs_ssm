package com.wy.service;

import com.wy.entity.Register;
import com.wy.entity.Role;
import com.wy.entity.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    List<UserInfo> findAll(Integer page,Integer size) throws Exception;

    //添加用户信息
    void save(UserInfo userInfo) throws Exception;

    //根据用户id查询用户详细信息
    UserInfo findById(String id) throws Exception;

    //查询用户可以添加的角色
    List<Role> findUserRole(String userId) throws Exception;

    //给用户添加角色
    void addRoleToUser(String userId, String[] roles) throws Exception;

    List<Role> findUserAllRole(String userId) throws Exception;
    //删除用户角色
    void delRoleToUser(String userId, String[] roles) throws Exception;

    Register findByUserId(String id) throws Exception;
    //删除用户
    void deleteUser(String[] ids);

    List<UserInfo> searchByName(String name, Integer page, Integer size);

    void updatepass(String id, String passwordEncoder);

    void updateuser(UserInfo userInfo);

    Integer getCount();
}
