package com.tudou.base.goods.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.tudou.base.goods.service.IGoodsBrandService;
import com.tudou.base.goods.mapper.GoodsBrandMapper;
import com.tudou.system.platform.base.service.impl.BaseServiceImpl;
import com.tudou.base.goods.entity.GoodsBrand;
import org.springframework.transaction.annotation.Transactional;
import com.tudou.system.platform.base.annotation.BaseResource;

@Transactional(rollbackFor = Exception.class)
@Service("goodsBrandService")
public class GoodsBrandServiceImpl extends BaseServiceImpl<GoodsBrand,String> implements IGoodsBrandService{

    @Resource
    @BaseResource
    private GoodsBrandMapper goodsBrandMapper;

}