package com.example.springboot.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.entity.Station;
import com.example.springboot.mapper.StationMapper;
import com.example.springboot.service.IStationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 车站信息表 服务实现类
 * </p>
 */
@Service
public class StationServiceImpl extends ServiceImpl<StationMapper, Station> implements IStationService {

    @Override
    public Station getInfoByUid(Integer uid) {
        QueryWrapper<Station> wrapper = new QueryWrapper<>();
        wrapper.eq("uid", uid);
        Station station = this.getOne(wrapper,false);
        return station;
    }
}
