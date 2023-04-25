package com.example.springboot.service.impl;

import com.example.springboot.entity.Map;
import com.example.springboot.mapper.MapMapper;
import com.example.springboot.service.IMapService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 */
@Service
public class MapServiceImpl extends ServiceImpl<MapMapper, Map> implements IMapService {

}
