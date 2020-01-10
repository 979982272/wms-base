package com.tudou.system.platform.base.security;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.config.IniSecurityManagerFactory;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Factory;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * shrio权限测试
 *
 * @author weihua
 * @create 2017-07-06 18:21
 */
public class ShrioTest {
    public static final Logger logger = LoggerFactory.getLogger(ShrioTest.class);

    @Test
    public void testHelloWorld() {
        Factory<SecurityManager> securityManagerFactory = new IniSecurityManagerFactory("classpath:shiro.ini");
        SecurityManager securityManager = securityManagerFactory.getInstance();
        SecurityUtils.setSecurityManager(securityManager);
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken("王伟华", "tudou123");
        System.out.println(Base64.decodeToString("dHVkb3UxMjM="));
        try {
            subject.login(token);
        } catch (UnknownAccountException e) {
            logger.error("账号错误");
        } catch (IncorrectCredentialsException e) {
            logger.error("密码错误");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
