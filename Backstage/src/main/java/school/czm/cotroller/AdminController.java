package school.czm.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.Admin;
import school.czm.service.AdminService;
import school.czm.util.AuthCodeUtil;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * @author 贸哥专属
 * @create 2019/12/18 14:32
 */
@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/authCode")
    public void authCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = AuthCodeUtil.getCode();
        HttpSession session = request.getSession();
        session.setAttribute("code", code);
        BufferedImage img = AuthCodeUtil.getAuthCodeImg(code);
        ImageIO.write(img, "JPEG", response.getOutputStream());
    }

    @RequestMapping("/login")
    public String login(Admin admin, @RequestParam(value = "code", required = false) String code, HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String checkcode = (String) session.getAttribute("code");
        if (code.equalsIgnoreCase(checkcode)) {
            Admin admin1 = adminService.selectAdmin(admin);
            if (admin1 != null) {
                session.setAttribute("admin", admin1);
                return "main/index";
            } else {
                request.setAttribute("errorMsg", "用户名或密码错误");
                return "main/login";
            }
        } else {
            request.setAttribute("errorMsg", "验证码错误");
            return "main/login";
        }
        }

        @RequestMapping("/updatePassword")
        public String updatePassword (Admin admin, HttpServletRequest request,
                @RequestParam("newpass") String newpwd){
            HttpSession session = request.getSession();
            Admin admin1 = (Admin) session.getAttribute("admin");
            if (admin.getUserpwd().equals(admin1.getUserpwd())) {
                admin.setUserid(admin1.getUserid());
                admin.setUserpwd(newpwd);
                adminService.updatePassword(admin);
                session.invalidate();
                return "redirect:/index.jsp";
            } else {
                request.setAttribute("errorMsg", "原密码错误,修改失败！");
                return "user/pass";
            }
        }
    }
