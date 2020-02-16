package school.czm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import school.czm.entity.User;
import school.czm.mapper.UserMapper;

/**
 * @author 贸哥专属
 * @create 2019/12/15 19:07
 */
@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public void updateUser(User user){
        userMapper.updateByPrimaryKey(user);
    }

    public void addUser(User user){
        userMapper.insert(user);
    }

    public User queryUserByNameAndPwd(User user){
        User user1 = userMapper.queryUserByNameAndPwd(user);
        return user1;
    }

    public void deleteUserById(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }
}
