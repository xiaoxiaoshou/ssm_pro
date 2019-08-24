package cn.sfturing.iterceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 后台登录拦截
 * @author eRunn
 * @create 2019-03-14 20:26
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("------LoginInterceptor-------");

        // 获取请求的URL
        String url = httpServletRequest.getRequestURI();
        // URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        // 注意：一些静态文件不能拦截，否则会死循环，知道内存耗尽
        if (url.indexOf("login") >= 0) {
            return true;
        }
        // 获取Session
        HttpSession session = httpServletRequest.getSession();
        Object loginsession = session.getAttribute("loginsession");



        if (loginsession != null) {
            return true;
        }
        // 不符合条件的，跳转到登录界面
        // request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        httpServletResponse.sendRedirect("backend/skipToLogin");

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
