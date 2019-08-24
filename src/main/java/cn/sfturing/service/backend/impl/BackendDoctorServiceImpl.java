package cn.sfturing.service.backend.impl;

import cn.sfturing.dao.backend.BackendDoctorDao;
import cn.sfturing.dao.backend.BackendLoginDao;
import cn.sfturing.entity.Doctor;
import cn.sfturing.service.backend.BackendDoctorService;
import cn.sfturing.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:07
 */
@Service
public class BackendDoctorServiceImpl implements BackendDoctorService {

    @Autowired
    private BackendDoctorDao backendDoctorDao;

    @Autowired
    BackendLoginDao backendLoginDao;

    @Override
    public List<Doctor> findAllDoctor(int start, int size) {
        return backendDoctorDao.findAllDoctor(start,size);
    }

    @Override
    public ResponseResult addDoctor(MultipartFile file, Doctor doctor) {

       /* System.out.println("上传文件");

        String TARGET = "G:/project/ssm/hosp_order-master/hosp_order-master/ssm_pro/src/main/webapp/upload/";
        try {
            //jsp中上传的文件：file
            InputStream input = file.getInputStream();
            //上传文件的名字
            String fileName = file.getOriginalFilename();

            OutputStream out = new FileOutputStream(TARGET+fileName);
            //将file上传到服务器的某一个硬盘文件夹
            byte[] bs = new byte[1024];
            int len=-1;
            while((len = input.read(bs))!=-1){
                out.write(bs,0,len);
            }
            out.close();
            input.close();
        }catch (Exception e){
           // e.printStackTrace();
        }*/

        System.out.println("上传文件成功");
        int status =  backendDoctorDao.addDoctor(doctor);
        int status1 = backendLoginDao.addAdminisator(doctor.getDoctorName());

        if (status==1&&status1==1){
           return ResponseResult.success();
        }else{
            return ResponseResult.fail();
        }

    }

    /**
     * 获取回显数据
     * @param id
     * @return
     */
    @Override
    public Doctor skipModifyDoctor(Integer id) {
        return backendDoctorDao.findDoctorById(id);
    }

    @Override
    public ResponseResult modifyDoctor(Doctor doctor) {

        int status = backendDoctorDao.modifyDoctor(doctor);
        if(status>0){
            return ResponseResult.success();
        }else{
            return  ResponseResult.fail();
        }
    }

    @Override
    public List<Doctor> findAllDoctor1() {

      List<Doctor> doctors =  backendDoctorDao.findAllDoctor1();

      if(doctors!=null){
          return  doctors;
      }

        return null;
    }
}
