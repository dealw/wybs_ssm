package com.wy.service;

import com.wy.entity.Traveller;

import java.util.List;

public interface ITravellerService {
    List<String> saveTravellers(List<Traveller> travellers);

    List<Traveller> findAll(int page, int size);

    Traveller findById(String id);

    void update(Traveller traveller);

    void deleteByIds(String[] ids);

    List<Traveller> searchByName(String names, Integer page, Integer size);

    Integer getCount();
}
