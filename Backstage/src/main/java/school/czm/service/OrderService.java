package school.czm.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.Order;
import school.czm.entity.OrderItem;
import school.czm.mapper.OrderItemMapper;
import school.czm.mapper.OrderMapper;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/19 16:14
 */
@Service
public class OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private OrderItemMapper orderItemMapper;

    public List<Order> getAllOrder(){
        List<Order> list = orderMapper.selectAll();
        return list;
    }

    public void updateOrder(String id,Integer zt) {
        orderMapper.updateByPrimaryKey(id,zt);
    }

    public List<OrderItem> getOrderItem(String id){
        List<OrderItem> list = orderItemMapper.getOrderItem(id);
        return list;
    }

    public void deleteOrder(String id) {
        orderMapper.deleteByPrimaryKey(id);
    }
}
