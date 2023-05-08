package com.example.springboot.service.impl;

import com.example.springboot.entity.RainDay;
import com.example.springboot.mapper.RainDayMapper;
import com.example.springboot.service.IRainDayService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 */
@Service
public class RainDayServiceImpl extends ServiceImpl<RainDayMapper, RainDay> implements IRainDayService {

}
