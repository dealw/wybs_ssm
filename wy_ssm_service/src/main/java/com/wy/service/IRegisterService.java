package com.wy.service;

import com.wy.entity.Register;

public interface IRegisterService {
    void save(Register regist) throws Exception;

    void update(Register regist) throws Exception;
}
