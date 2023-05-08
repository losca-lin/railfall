package com.example.springboot.service.impl;

import com.example.springboot.entity.RainYear;
import com.example.springboot.mapper.RainYearMapper;
import com.example.springboot.service.IRainYearService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 */
@Service
public class RainYearServiceImpl extends ServiceImpl<RainYearMapper, RainYear> implements IRainYearService {

}
