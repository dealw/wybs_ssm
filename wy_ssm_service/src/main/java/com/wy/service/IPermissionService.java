package com.wy.service;

import com.wy.entity.Permission;

import java.util.List;

public interface IPermissionService {
    public List<Permission> findAll(Integer page,Integer size) throws Exception;

    void save(Permission permission) throws Exception;
}
