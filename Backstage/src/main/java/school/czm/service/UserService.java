package school.czm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.czm.entity.User;
import school.czm.mapper.UserMapper;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/18 23:51
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public List<User> getUsers(){
        List<User> users = userMapper.selectAll();
        return users;
    }

    public void deleteUser(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }
}
