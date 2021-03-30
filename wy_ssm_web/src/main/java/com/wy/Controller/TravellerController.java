package com.wy.Controller;

import com.github.pagehelper.PageInfo;
import com.wy.entity.Traveller;
import com.wy.entity.TravellerModel;
import com.wy.service.ITravellerService;
import com.wy.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/travller")
public class TravellerController {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private IOrdersService ordersService;
    @Autowired
    private ITravellerService travellerService;
    @RequestMapping("/save.do")
    public String save(TravellerModel travellerModel){
        List<Traveller> travellers = travellerModel.getTravellers();
        String memberId= (String) request.getSession().getAttribute("userId");
        String desc = travellerModel.getDesc();
        desc=desc==null?"没有备注":desc;
        List<Traveller> list=new ArrayList<>();
        for (Traveller traveller : travellers) {
            if (traveller.getName()==""||traveller.getPhoneNum()==""||traveller.getCredentialsNum()==""){
                continue;
            }
            list.add(traveller);
        }
        String oid = ordersService.addOrder(memberId, travellerModel.getProductId(), list.size()+1, desc,travellerModel.getPayType());
        List<String> tids = travellerService.saveTravellers(list);
        ordersService.addTravellerToOrder(oid,tids);
        return "main";
    }
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "4") Integer size){
        ModelAndView mv=new ModelAndView();
        List<Traveller> travellers=travellerService.findAll(page,size);
        PageInfo pageInfo=new PageInfo(travellers);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("flag",1);
        mv.setViewName("travellers-list");
        return mv;
    }
    @RequestMapping("/searchByName.do")
    public ModelAndView searchByName(String name,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        if (name =="") {
            List<Traveller> travellers=travellerService.findAll(page,size);
            PageInfo pageInfo=new PageInfo(travellers);
            mv.addObject("pageInfo",pageInfo);
            mv.addObject("flag",1);
            mv.setViewName("travellers-list");
            return mv;
        }
        String names = java.net.URLDecoder.decode(name, "utf-8");
        List<Traveller> res =travellerService.searchByName(names,page,size);
        PageInfo pageInfo=new PageInfo(res);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("flag",0);
        mv.addObject("name",name);
        mv.setViewName("travellers-list");
        return mv;
    }
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id){
        ModelAndView mv=new ModelAndView();
        Traveller traveller=travellerService.findById(id);
        mv.addObject("traveller",traveller);
        mv.setViewName("traveller-inf");
        return mv;
    }
    @RequestMapping("/update.do")
    public String update(Traveller traveller){
        travellerService.update(traveller);
        return "redirect:findAll.do";
    }
    @RequestMapping("/deleteByIds.do")
    public String deleteByIds(String[] ids){
        travellerService.deleteByIds(ids);
        return "redirect:findAll.do";
    }
}
