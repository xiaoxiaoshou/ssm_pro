package cn.sfturing.service.backend;

import cn.sfturing.entity.Doctor;
import cn.sfturing.entity.Office;
import cn.sfturing.utils.ResponseResult;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:05
 */
public interface BackendDoctorService {
    List<Doctor> findAllDoctor(int start, int size);

    ResponseResult addDoctor(MultipartFile file, Doctor doctor);

    Doctor skipModifyDoctor(Integer id);

    ResponseResult modifyDoctor(Doctor doctor);

    List<Doctor> findAllDoctor1();
}
