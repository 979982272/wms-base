package com.tudou.user.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.tudou.user.service.ITbUserService;
import com.tudou.user.mapper.TbUserMapper;
import com.tudou.system.platform.base.service.impl.BaseServiceImpl;
import com.tudou.user.entity.TbUser;
import org.springframework.transaction.annotation.Transactional;
import com.tudou.system.platform.base.annotation.BaseResource;

@Transactional(rollbackFor = Exception.class)
@Service("tbUserService")
public class TbUserServiceImpl extends BaseServiceImpl<TbUser,String> implements ITbUserService{

    @Resource
    @BaseResource
    private TbUserMapper tbUserMapper;

}