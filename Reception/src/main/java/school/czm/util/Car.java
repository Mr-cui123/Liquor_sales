package school.czm.util;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 贸哥专属
 * @create 2019/8/6 19:12
 * 购物车---多项商品
 */
public class Car {
    private Map<Integer, CarItem> map = new HashMap<>();

    public Map<Integer, CarItem> getMap() {
        return map;
    }

    public void addToCar(CarItem carItem) {
        Integer id = carItem.getGoods().getGoodsId();
        CarItem carItem1 = map.get(id);
        if (carItem1 == null) {
            map.put(id, carItem);
        } else {
            carItem1.setNum(carItem.getNum() + carItem1.getNum());
        }
    }
    //删除购物项
    public void removeItem(Integer id) {
        map.remove(id);
    }

    // 清空购物车
    public void clearCart() {
        map.clear();
    }

    //返回购物车的总金额
    public int getTotalPrice() {
        int totalPrice = 0;
        //获取Map中所有的CartItem
        Collection<CarItem> cartitems = map.values();
        for (CarItem item : cartitems) {
            totalPrice += item.getMoney();
        }
        return totalPrice;
    }
}
