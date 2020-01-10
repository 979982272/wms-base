package com.tudou.base.vendor.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.tudou.base.vendor.service.IVendorService;
import com.tudou.base.vendor.mapper.VendorMapper;
import com.tudou.system.platform.base.service.impl.BaseServiceImpl;
import com.tudou.base.vendor.entity.Vendor;
import org.springframework.transaction.annotation.Transactional;
import com.tudou.system.platform.base.annotation.BaseResource;

@Transactional(rollbackFor = Exception.class)
@Service("vendorService")
public class VendorServiceImpl extends BaseServiceImpl<Vendor,String> implements IVendorService{

    @Resource
    @BaseResource
    private VendorMapper vendorMapper;

}