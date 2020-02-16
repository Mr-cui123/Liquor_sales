package school.czm.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import school.czm.entity.User;
@Repository
public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Sun Dec 15 16:22:24 CST 2019
     */
    int deleteByPrimaryKey(Integer userId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Sun Dec 15 16:22:24 CST 2019
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Sun Dec 15 16:22:24 CST 2019
     */
    User selectByPrimaryKey(Integer userId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Sun Dec 15 16:22:24 CST 2019
     */
    List<User> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_user
     *
     * @mbggenerated Sun Dec 15 16:22:24 CST 2019
     */
    int updateByPrimaryKey(User record);

    User queryUserByNameAndPwd(User user);
}