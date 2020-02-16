package school.czm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.czm.entity.Catelog;
import school.czm.mapper.CatelogMapper;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/19 8:42
 */
@Service
public class CatelogService {
    @Autowired
    private CatelogMapper catelogMapper;

    public List<Catelog> getAllCatelog(){
        List<Catelog> list = catelogMapper.selectAll();
        return list;
    }

    public void addCatelog(Catelog catelog){
        catelogMapper.insert(catelog);
    }

    public void deleteCate(Integer id) {
        catelogMapper.deleteByPrimaryKey(id);
    }
}
