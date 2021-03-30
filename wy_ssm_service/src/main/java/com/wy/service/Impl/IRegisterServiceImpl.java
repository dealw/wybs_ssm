package com.wy.service.Impl;

import com.wy.dao.IRegisterDao;
import com.wy.dao.IRoleDao;
import com.wy.dao.IUserDao;
import com.wy.entity.Register;
import com.wy.entity.UserInfo;
import com.wy.service.IRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class IRegisterServiceImpl implements IRegisterService {
    @Autowired
    private IRegisterDao registerDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;//自动注入加密工具
    @Autowired
    private IUserDao userDao;
    @Autowired
    private IRoleDao roleDao;
    @Override
    public void save(Register regist) throws Exception {
        regist.setPassword(bCryptPasswordEncoder.encode(regist.getPassword()));
        registerDao.saveUser(regist);
        String userId = userDao.findByUserName(regist.getUsername()).getId();
        regist.setId(userId);
        registerDao.saveMember(regist);
        String roleId = roleDao.findRoleIdByRoleName("USER");
        userDao.addRoleToUser(userId,roleId);
    }

    @Override
    public void update(Register regist) throws Exception {
        registerDao.update(regist);
        registerDao.updateMem(regist);
    }
}
