package com.example.springboot.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.entity.Rainfall;
import com.example.springboot.entity.User;
import com.example.springboot.mapper.RainfallMapper;
import com.example.springboot.service.IRainfallService;
import com.example.springboot.service.IStationService;
import com.example.springboot.service.IUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/echarts")
public class EchartsController {

    @Autowired
    private IUserService userService;

    @Resource
    private IRainfallService rainfallService;
    @Resource
    private RainfallMapper rainfallMapper;
    @Resource
    private IStationService stationService;
    @GetMapping("/members1")
    public Map<String, Object> members1(@RequestParam String name,
                                        @RequestParam(required = false) String time) {
        Map<String, Object> hashMap = new HashMap<>();
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role","ROLE_USER");
        hashMap.put("user",userService.list(queryWrapper).size());
        hashMap.put("statio",stationService.list().size());
        QueryWrapper<Rainfall> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("sid",name);
        if (StringUtils.isEmpty(time)){
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            time=LocalDate.now().format(formatter);
        }
        queryWrapper1.eq("STR_TO_DATE(time,'%Y-%m-%d')",time);
        queryWrapper1.orderByAsc("time");
        List<Rainfall> rainfallList = rainfallService.list(queryWrapper1);
        List<String> objects = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        for (Rainfall rainfall : rainfallList) {
            objects.add(rainfall.getTime().format(formatter));
        }
        hashMap.put("time",objects);

        hashMap.put("rainfallTital",rainfallList.stream().map(Rainfall::getRainfallTital).collect(Collectors.toList()));
        hashMap.put("water",rainfallList.stream().map(Rainfall::getWater).collect(Collectors.toList()));
        hashMap.put("temperature",rainfallList.stream().map(Rainfall::getTemperature).collect(Collectors.toList()));

        List<Rainfall> rainfallList1=rainfallMapper.selectonemonth(LocalDateTime.now().minusDays(30));
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        hashMap.put("time1",rainfallList1.stream().map(rainfall -> rainfall.getTime().format(formatter1)).collect(Collectors.toList()));

        hashMap.put("rainfallTital1",rainfallList1.stream().map(Rainfall::getRainfallTital).collect(Collectors.toList()));
        hashMap.put("water1",rainfallList1.stream().map(Rainfall::getWater).collect(Collectors.toList()));
        hashMap.put("temperature1",rainfallList1.stream().map(Rainfall::getTemperature).collect(Collectors.toList()));


        return hashMap;
    }

}
