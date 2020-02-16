package school.czm.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.Account;
import school.czm.entity.Order;
import school.czm.entity.User;
import school.czm.service.OrderService;
import school.czm.util.Car;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author 贸哥专属
 * @create 2019/12/17 12:38
 */
@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/queryOrderByUserId")
    public String queryOrderByUserId(@RequestParam("id") Integer id, Model model) {
        List<Order> orderes = orderService.getOrderes(id);
        model.addAttribute("orders", orderes);
        return "order/myOrder";
    }

    @RequestMapping("/addOrder")
    public String addOrder(@RequestParam(value = "bankNum", required = false, defaultValue = "") String bankNum, @RequestParam(value = "bankPwd", required = false, defaultValue = "") String bankPwd,
                           Order order, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        order.setOrderId(UUID.randomUUID().toString());
        order.setOrderTime(new Date());
        order.setUser(user);
        if (bankNum.equals("") && bankPwd.equals("")) {
            int i = orderService.addOrder(order);
            session.setAttribute("order", order);
            return "redirect:/addOrderitem";
        } else {
            Account account = new Account();
            account.setUser(user);
            account.setBanknum(bankNum);
            account.setBankpwd(bankPwd);
            Account account1 = orderService.selectByNumAndPwd(account);
            Integer num = 1;
            if (account1 != null) {
                if (account1.getMoney() < order.getOrderJine()) {
                    model.addAttribute("error", num);
                    num = 2;
                    model.addAttribute("zhuangtai", num);
                    return "order/orderQueren";
                } else {
                    int i = orderService.addOrder(order);
                    account1.setMoney(account1.getMoney() - order.getOrderJine());
                    orderService.updateMoney(account1);
                    if (i > 0) {
                        session.setAttribute("order", order);
                        return "redirect:/addOrderitem";
                    } else {
                        return "order/orderQueren";
                    }
                }
            } else {
                model.addAttribute("error", num);
                model.addAttribute("zhuangtai", num);
                return "order/orderQueren";
            }
        }
    }

    @RequestMapping("/updateOrder")
    public String updateOrder(@RequestParam("id") String id, @RequestParam("user") String userid) {
        orderService.updateOrder(id);
        return "redirect:/queryOrderByUserId?id=" + userid;
    }
}
