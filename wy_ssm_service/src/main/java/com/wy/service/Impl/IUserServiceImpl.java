package com.wy.service.Impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.wy.dao.IMemberDao;
import com.wy.dao.IUserDao;
import com.wy.entity.Register;
import com.wy.entity.Role;
import com.wy.entity.UserInfo;
import com.wy.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Service("userService")
@Transactional
public class IUserServiceImpl implements IUserService {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private IUserDao userDao;
    @Autowired
    private IMemberDao memberDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;//自动注入加密工具

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUserName(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = new User(userInfo.getUsername(), userInfo.getPassword(), userInfo.getStatus() == 0 ? false : true, true, true, true, getAuthority(userInfo.getRoles()));
        request.getSession().setAttribute("userId", userInfo.getId());
        request.getSession().setAttribute("pass", userInfo.getPassword());
        return user;
    }

    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role : roles) {
            list.add(new SimpleGrantedAuthority("ROLE_" + role.getRoleName()));
        }
        return list;
    }

    //查询所有用户的信息
    @Override
    public List<UserInfo> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return userDao.findAll();
    }

    @Override
    public List<UserInfo> searchByName(String name, Integer page, Integer size) {
        PageHelper.startPage(page, size);
        name = "%" + name + "%";
        return userDao.searchByName(name);
    }

    @Override
    public void updatepass(String id, String passwordEncoder) {
        userDao.updatepass(id, passwordEncoder);
    }

    @Override
    public void updateuser(UserInfo userInfo) {
        userDao.updateuser(userInfo);
        memberDao.updatemember(userInfo);
    }

    @Override
    public Integer getCount() {
        return userDao.getCount();
    }

    //添加用户信息
    @Override
    public void save(UserInfo userInfo) throws Exception {
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.save(userInfo);
    }

    //    根据用户id查询用户详细信息
    @Override
    public UserInfo findById(String id) throws Exception {
        return userDao.findById(id);
    }

    //    查询用户可以添加的角色
    @Override
    public List<Role> findUserRole(String userId) throws Exception {
        return userDao.findUserRole(userId);
    }

    //给用户添加角色
    @Override
    public void addRoleToUser(String userId, String[] roles) throws Exception {
        for (String role : roles) {
            userDao.addRoleToUser(userId, role);
        }
    }

    @Override
    public List<Role> findUserAllRole(String userId) throws Exception {
        return userDao.findUserAllRole(userId);
    }

    @Override
    public void delRoleToUser(String userId, String[] roles) throws Exception {
        for (String role : roles) {
            userDao.delRoleToUser(userId, role);
        }
    }

    @Override
    public Register findByUserId(String id) throws Exception {
        return userDao.findByUserId(id);
    }

    @Override
    public void deleteUser(String[] ids) {
        for (String id : ids) {
            userDao.deleteUser(id);
            memberDao.deleteUser(id);
        }
    }


}
