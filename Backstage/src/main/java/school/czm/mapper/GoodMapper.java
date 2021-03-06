package school.czm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import school.czm.entity.Good;
@Repository
public interface GoodMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_goods
     *
     * @mbggenerated Thu Dec 19 12:00:28 CST 2019
     */
    int deleteByPrimaryKey(Integer goodsId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_goods
     *
     * @mbggenerated Thu Dec 19 12:00:28 CST 2019
     */
    int insert(Good record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_goods
     *
     * @mbggenerated Thu Dec 19 12:00:28 CST 2019
     */
    Good selectByPrimaryKey(Integer goodsId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_goods
     *
     * @mbggenerated Thu Dec 19 12:00:28 CST 2019
     */
    List<Good> selectAll(@Param("keyword") String keyword);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_goods
     *
     * @mbggenerated Thu Dec 19 12:00:28 CST 2019
     */
    int updateByPrimaryKey(Good record);
}