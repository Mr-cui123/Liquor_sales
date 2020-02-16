package school.czm.util;

import school.czm.entity.Good;

/**
 * @author 贸哥专属
 * @create 2019/8/6 19:09
 * 购物项类---单项商品
 */
public class CarItem {
    private Good goods;
    private Integer num;
    private Integer money;//单项总金额

    public Good getGoods() {
        return goods;
    }

    public void setGoods(Good goods) {
        this.goods = goods;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getMoney() {
        money=goods.getMallPrice()*num;
        return money;
    }

}
