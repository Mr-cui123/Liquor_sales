package school.czm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.czm.entity.Good;
import school.czm.mapper.GoodMapper;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/19 12:03
 */
@Service
public class GoodService {
    @Autowired
    private GoodMapper goodMapper;

    public List<Good> getAllGoodByKeyword(String keyword){
        List<Good> list = goodMapper.selectAll(keyword);
        return list;
    }

    public void addGood(Good good){
        goodMapper.insert(good);
    }

    public Good queryGoodById(Integer id) {
        Good good = goodMapper.selectByPrimaryKey(id);
        return good;
    }

    public void updateGood(Good good) {
        goodMapper.updateByPrimaryKey(good);
    }

    public void deleteGood(Integer id) {
        goodMapper.deleteByPrimaryKey(id);
    }

    public Good selectById(Integer goodsId) {
        Good good = goodMapper.selectByPrimaryKey(goodsId);
        return good;
    }
}
