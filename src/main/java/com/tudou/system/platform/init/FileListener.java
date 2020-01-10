package com.tudou.system.platform.init;

import org.apache.commons.io.monitor.FileAlterationListenerAdaptor;
import org.apache.commons.io.monitor.FileAlterationObserver;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;

import java.io.File;

/**
 * 测试
 *
 * @author weihua
 * @create 2017-04-24 22:58
 */
public class FileListener extends FileAlterationListenerAdaptor {
    @Override
    public void onDirectoryChange(File directory) {
        System.out.println("文件目录变更了:" + directory.getAbsolutePath());
    }

    @Override
    public void onDirectoryCreate(File directory) {
        System.out.println("文件目录创建了:" + directory.getAbsolutePath());
    }

    @Override
    public void onDirectoryDelete(File directory) {
        System.out.println("文件目录删除了:" + directory.getAbsolutePath());
    }

    @Override
    public void onFileChange(File file) {
        System.out.println("文件变更了:" + file.getAbsolutePath());
    }

    @Override
    public void onFileCreate(File file) {
        ApplicationContext app
                = new ClassPathXmlApplicationContext("Application-Spring-Mvc.xml");
        XmlWebApplicationContext xmlWebApplicationContext = (XmlWebApplicationContext) app;
        xmlWebApplicationContext.refresh();
        System.out.println("文件创建了:" + file.getAbsolutePath());
    }

    @Override
    public void onFileDelete(File file) {
        ApplicationContext app
                = new ClassPathXmlApplicationContext("Application-Spring-Mvc.xml");
        XmlWebApplicationContext xmlWebApplicationContext = (XmlWebApplicationContext) app;
        xmlWebApplicationContext.refresh();
        System.out.println("文件删除了:" + file.getAbsolutePath());
    }

    @Override
    public void onStart(FileAlterationObserver observer) {
        System.out.println("开始监听:" + observer.getDirectory());
    }

    @Override
    public void onStop(FileAlterationObserver observer) {
        System.out.println("停止监听:" + observer.getDirectory());
    }
}
