package com.tudou.system.platform.base.security.realm;

import com.tudou.base.emp.entity.EidpEmp;
import com.tudou.base.emp.mapper.EidpEmpMapper;
import com.tudou.extra.system.UserInfoUtil;
import com.tudou.util.MybatisUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.realm.Realm;

import java.util.List;

/**
 * 自定义验证
 *
 * @author weihua
 * @create 2017-07-06 21:34
 */
public class EmpRealm implements Realm {
    @Override
    public String getName() {
        return "empRealm";
    }

    @Override
    public boolean supports(AuthenticationToken authenticationToken) {
        return authenticationToken instanceof UsernamePasswordToken;
    }

    /**
     * 验证用户名与密码
     *
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    public AuthenticationInfo getAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = (String) authenticationToken.getPrincipal();  //得到用户名
        String password = new String((char[]) authenticationToken.getCredentials()); //得到密码
         password = Base64.encodeToString(password.getBytes());// 使用base加密
        // Base64.decodeToString(password); 解密
        // RedisUtil redisUtil = SpringUtil.getBean(RedisUtil.class);
        try {
            EidpEmpMapper eidpEmpMapper = MybatisUtil.getSqlSession().getMapper(EidpEmpMapper.class);
            Integer userCount = eidpEmpMapper.validByUser(username);
            if (userCount <= 0) {
                throw new UnknownAccountException(); //如果用户名错误
            }
            if (userCount > 1) {
                throw new RuntimeException("查询到多个相同用户");
            }
            List<EidpEmp> eidpEmps = eidpEmpMapper.validByUserAndPassword(username, password);
            if (CollectionUtils.isEmpty(eidpEmps)) {
                throw new IncorrectCredentialsException(); //如果密码错误
            }
            UserInfoUtil.setAuthInfo(eidpEmps.get(0).getId(), eidpEmps.get(0).getUsername(), eidpEmps.get(0).getDepartment());
        } catch (Exception e) {
            throw e;
        } finally {
            MybatisUtil.closeSqlSession();
        }
        //如果身份认证验证成功，返回一个AuthenticationInfo实现；
        return new SimpleAuthenticationInfo(username, password, getName());
    }
}
