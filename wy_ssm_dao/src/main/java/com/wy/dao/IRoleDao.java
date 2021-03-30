package com.wy.dao;

import com.wy.entity.Permission;
import com.wy.entity.Role;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {
    @Select("SELECT * FROM role WHERE id IN(SELECT roleId FROM users_role WHERE userId=#{id})")
    @Results({
            @Result(property = "id",column = "id",id = true),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,many = @Many(select = "com.wy.dao.IPermissionDao.findPermissionByRoleId"))
    })
    public List<Role> findRoleByUserId(String id);

    //查询所有的角色
    @Select("select * from role")
    List<Role> findAll() throws Exception;

    @Insert("insert into role (roleName,roleDesc) values(#{roleName},#{roleDesc})")
    void save(Role role);

    @Select("select * from permission where id not in(select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findRoleByIdAndAllPermission(String roleId) throws Exception;

    @Insert("insert into role_permission (permissionId,roleId) values(#{permissionId},#{roleId})")
    void addPermissionToRole(@Param("roleId") String roleId,@Param("permissionId") String id);
    @Select("select id from role where roleName=#{roleName}")
    String findRoleIdByRoleName(String roleName);
    @Select("select * from permission where id in(select permissionId from role_permission where roleId=#{id})")
    List<Permission> findById(String id);
}
