package com.tudou.system.platform.init;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 测试  过期方法，无效
 *
 * @author weihua
 * @create 2017-04-24 23:13
 */
@Deprecated
public class RedisInitListener implements ServletContextListener {
    private static WebApplicationContext springContext;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //系统初始化执行
        // 启动文件监听
//        FileObserver ob = new FileObserver("E:\\工作区间\\work\\base\\src\\main\\java\\com\\tudou");
//        FileListener init = new FileListener();
//        ob.addListener(init);
//        FileMonitor monitor = new FileMonitor(ob);
//         monitor.start();
        // 重载spring
        //springContext = WebApplicationContextUtils.getWebApplicationContext(servletContextEvent.getServletContext());
//        ContextRefreshedEvent contextRefreshedEvent;
//        contextRefreshedEvent.getApplicationContext()
//        ApplicationContext applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContextEvent.getServletContext());
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
    }

    public static ApplicationContext getApplicationContext() {
        return springContext;
    }
}
