package cn.sfturing.web.backend;

import cn.sfturing.entity.Doctor;
import cn.sfturing.entity.Hospital;
import cn.sfturing.entity.Office;
import cn.sfturing.service.backend.BackendHospitalService;
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
public class BackendHospitalController {

    @Autowired
    private BackendHospitalService backendHospitalService;



    /**
     * 医院列表
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipHospitalList")
    public String skipHospitalList(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum, Map model){

        PageHelper.startPage(pageNum,10);
        List<Hospital> hospitals = backendHospitalService.findAllHospital();
        PageInfo<Hospital> pageInfo = new PageInfo<>(hospitals,5);
        model.put("pageInfo",pageInfo);
        return "/backend/hospital/hospitalList";
    }


    /**
     * 跳转到添加医院页面
     * @return
     */
    @RequestMapping("/backend/skipaddHospital")
    public String skipaddHospital(){

        return "/backend/hospital/addHospital";
    }

    /**
     * 添加医院
     * @param hospital
     * @return
     */
    @RequestMapping("/backend/addHospital")
    @ResponseBody
    public ResponseResult addHospital(Hospital hospital){

        System.out.println(hospital.getHospitalName());

        ResponseResult responseResult = backendHospitalService.addHospital(hospital);

        return ResponseResult.success();
    }


    /**
     * 跳转到修改医院页面并进行数据回显
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipmodifyHospital")
    public String skipmodifyHospital(int  id,Model model){

        Hospital hospital1 = backendHospitalService.selectHospitalById(id);

        model.addAttribute("hospitals",hospital1);

        return "/backend/hospital/modifyHospital";
    }


    @RequestMapping("/backend/modifyHospital")
    @ResponseBody
    public ResponseResult modifyHospital(Hospital hospital){

        System.out.println(hospital.getHospitalName());
        ResponseResult responseResult = backendHospitalService.modifyHospital(hospital);

        return responseResult;
    }



    /**
     * 根据医院名字查找科室
     * @param hospitalName
     * @return
     */
    @RequestMapping("/backend/findOfficesByHospitalName")
    @ResponseBody
    public  ResponseResult findOfficesByHospitalName(String hospitalName){

        ResponseResult responseResult = backendHospitalService.findOfficesByHospitalName(hospitalName);

        return responseResult;
    }


}
