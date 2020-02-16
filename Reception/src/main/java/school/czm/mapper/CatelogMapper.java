package school.czm.mapper;

import java.util.List;


import org.springframework.stereotype.Repository;
import school.czm.entity.Catelog;

@Repository
public interface CatelogMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_catelog
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    int deleteByPrimaryKey(Integer catelogId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_catelog
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    int insert(Catelog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_catelog
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    Catelog selectByPrimaryKey(Integer catelogId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_catelog
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    List<Catelog> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_catelog
     *
     * @mbggenerated Sun Dec 15 16:29:07 CST 2019
     */
    int updateByPrimaryKey(Catelog record);
}