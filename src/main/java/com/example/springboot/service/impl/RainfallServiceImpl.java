package com.example.springboot.service.impl;

import com.example.springboot.entity.Rainfall;
import com.example.springboot.mapper.RainfallMapper;
import com.example.springboot.service.IRainfallService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 雨量信息表 服务实现类
 * </p>
 */
@Service
public class RainfallServiceImpl extends ServiceImpl<RainfallMapper, Rainfall> implements IRainfallService {

}
