package com.wy.dao;

import com.wy.entity.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface IPermissionDao {
    //根据roleId查询permission详情
    @Select("SELECT * FROM permission WHERE id IN(SELECT permissionId FROM role_permission WHERE roleId=#{id});")
    public List<Permission> findPermissionByRoleId(String id) throws Exception;

    @Select("select * from permission")
    List<Permission> findAll() throws Exception;

    @Insert("insert into permission (permissionName,url) values(#{permissionName},#{url})")
    void save(Permission permission) throws Exception;
}
