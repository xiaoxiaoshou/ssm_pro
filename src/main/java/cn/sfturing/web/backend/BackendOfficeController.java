package cn.sfturing.web.backend;

import cn.sfturing.entity.Doctor;
import cn.sfturing.entity.Hospital;
import cn.sfturing.entity.Office;
import cn.sfturing.service.backend.BackendHospitalService;
import cn.sfturing.service.backend.BackendOfficeService;
import cn.sfturing.utils.PageUtils;
import cn.sfturing.utils.ResponseResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * @author eRunn
 * @create 2019-03-11 21:04
 */
@Controller
public class BackendOfficeController {

    @Autowired
    private BackendOfficeService backendOfficeService;

   @Autowired
   private BackendHospitalService backendHospitalService;


    /**
     * 查看全部科室并跳转到科室列表页面
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipOfficeList")
    public String skipOfficeList(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum, Map model){

        PageHelper.startPage(pageNum,10);
        List<Office> offices = backendOfficeService.findAllOffice();
        PageInfo<Office> pageInfo = new PageInfo<>(offices,5);
        model.put("pageInfo",pageInfo);
        return "/backend/office/officeList";
    }

    /**
     * 跳转到添加科室
     * @return
     */
    @RequestMapping("/backend/skipaddOffice")
    public String skipaddOffice(Model model){

        List<Hospital> hospitals = backendHospitalService.findAllHospital();
        model.addAttribute("hospitals",hospitals);
        return "backend/office/addOffice";
    }

    /**
     * 添加科室
     * @param office
     * @return
     */
    @RequestMapping("/backend/addOffice")
    @ResponseBody
    public ResponseResult addOffice(Office office){

        System.out.println(office+"******addoffice");

       ResponseResult responseResult =  backendOfficeService.addOffice(office);

        return responseResult;
    }

    /**
     * 跳转到修改科室信息页面,并进行数据回显
     * @param id
     * @return
     */
    @RequestMapping("/backend/skipModifyOffice")
    public String skipModifyOffice(Integer id,Model model){

        System.out.println(id+"******修改");
        Office office = backendOfficeService.officeInfoReturn(id);
        model.addAttribute("offce",office);

        return "backend/office/modifyOffice";
    }


    /**
     * 修改科室信息科室
     * @param office
     * @return
     */
    @RequestMapping("/backend/modidyOffice")
    @ResponseBody
    public ResponseResult modidyOffice(Office office){

        System.out.println(office+"******modidyOffice");

        System.out.println(office.getId());

        ResponseResult responseResult =  backendOfficeService.modifyOffice(office);

        return responseResult;
    }

    /**
     * 删除科室
     * @param id
     * @return
     */
    @RequestMapping("/backend/deleteOffice")
    @ResponseBody
    public ResponseResult deleteOffice(Integer id){

        ResponseResult responseResult = backendOfficeService.deleteOfficeById(id);
        System.out.println(id+"******删除");

        return responseResult.success("删除成功");
    }

     @RequestMapping("/backend/findHospitalByOffice")
    @ResponseBody
    public ResponseResult findHospitalByOffice(String officeName){

         System.out.println(officeName);

        ResponseResult responseResult = backendOfficeService.findHospitalByOffice(officeName);

         System.out.println(responseResult.getData());

        return responseResult;
    }
}
