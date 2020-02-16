package school.czm.cotroller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.User;
import school.czm.service.UserService;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/18 18:17
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/user")
    public String userList(@RequestParam(value = "pageNum",required = false,defaultValue = "1")Integer num,
                           Model model){
        PageHelper.startPage(num,3);
        List<User> users = userService.getUsers();
        PageInfo<User> pageInfo=new PageInfo<>(users,3);
        model.addAttribute("pageInfo",pageInfo);
        return "user/list";
    }

    @RequestMapping("deleteUser")
    public String deleteUser(@RequestParam("id")Integer id){
        userService.deleteUser(id);
        return "redirect:/user";
    }
}
