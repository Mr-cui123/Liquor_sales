package school.czm.cotroller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.Good;
import school.czm.service.GoodService;
import school.czm.util.Car;
import school.czm.util.CarItem;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/15 16:36
 */
@Controller
public class GoodController {
    @Autowired
    private GoodService goodService;

    //按照关键字查找商品，无关键字则展示全部商品列表
    @RequestMapping("/goodsByKeyword")
    public String goodsByKeyword(Model model, @RequestParam(value = "goodsName", required = false, defaultValue = "") String goodName,
                                 @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                 @RequestParam(value = "price", required = false, defaultValue = "1") Integer price
    ) {
        PageHelper.startPage(pageNum, 5);
        List<Good> list = goodService.selectAllGoods(goodName);
        PageInfo<Good> pageInfo = new PageInfo<>(list, 5);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("keyword", goodName);
        model.addAttribute("grow", price);
        return "goods/list";
    }


    //登录首页，展示五个热门商品
    @RequestMapping("/fiveGoods")
    public String fiveGoods(Model model,
                            @RequestParam(value = "str", required = false, defaultValue = "0") Integer str) {
        List<Good> list = goodService.selcetTopFiveGoods();
        List<Good> list1 = goodService.selcetFootFiveGoods();
        model.addAttribute("good1", list1);
        model.addAttribute("good", list);
        model.addAttribute("error", str);
        return "index";
    }

    //展示商品详情
    @RequestMapping("/goodDetail")
    public String getGoodDetail(Model model, @RequestParam("id") Integer id,
                                @RequestParam(value = "pageNum",required = false,defaultValue = "0") Integer pageNum,
                                @RequestParam(value = "display",required = false,defaultValue = "0") Integer display) {
        Good good = goodService.selectGoodById(id);
        model.addAttribute("good", good);
        model.addAttribute("pageNum",pageNum);
        model.addAttribute("display",display);
        return "goods/goodsDetail";
    }

    //添加商品到购物车
    @RequestMapping("/addToCar")
    public String addToCar(@RequestParam(value = "quantity", required = false, defaultValue = "1") Integer num,
                           @RequestParam("goodsId") Integer id,
                           @RequestParam("goodsName") String name,
                           @RequestParam("goodsPrice") Integer price,
                           @RequestParam(value = "pageNum", required = false) Integer page,
                           HttpSession session, HttpServletResponse response, Model model
    ) {
        Good good = new Good();
        good.setGoodsId(id);
        good.setGoodsName(name);
        good.setMallPrice(price);
        CarItem carItem = new CarItem();
        carItem.setGoods(good);
        carItem.setNum(num);
        Car car = (Car) session.getAttribute("car");
        if (car == null) {
            Car car1 = new Car();
            session.setAttribute("car", car1);
            Cookie cookie = new Cookie("JSESSIONID", session.getId());
            cookie.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(cookie);
            car1.addToCar(carItem);
        } else {
            car.addToCar(carItem);
        }
        session.setAttribute("name", name);
        price = 0;
        if (page == null) {
            Integer display=1;
            return "redirect:/goodDetail?id="+id+"&display="+display;
        } else {
            return "redirect:/goodsByKeyword?pageNum=" + page + "&price=" + price;
        }
    }

    //删除购物项
    @RequestMapping("/deleteItem")
    public String deleteItem(@RequestParam("goodsid") Integer id, HttpSession session) {
        Car car = (Car) session.getAttribute("car");
        car.removeItem(id);
        return "myCart/myCart";
    }

    //清空购物车
    @RequestMapping("/clearCar")
    public String clearCar(HttpSession session) {
        Car car = (Car) session.getAttribute("car");
        car.clearCart();
        return "myCart/myCart";
    }
}
