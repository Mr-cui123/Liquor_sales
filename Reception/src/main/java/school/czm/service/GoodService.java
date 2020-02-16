package school.czm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import school.czm.entity.Good;
import school.czm.mapper.GoodMapper;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/15 16:37
 */
@Service
public class GoodService {
    @Autowired
    private GoodMapper goodMapper;

    public List<Good> selectAllGoods(String keyword) {
        List<Good> list = goodMapper.selectAll(keyword);
        return list;
    }

    public List<Good> selcetTopFiveGoods() {
        List<Good> list = goodMapper.selectTopFiveGoods();
        return list;
    }

    public List<Good> selcetFootFiveGoods() {
        List<Good> list = goodMapper.selectFootFiveGoods();
        return list;
    }

    public Good selectGoodById(Integer id){
        Good good = goodMapper.selectByPrimaryKey(id);
        return good;
    }

    public Good selectByGoodName(String goodsName) {
        Good good = goodMapper.selectByGoodName(goodsName);
        return good;
    }

    public void updateStockNum(Good good) {
    goodMapper.updateByPrimaryKey(good);
    }
}
