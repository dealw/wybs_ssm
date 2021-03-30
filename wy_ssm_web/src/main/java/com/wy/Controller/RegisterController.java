package com.wy.Controller;

import com.wy.entity.Register;
import com.wy.service.IRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    private IRegisterService registerService;
    @RequestMapping("/save.do")
    public String save(Register regist) throws Exception {
        registerService.save(regist);
        return "redirect:../login";
    }
    @RequestMapping("/update.do")
    public String update(Register regist) throws Exception{
        registerService.update(regist);
        return "redirect:../logout.do";
    }
}
