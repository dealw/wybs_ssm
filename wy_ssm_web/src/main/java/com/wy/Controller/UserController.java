package com.wy.Controller;

import com.github.pagehelper.PageInfo;
import com.wy.DateUtil.PasswordEncoderUtils;
import com.wy.dao.IUserDao;
import com.wy.entity.RePass;
import com.wy.entity.Register;
import com.wy.entity.Role;
import com.wy.entity.UserInfo;
import com.wy.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private SessionRegistryImpl sessionRegistry;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private IUserService userService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<UserInfo> allUsers =userService.findAll(page,size);
        PageInfo pageInfo=new PageInfo(allUsers);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("flag",1);
        mv.setViewName("user-list");
        return mv;
    }
    @RequestMapping("/searchByName.do")
    public ModelAndView searchByName(String name,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv=new ModelAndView();
        if (name =="") {
            List<UserInfo> allUsers =userService.findAll(page,size);
            PageInfo pageInfo=new PageInfo(allUsers);
            mv.addObject("pageInfo",pageInfo);
            mv.addObject("flag",1);
            mv.setViewName("user-list");
            return mv;
        }
        String names = java.net.URLDecoder.decode(name, "utf-8");
        List<UserInfo> res =userService.searchByName(names,page,size);
        PageInfo pageInfo=new PageInfo(res);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("flag",0);
        mv.addObject("name",name);
        mv.setViewName("user-list");
        return mv;
    }
    @RequestMapping("/save.do")
    public String save(UserInfo userInfo) throws Exception {
        if (userInfo.getUsername()==""||userInfo.getEmail()==""||userInfo.getPassword()==""||userInfo.getPhoneNum()==""){
            return "redirect:findAll.do";
        }
        userService.save(userInfo);
        return "redirect:findAll.do";
    }
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        UserInfo user=userService.findById(id);
        mv.addObject("user",user);
        mv.setViewName("user-show");
        return mv;
    }
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name = "id",required = true)String userId) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Role> userRole=userService.findUserRole(userId);
        mv.addObject("user",userId);
        mv.addObject("roleList",userRole);
        mv.setViewName("user-role-add");
        return mv;
    }
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name = "userId",required = true) String userId,@RequestParam(name = "ids",required = true)String[] roles) throws Exception {
        userService.addRoleToUser(userId,roles);
        return "redirect:findAll.do";
    }
    @RequestMapping("/findUserAllRole.do")
    public ModelAndView findUserAllRole(@RequestParam(name = "id",required = true)String userId) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Role> userRoles=userService.findUserAllRole(userId);
        mv.addObject("userRoles",userRoles);
        mv.addObject("user",userId);
        mv.setViewName("user-role-delete");
        return mv;
    }
    @RequestMapping("/delRoleToUser.do")
    public String delRoleToUser(@RequestParam(name = "userId",required = true) String userId,@RequestParam(name = "ids",required = true)String[] roles) throws Exception {
        userService.delRoleToUser(userId,roles);
        return "redirect:findAll.do";
    }
    @RequestMapping("/findByUserId.do")
    public ModelAndView findByUserId(String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        Register regist=userService.findByUserId(id);
        mv.addObject("regist",regist);
        mv.setViewName("person-inf");
        return mv;
    }
    @RequestMapping("/deleteUser.do")
    public String deleteUser(String[] ids){
        userService.deleteUser(ids);
        return "redirect:findAll.do";
    }
    @RequestMapping("/repass.do")
    public String repass(RePass rePass){
        //校验密码
        boolean isok = PasswordEncoderUtils.isok(rePass.getOldpass(), rePass.getRealpass());
        if (!isok){
            request.getSession().setAttribute("error","密码错误");
            return "repass";
        }
        userService.updatepass(rePass.getId(),PasswordEncoderUtils.passwordEncoder(rePass.getNewpass()));
        return "redirect:../logout.do";
    }
    @RequestMapping("/updateuser.do")
    public String updateuser(UserInfo userInfo) throws Exception {
        String username = userService.findById(userInfo.getId()).getUsername();
        userService.updateuser(userInfo);
//      迫使用户下线
        List<Object> allPrincipals = sessionRegistry.getAllPrincipals();
        for (int i = 0; i < allPrincipals.size(); i++) {
            User user=(User) allPrincipals.get(i);
            if (user.getUsername().equals(username)){
                List<SessionInformation> allSessions = sessionRegistry.getAllSessions(user, false);
                if (allSessions != null) {
                    for (int j = 0; j < allSessions.size(); j++) {
                        SessionInformation sessionInformation = allSessions.get(j);
                        sessionInformation.expireNow();
                    }
                }
            }
        }
        return "redirect:findAll.do";
    }

}
