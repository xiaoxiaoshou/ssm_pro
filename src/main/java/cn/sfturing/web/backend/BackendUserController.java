package cn.sfturing.web.backend;

import cn.sfturing.entity.CommonUser;
import cn.sfturing.service.backend.BackendUserService;
import cn.sfturing.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author eRunn
 * @create 2019-03-11 21:02
 */

@Controller
public class BackendUserController {

    @Autowired
    private BackendUserService backendUserService;

    @Autowired
    private PageUtils pageUtils;

    @RequestMapping("/backend/skipUserList")
    public String skipUserList(Model model){

        int page = 1;
        int start = 1;
        int size = 10;
        System.out.println("跳转到用户列表");

        List<CommonUser> Users = backendUserService.findAllUser(start,size);
        for (CommonUser commonUser : Users){
            System.out.println(commonUser.getUserName());
        }
        model.addAttribute("pages",pageUtils);
        model.addAttribute("users",Users);
        return "/backend/user/userList";
    }


}
