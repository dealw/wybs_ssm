package com.wy.Controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.wy.entity.SysLog;
import com.wy.service.ISysLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {
    @Autowired
    private ISysLogService sysLogService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "7")Integer size)throws Exception{
        ModelAndView mv=new ModelAndView();
        List<SysLog> logs = sysLogService.findAll(page,size);
        PageInfo pageInfo=new PageInfo(logs);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("syslog-list");
        return mv;
    }
}
