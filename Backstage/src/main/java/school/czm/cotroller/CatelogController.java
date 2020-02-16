package school.czm.cotroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import school.czm.entity.Catelog;
import school.czm.service.CatelogService;

import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/19 10:59
 */
@Controller
public class CatelogController {
    @Autowired
    private CatelogService catelogService;

    @RequestMapping("/catelog")
    public String getAllCate(Model model) {
        List<Catelog> list = catelogService.getAllCatelog();
        model.addAttribute("cate", list);
        return "catelog/list";
    }

    @RequestMapping("/addCatelog")
    public String addcate(Catelog catelog){
        catelogService.addCatelog(catelog);
        return "redirect:/catelog";
    }
    @RequestMapping("/deleteCate")
    public String deleteCate(@RequestParam("id")Integer id){
        catelogService.deleteCate(id);
        return "redirect:/catelog";
    }
}
