package cn.sfturing.web.backend;

import cn.sfturing.entity.Doctor;
import cn.sfturing.entity.Hospital;
import cn.sfturing.entity.Office;
import cn.sfturing.service.backend.BackendDoctorService;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;
import java.util.Map;

/**
 * @author eRunn
 * @create 2019-03-11 21:05
 */
@Controller
public class BackendDoctorController {

    @Autowired
    private BackendDoctorService backendDoctorService;

    @Autowired
    private BackendHospitalService backendHospitalService;

    @Autowired
    private BackendOfficeService backendOfficeService;


    /**
     * 跳转到医生列表
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipDoctorList")
    public String skipUserList(Map model){
        PageHelper.startPage(1,10);
        List<Doctor> doctorList = backendDoctorService.findAllDoctor1();
        PageInfo<Doctor> pageInfo = new PageInfo<>(doctorList,5);
        model.put("pageInfo",pageInfo);
        return "/backend/doctor/doctorList";
    }

    /**
     * 翻页
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipToNewPage")
    public String skipToNewPage(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum,Map model){

        PageHelper.startPage(pageNum,10);
        List<Doctor> doctorList = backendDoctorService.findAllDoctor1();
        PageInfo<Doctor> pageInfo = new PageInfo<>(doctorList,5);
        model.put("pageInfo",pageInfo);
        return "/backend/doctor/doctorList";
    }

    /**
     * 跳转到添加医生页面
     * @return
     */
    @RequestMapping("/backend/skipaddDoctor")
    public String skipaddDoctor(Model model){

        List<Hospital> hospitals = backendHospitalService.findAllHospital();
        List<Office> offices = backendOfficeService.findAllOffice();

        model.addAttribute("hospitals",hospitals);
        model.addAttribute("offices",offices);

        System.out.println("跳转到添加医生页面");
        return "/backend/doctor/addDoctor";
    }

    /**
     * 添加医生
     * 医生照片默认为src\main\webapp\assets\img\doc_nopicture.jpg
     * @param doctor
     * @return
     */
   /* @RequestMapping(*//*value = "/backend/addDoctor",headers = "content-type=multipart/*",method = RequestMethod.POST*//*)*/
    @RequestMapping("/backend/addDoctor")
    @ResponseBody
    public ResponseResult addDoctor(/*@RequestParam("file") MultipartFile file,*/ Doctor doctor) {
        /*String TARGET = "G:/project/ssm/hosp_order-master/hosp_order-master/ssm_pro/src/main/webapp/upload/";
        String DoctorImg="";
        try {
            //上传文件的名字
            DoctorImg =(String) file.getOriginalFilename();
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println("文件空");
        }


        doctor.setDoctorImg(TARGET+DoctorImg);

        if (file.isEmpty()) {
            return ResponseResult.fail("上传文件失败,请检查上传的文件");
        }else{
            ResponseResult responseResult = backendDoctorService.addDoctor(file,doctor);
        }*/

        ResponseResult responseResult = backendDoctorService.addDoctor(null,doctor);

        return responseResult;
    }

    /**
     * 跳转到修改科室信息页面,并进行数据回显
     * @param id
     * @return
     */
    @RequestMapping(value = "/backend/skipModifyDoctor",method = RequestMethod.GET)
    public String skipModifyDoctor(@RequestParam("id")Integer id,Model model){

        System.out.println(id+"******skipModifyOffice修改");
        Doctor doctor = backendDoctorService.skipModifyDoctor(id);
        model.addAttribute("doctor",doctor);

        return "/backend/doctor/modifyDoctor";
    }


    /**
     *
      * @param
     * @return
     */
    @RequestMapping("/backend/modifyDoctor")
    @ResponseBody
    public ResponseResult modifyDoctor(Doctor doctor){

        System.out.println(doctor.getId());

        ResponseResult responseResult =  backendDoctorService.modifyDoctor(doctor);

        return responseResult;
    }
}
