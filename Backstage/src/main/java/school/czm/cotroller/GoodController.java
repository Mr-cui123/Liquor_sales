package school.czm.cotroller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import school.czm.entity.Catelog;
import school.czm.entity.Good;
import school.czm.service.CatelogService;
import school.czm.service.GoodService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author 贸哥专属
 * @create 2019/12/19 12:08
 */
@Controller
public class GoodController {
    @Autowired
    private GoodService goodService;
    @Autowired
    private CatelogService catelogService;

    @RequestMapping("/goods")
    public String getAllGoods(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                              @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer num,
                              Model model) {
        PageHelper.startPage(num, 6);
        List<Good> goodList = goodService.getAllGoodByKeyword(keyword);
        PageInfo<Good> pageInfo = new PageInfo<>(goodList, 3);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("keyword", keyword);
        return "goods/list";
    }

    @RequestMapping("/toaddGood")
    public String toaddGood(Model model) {
        List<Catelog> list = catelogService.getAllCatelog();
        model.addAttribute("cate", list);
        return "goods/add";
    }

    @RequestMapping("/addGood")
    public String addGood(Good good, @RequestParam("file") MultipartFile file, HttpServletRequest request,
                          @RequestParam("date") String date) throws IOException, ParseException {
        String filename = file.getOriginalFilename();
        //file.transferTo(new File(request.getSession().getServletContext().getRealPath("upload")+"\\"+filename));
        file.transferTo(new File("D:\\ideaprojects\\Liquor_sales\\Backstage\\src\\main\\webapp\\upload" + "\\" + filename));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date time = sdf.parse(date);
        good.setEnterDate(time);
        good.setGoodsPic("upload/" + filename);
        goodService.addGood(good);
        return "redirect:/goods";
    }

    @RequestMapping("/toupdateGood")
    public String toupdateGood(Model model, @RequestParam("id") Integer id, @RequestParam("pageNum") Integer num) {
        Good good = goodService.queryGoodById(id);
        List<Catelog> list = catelogService.getAllCatelog();
        model.addAttribute("good", good);
        model.addAttribute("cateList", list);
        model.addAttribute("pageNum", num);
        return "goods/update";
    }

    @RequestMapping("/updateGood")
    public String updateGood(Good good, @RequestParam("pageNum") Integer Pagenum, @RequestParam(value = "num", required = false, defaultValue = "0") Integer num) {
        Good good1 = goodService.selectById(good.getGoodsId());
        good.setStockNum(good1.getStockNum()+num);
        goodService.updateGood(good);
        return "redirect:/goods?pageNum=" + Pagenum;
    }

    @RequestMapping("/deleteGood")
    public String deleteGood(@RequestParam("id") Integer id) {
        goodService.deleteGood(id);
        return "redirect:/goods";
    }
}
