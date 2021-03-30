package com.wy.service.Impl;

import com.github.pagehelper.PageHelper;
import com.wy.dao.IRoleDao;
import com.wy.entity.Permission;
import com.wy.entity.Role;
import com.wy.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class RoleServiceImpl implements IRoleService {
    @Autowired
    private IRoleDao roleDao;
    @Override
    public List<Role> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return roleDao.findAll();
    }

    @Override
    public void save(Role role) throws Exception {
        roleDao.save(role);
    }

    @Override
    public List<Permission> findRoleByIdAndAllPermission(String roleId) throws Exception {
        return roleDao.findRoleByIdAndAllPermission(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] ids) throws Exception {
        for (String id : ids) {
            roleDao.addPermissionToRole(roleId,id);
        }
    }

    @Override
    public List<Permission> findById(String id) {
        return roleDao.findById(id);
    }
}
