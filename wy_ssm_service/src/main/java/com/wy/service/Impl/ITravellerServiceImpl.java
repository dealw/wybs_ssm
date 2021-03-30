package com.wy.service.Impl;

import com.github.pagehelper.PageHelper;
import com.wy.dao.IOrdersDao;
import com.wy.dao.ITravellerDao;
import com.wy.entity.Traveller;
import com.wy.service.ITravellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ITravellerServiceImpl implements ITravellerService {
    @Autowired
    private ITravellerDao travellerDao;
    @Autowired
    private IOrdersDao ordersDao;
    @Override
    public List<String> saveTravellers(List<Traveller> travellers) {
        List<String> idList=new ArrayList<>();
        for (Traveller traveller : travellers) {
            Traveller res=travellerDao.issaved(traveller);
            if (res!=null){
                idList.add(res.getId());
                continue;
            }
            travellerDao.saveTravellers(traveller);
            idList.add(travellerDao.issaved(traveller).getId());
        }
        return idList;
    }

    @Override
    public List<Traveller> findAll(int page, int size) {
        PageHelper.startPage(page,size);
        return travellerDao.findAll();
    }

    @Override
    public Traveller findById(String id) {
        return travellerDao.findById(id);
    }

    @Override
    public void update(Traveller traveller) {
        travellerDao.update(traveller);
    }

    @Override
    public void deleteByIds(String[] ids) {
        for (String id : ids) {
            travellerDao.deleteByIds(id);
            //查找与要删除的旅客关联的订单号
            List<String> oids=travellerDao.findAllOidByTid(id);
            //在订单旅客关系表中删除和该旅客相关的记录
            travellerDao.deleteTravellerInorder(id);
            //根据订单号依次给订单的人数减一
            for (String oid : oids) {
                ordersDao.updatePeopleCountReduceByid(oid);
            }
        }
    }

    @Override
    public List<Traveller> searchByName(String name, Integer page, Integer size) {
        PageHelper.startPage(page,size);
        name="%"+name+"%";
        return travellerDao.searchByName(name);
    }

    @Override
    public Integer getCount() {
        return travellerDao.getCount();
    }
}
