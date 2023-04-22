package com.example.springboot.service.impl;

import com.example.springboot.entity.Railwayline;
import com.example.springboot.mapper.RailwaylineMapper;
import com.example.springboot.service.IRailwaylineService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 铁路线管理 服务实现类
 * </p>
 */
@Service
public class RailwaylineServiceImpl extends ServiceImpl<RailwaylineMapper, Railwayline> implements IRailwaylineService {

}
