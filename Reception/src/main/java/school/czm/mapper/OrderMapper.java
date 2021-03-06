package school.czm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import school.czm.entity.Order;
@Repository
public interface OrderMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_order
     *
     * @mbggenerated Sun Dec 15 16:29:57 CST 2019
     */
    int deleteByPrimaryKey(String orderId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_order
     *
     * @mbggenerated Sun Dec 15 16:29:57 CST 2019
     */
    int insert(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_order
     *
     * @mbggenerated Sun Dec 15 16:29:57 CST 2019
     */
    Order selectByPrimaryKey(String orderId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_order
     *
     * @mbggenerated Sun Dec 15 16:29:57 CST 2019
     */
    List<Order> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_order
     *
     * @mbggenerated Sun Dec 15 16:29:57 CST 2019
     */
    int updateByPrimaryKey(Order record);

    List<Order> queryOrderByUserId(Integer id);

    void updateOrderZT(@Param("id") String id);
}