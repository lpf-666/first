package cn.ssm.controller;

import cn.ssm.entity.User;
import cn.ssm.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;

    //查找所有测试
    @RequestMapping("/findAll")
    @ResponseBody
    public void findAll(HttpServletResponse response) throws Exception {
        List<User> userList = userService.findAll();
        ObjectMapper mapper = new ObjectMapper();
        String str = mapper.writeValueAsString(userList);
        response.getWriter().write(str);
    }

    //查找所有列表
    @RequestMapping("/selectAllUser")
    public ModelAndView selectAllUser() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> userList = userService.selectAllUser();
        mv.addObject("userList", userList);
        mv.setViewName("userlist");
        return mv;
    }

    //返回页面的查询
    @RequestMapping("/query")
    public ModelAndView query(int id) {
        //int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.query(id);
        List<User> userList = new ArrayList<>();
        userList.add(user);
        System.out.println(userList);
        ModelAndView mv = new ModelAndView();
        mv.addObject("userList", userList);
        mv.setViewName("userlist");
        return mv;
    }


    //ajax查询
    @RequestMapping("/query1")
    @ResponseBody
    public void query1(HttpServletResponse response, int id) throws IOException {
        //int id = Integer.parseInt(req.getParameter("id"));
        User user = userService.query(id);
        System.out.println(user);
//        JSONObject jsonObject = new JSONObject();
//        jsonObject.put("user",user);
//        return jsonObject.toString();
        ObjectMapper mapper = new ObjectMapper();
        String str = mapper.writeValueAsString(user);
        response.getWriter().write(str);
    }

    //跳转添加页面
    @RequestMapping("/toAddPage")
    public String toAddPage() {
        return "addUser";
    }

    //添加用户
    @RequestMapping("/addUser")
    public String addUser(String username,String birthdayT,String sex,String address) throws ParseException {
        //user.setBirthdayT();

        User user=new User();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");//注意月份是MM
        String ss=simpleDateFormat.format(new Date());
        ss=ss.substring(ss.length() - 2);
        String a_birthdayT= birthdayT.replaceAll("T", " ") + ":"+ss+"";
        Date date = simpleDateFormat.parse(a_birthdayT);
        user.setBirthdayT(date);
        System.out.println(user);
        user.setUsername(username);
        user.setSex(sex);
        user.setAddress(address);
        userService.addUser(user);
        return "redirect:/index.jsp";
    }


    //跳转更新页面
    @RequestMapping("/toUpdatePage")
    public String toUpdatePage(Model model, int id) {
        User user = userService.query(id);
        System.out.println(user);
        model.addAttribute("user", user);
        return "updateUser";
    }


    //更新用户
    @RequestMapping("/updateUser")
    public String updateUser(User user) {
        userService.updateUser(user);
        return "redirect:/index.jsp";
    }


    //删除用户
    @RequestMapping("/deleteUser/{userId}")
    public String deleteUser(@PathVariable("userId") int id){
        userService.deleteUser(id);
        return "redirect:/index.jsp";
    }


    //测试
    @RequestMapping("/test")
    public String test(Model model, HttpServletRequest req) {
        String test = req.getParameter("test");
        System.out.println(test);
        model.addAttribute("atest", test);
        return "test";
    }
}
