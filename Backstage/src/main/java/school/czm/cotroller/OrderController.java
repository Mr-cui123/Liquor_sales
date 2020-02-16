package school.czm.cotroller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.Order;
import school.czm.entity.OrderItem;
import school.czm.service.OrderService;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/19 16:21
 */
@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/Orders")
    public String getAllOrder(@RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum, Model model) {
        PageHelper.startPage(pageNum, 5);
        List<Order> list = orderService.getAllOrder();
        PageInfo<Order> pageInfo=new PageInfo<>(list,3);
        model.addAttribute("pb",pageInfo);
        return "order/list";
    }

    @RequestMapping("/updateOrder")
    public String updateOrder(@RequestParam("id")String id,@RequestParam("zt")Integer zt){
        orderService.updateOrder(id,zt);
        return "redirect:/Orders";
    }

    @RequestMapping("/orderItem")
    public String orderItem(@RequestParam("id")String id,Model model){
        List<OrderItem> list = orderService.getOrderItem(id);
        model.addAttribute("orderitem",list);
        return "order/detail";
    }

    @RequestMapping("/deleteOrder")
    public String deleteOrder(@RequestParam("id")String id){
        orderService.deleteOrder(id);
        return "redirect:/Orders";
    }
}
