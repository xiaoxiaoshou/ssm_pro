package cn.sfturing.web.backend;

import cn.sfturing.entity.Admininstrator;
import cn.sfturing.service.backend.BackendLoginService;
import cn.sfturing.utils.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author eRunn
 * @create 2019-03-13 1:13
 */
@Controller
public class BackendLoginController {

    @Autowired
    private BackendLoginService backendLoginService;


    /**
     * 跳转到登录页面
     * @return
     */
    @RequestMapping("/backend/skipToLogin")
    public String skipToLogin(){

        return "/backend/login/login";
    }

    /**
     * 登录
     * @param admininstrator
     * @return
     */
    @RequestMapping("/backend/login")
    @ResponseBody
    public ResponseResult login(Admininstrator admininstrator){

        ResponseResult responseResult =  backendLoginService.login(admininstrator);

        return responseResult;
    }

    /**
     * 登录验证成功后跳转到主页面
     * @param
     * @return
     */
    @RequestMapping("/backend/loginToHome")
    public String loginToHome(Integer id, HttpSession session){

        System.out.println("id:"+id);
        ResponseResult responseResult =  backendLoginService.selectAdminById(id);


        session.setAttribute("loginsession",responseResult.getData());

        Admininstrator admininstrator = (Admininstrator) responseResult.getData();

        //判断用户类型跳转到对应的用户页面
        if(admininstrator.getRole()==0){
            System.out.println("超管");
            //如果是超管
            return "/backend/main/index";
        }else{
            System.out.println("医生");
            //如果是医生
            return "/backend/main/doctorManager";
        }

        //return "/backend/main/index";
    }

    /**
     * 注销
     * @param request
     * @return
     */
    @RequestMapping("/backend/cancellation")
    public String cancellation(HttpServletRequest request){

       //销毁session
        HttpSession session = request.getSession();
        session.invalidate();
        return "/backend/login/login";
    }

    @RequestMapping("/backend/skipToHome")
    public String skipToHome(){

        return "/backend/main/home";
    }
}
