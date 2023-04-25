package com.example.springboot.service;

import com.example.springboot.entity.Station;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 车站信息表 服务类
 * </p>
 *
 */
public interface IStationService extends IService<Station> {

    Station getInfoByUid(Integer uid);
}
