package com.wy.service;

import com.wy.entity.Permission;
import com.wy.entity.Role;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IRoleService {
//查询所有的权限
    List<Role> findAll(Integer page,Integer size) throws Exception;

    //添加角色
    void save(Role role) throws Exception;
    //找到角色可以添加的权限
    List<Permission> findRoleByIdAndAllPermission(String roleId) throws Exception;

    //给角色添加权限
    void addPermissionToRole(String roleId, String[] ids) throws Exception;
    //查找角色对应的所有权限
    List<Permission> findById(String id);
}
