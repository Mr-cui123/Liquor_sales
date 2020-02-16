package school.czm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.czm.entity.Orderitem;
import school.czm.mapper.OrderitemMapper;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/17 12:44
 */
@Service
public class OrderItemService {
    @Autowired
    private OrderitemMapper orderitemMapper;

    public List<Orderitem> getOrderItem(String id){
        List<Orderitem> orderitemList = orderitemMapper.getOrderItem(id);
        return orderitemList;
    }

    public void addOrderItem(Orderitem orderitem) {
        int i = orderitemMapper.insert(orderitem);
    }
}
