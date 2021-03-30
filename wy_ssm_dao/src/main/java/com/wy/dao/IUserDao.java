package com.wy.dao;

import com.wy.entity.Member;
import com.wy.entity.Register;
import com.wy.entity.Role;
import com.wy.entity.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IUserDao {
    @Select("select * from users where username=#{username}")
    @Results({
            @Result(property = "id",column = "id",id = true),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.wy.dao.IRoleDao.findRoleByUserId"))
    })
    public UserInfo findByUserName(String username) throws Exception;

    @Select("select * from users")
    List<UserInfo> findAll() throws Exception;
    //添加用户信息
    @Insert("insert into users(email,username,password,phoneNum,status) values(#{email},#{username},#{password},#{phoneNum},#{status})")
    void save(UserInfo userInfo) throws Exception;

    //根据用户id查询用户的详细信息
    @Select("select * from users where id=#{id}")
    @Results({
            @Result(property = "id",column = "id",id = true),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,many = @Many(select = "com.wy.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findById(String id) throws Exception;

    @Select("select * from role where id not in (select roleId from users_role where userId=#{userId})")
    List<Role> findUserRole(String userId);

    @Insert("insert into users_role (userId,roleId) values(#{userId},#{role})")
    void addRoleToUser(@Param("userId") String userId, @Param("role") String role) throws Exception;

    //查询用户现有的角色
    @Select("select * from role where id in (select roleId from users_role where userId=#{userId})")
    List<Role> findUserAllRole(String userId);
    @Delete("delete from users_role where userId=#{userId} and roleId=#{role}")
    void delRoleToUser(@Param("userId")String userId,@Param("role")String role);
    @Select("select * from users where id=#{id}")
    @Results({
            @Result(property = "id",column = "id",id = true),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "realName",column = "username",javaType = String.class,one = @One(select = "com.wy.dao.IMemberDao.findByUsername"))
    })
    Register findByUserId(String id);
    @Delete("delete from users where id=#{id}")
    void deleteUser(String id);
    @Select("select * from users where username like #{name} or email like #{name} or phoneNum like #{name}")
    List<UserInfo> searchByName(String name);
    @Update("update users set PASSWORD=#{pass} where id=#{id}")
    void updatepass(@Param("id") String id, @Param("pass") String passwordEncoder);
    @Update("update users set email=#{email},username=#{username},phoneNum=#{phoneNum},STATUS=#{status} where id=#{id}")
    void updateuser(UserInfo userInfo);
    @Select("select count(*) from users")
    Integer getCount();
}
