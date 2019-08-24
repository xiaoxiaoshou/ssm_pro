/*
package cn.sfturing.utils;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

*/
/**
 * @author eRunn
 * @create 2019-03-13 22:41
 *//*

@Component
public class UoloadFile {

    private  final  String TARGET = "G:/project/ssm/hosp_order-master/hosp_order-master/ssm_pro/src/main/webapp/upload/";

    public  void uploadfile(MultipartFile file){
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
            e.printStackTrace();
        }
    }

}
*/
