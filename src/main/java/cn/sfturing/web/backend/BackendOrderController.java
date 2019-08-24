package cn.sfturing.web.backend;

import cn.sfturing.entity.Admininstrator;
import cn.sfturing.entity.OrderRecords;
import cn.sfturing.service.backend.BackendOrderService;
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


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author eRunn
 * @create 2019-03-10 11:31
 */
@Controller
public class BackendOrderController {

    @Autowired
    private BackendOrderService backendOrderService;



    @RequestMapping("/backend")
    public String skipIndex(){

        return "backend/main/index";
    }



    @RequestMapping("/backend/skiporderlist")
    public String skiporderlist(@RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum, Map model,HttpServletRequest request){

        HttpSession session = request.getSession();
        Admininstrator admininstrator = (Admininstrator)session.getAttribute("loginsession");
        PageHelper.startPage(pageNum,10);
        List<OrderRecords> orders = null;
        if(admininstrator.getRole()==1){
            orders = backendOrderService.findAllOrderByName(admininstrator.getUserName());
        }else{
            orders = backendOrderService.findAllOrder();
        }

        PageInfo<OrderRecords> pageInfo = new PageInfo<>(orders);

        model.put("pageInfo",pageInfo);

        return "/backend/order/orderlist";
    }

    @RequestMapping("/backend/skiprderlistToPage")
    public String skiprderlistToPage(Integer pageNum,Model model){


        return "backend/order/orderlist";
    }

    /**
     * 查询待就诊订单
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipWaitTreated")
    public String skipWaitTreated(Model model, HttpServletRequest request){

        HttpSession session = request.getSession();
        Admininstrator admininstrator = (Admininstrator) session.getAttribute("loginsession");
        List<OrderRecords> orderRecords = null;
        if(admininstrator.getRole()==1){
            String userName = admininstrator.getUserName();
            orderRecords = backendOrderService.selectWaitTreatedByName(userName);
        }else{
             orderRecords = backendOrderService.selectWaitTreated();
        }


        if(orderRecords==null){
            System.out.println("null");
        }
        for (OrderRecords order : orderRecords){
            System.out.println(order.getDoctorName()+"********");
        }
        model.addAttribute("orders",orderRecords);
        System.out.println("待就诊");
        return "backend/order/waitTreated";
    }

    /**
     * 修改订单状态为完成
     * @param id
     * @return
     */
    @RequestMapping("/backend/modifyOrderStatus")
    @ResponseBody
    public ResponseResult modifyOrderStatus(@RequestParam("id") Integer id){

        ResponseResult responseResult = backendOrderService.modifyOrderStatus(id);

        return responseResult;
    }


    /**
     * 跳转到已就诊信息页面
     * @param model
     * @return
     */
    @RequestMapping("/backend/skipAlreadyTreated")
    public String skipAlreadyTreated(Model model,HttpServletRequest request){

        HttpSession session = request.getSession();
        Admininstrator admininstrator = (Admininstrator) session.getAttribute("loginsession");
        List<OrderRecords>  orders = null;
        if(admininstrator.getRole()==1){
            orders = backendOrderService.findsAlreadyTreatedByName(admininstrator.getUserName());
        }else {
             orders = backendOrderService.findsAlreadyTreated();
        }

        model.addAttribute("orders",orders);
        return "backend/order/alreadyTreated";
    }

    /**
     * 跳转到已取消页面
     * @return
     */
    @RequestMapping("/backend/skipCancelled")
    public String skipCancelled(Model model, HttpServletRequest request){

        HttpSession session = request.getSession();
        Admininstrator admininstrator = (Admininstrator) session.getAttribute("loginsession");
        List<OrderRecords>  orders = null;
        if(admininstrator.getRole()==1){
            orders = backendOrderService.findsCancelledByName(admininstrator.getUserName());
        }else {
            orders = backendOrderService.findsCancelled();
        }


        model.addAttribute("orders",orders);

        return "backend/order/cancelled";
    }


    /**
     * 跳转到爽约页面
     * @return
     */
    @RequestMapping("/backend/skipBreakAppointment")
    public String skipBreakAppointment(Model model, HttpServletRequest request){

        HttpSession session = request.getSession();
        Admininstrator admininstrator = (Admininstrator) session.getAttribute("loginsession");
        List<OrderRecords>  orders = null;
        if(admininstrator.getRole()==1){
            orders = backendOrderService.findsBreakAppointmentByName(admininstrator.getUserName());
        }else {
            orders = backendOrderService.findsBreakAppointment();
        }

        model.addAttribute("orders",orders);
        return "backend/order/breakAppointment";
    }

}
