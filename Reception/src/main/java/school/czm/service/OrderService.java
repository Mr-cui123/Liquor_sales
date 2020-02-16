package school.czm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.czm.entity.Account;
import school.czm.entity.Order;
import school.czm.entity.User;
import school.czm.mapper.AccountMapper;
import school.czm.mapper.OrderMapper;

import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/17 12:30
 */
@Service
public class OrderService {
    @Autowired
    private OrderMapper orderMapper;

    @Autowired
    private AccountMapper accountMapper;

    //根据用户Id获取订单
    public List<Order> getOrderes(Integer id) {
        List<Order> orders = orderMapper.queryOrderByUserId(id);
        return orders;
    }

    //添加订单
    public int addOrder(Order order) {
        int i = orderMapper.insert(order);
        return i;
    }

    public void updateOrder(String id) {
        orderMapper.updateOrderZT(id);
    }

    public Account selectByNumAndPwd(Account account){
        Account account1 = accountMapper.selectByNumAndPwd(account);
        return account1;
    }

    public void updateMoney(Account account) {
        accountMapper.updateByPrimaryKey(account);
    }
}
