package school.czm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import school.czm.entity.Admin;
import school.czm.mapper.AdminMapper;

/**
 * @author 贸哥专属
 * @create 2019/12/18 14:34
 */
@Service
public class AdminService {
    @Autowired
    private AdminMapper adminMapper;

    public Admin selectAdmin(Admin admin){
        Admin admin1 = adminMapper.selectByNameAndPwd(admin);
        return admin1;
    }

    public void updatePassword(Admin admin) {
        adminMapper.updateByPrimaryKey(admin);
    }
}
