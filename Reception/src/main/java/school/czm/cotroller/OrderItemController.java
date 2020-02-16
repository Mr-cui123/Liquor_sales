package school.czm.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.Good;
import school.czm.entity.Order;
import school.czm.entity.Orderitem;
import school.czm.service.GoodService;
import school.czm.service.OrderItemService;
import school.czm.util.Car;
import school.czm.util.CarItem;

import javax.servlet.http.HttpSession;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @author 贸哥专属
 * @create 2019/12/17 12:55
 */
@Controller
public class OrderItemController {
    @Autowired
    private OrderItemService orderItemService;
    @Autowired
    private GoodService goodService;

    @RequestMapping("/getOrderItem")
    public String getOrderItem(@RequestParam("orderid") String id, Model model) {
        List<Orderitem> list = orderItemService.getOrderItem(id);
        model.addAttribute("orderItem", list);
        return "order/orderDetail";
    }

    @RequestMapping("/addOrderitem")
    public String addOrderitem(HttpSession session, Model model) {
        Car car = (Car) session.getAttribute("car");
        Map<Integer, CarItem> carMap = car.getMap();
        Collection<CarItem> carItems = carMap.values();
        Order order = (Order) session.getAttribute("order");
        for (CarItem item : carItems) {
            Orderitem orderitem = new Orderitem();
            orderitem.setGood(item.getGoods());
            orderitem.setGoodsNum(item.getNum());
            orderitem.setOrder(order);
            orderItemService.addOrderItem(orderitem);
            Good good = goodService.selectByGoodName(item.getGoods().getGoodsName());
            good.setStockNum(good.getStockNum()-item.getNum());
            goodService.updateStockNum(good);
        }
        car.clearCart();
        model.addAttribute("order",order);
        session.removeAttribute("order");
        return "order/orderSubmit";
    }
}
