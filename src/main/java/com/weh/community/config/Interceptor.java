package com.weh.community.config;

import com.weh.community.model.SysUser;
import com.weh.community.utils.SessionUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.Set;

@Slf4j
public class Interceptor implements HandlerInterceptor {
    /**
     * 返回false才能拦截到
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("请求路径=="+request.getRequestURI());
        Set<String>urls =new HashSet<>();
        urls.add("/toLogin");
        urls.add("/toRegister");
        urls.add("/user/register");
        urls.add("/static/");
        urls.add("/homePage");
        //包含过滤路径的放行
       if (urls.contains(request.getRequestURI())){
           log.info("放行");
           return true;
       }

        //如果会话存在，那就释放所有资源
        //获取服务器中的用户
        SysUser sysUser = SessionUser.getServerUser(request);
        if (null!=sysUser){
            System.out.println("sysUser=="+sysUser.toString());
            return true;
        }
        //跳转到首页
        response.sendRedirect("/homePage");
        return false;

    }
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.info("处理前");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        log.info("处理后---");
    }
}
