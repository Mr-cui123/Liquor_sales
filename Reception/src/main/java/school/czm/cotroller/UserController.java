package school.czm.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.User;
import school.czm.service.UserService;

import javax.servlet.http.HttpSession;

/**
 * @author 贸哥专属
 * @create 2019/12/15 19:17
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/updateUser")
    public String updateUser(Model model,User user,HttpSession session,
                             @RequestParam(value = "oldPwd",required = false)String pwd){
        User user1 = (User) session.getAttribute("user");

        if (pwd.equals(user1.getUserPwd())){
            userService.updateUser(user);
            session.setAttribute("user",user);
            model.addAttribute("lose",100);
            return "redirect:/fiveGoods";
        }else {
            model.addAttribute("lose",100);
            return "userinfo/userXinxi";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/fiveGoods";
    }

    @RequestMapping("/userLogin")
    public String userLogin(User user, HttpSession session) {
        User user1 = userService.queryUserByNameAndPwd(user);

        if (user1 == null) {
            Integer str=1;
            return "redirect:/fiveGoods?str="+str;
        } else {
            session.setAttribute("user", user1);
        }
        return "redirect:/fiveGoods";
    }

    @RequestMapping("/addUser")
    public String addUser(User user) {
        userService.addUser(user);
        return "redirect:/fiveGoods";
    }

    @RequestMapping("deleteUser")
    public String deleteUser(@RequestParam("id")Integer id,HttpSession session){
        userService.deleteUserById(id);
        session.invalidate();
        return "redirect:/fiveGoods";
    }
}
