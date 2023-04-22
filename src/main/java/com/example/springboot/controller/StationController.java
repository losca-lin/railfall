package com.example.springboot.controller;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Rainfall;
import com.example.springboot.entity.Station;
import com.example.springboot.entity.User;
import com.example.springboot.service.IRainfallService;
import com.example.springboot.service.IStationService;
import com.example.springboot.service.IUserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
/**
 * <p>
 * 车站信息表 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/station")
public class StationController {

    @Resource
    private IStationService stationService;
    @Resource
    private IRainfallService rainfallService;
    @Resource
    private IUserService userService;

    // 新增或者更新 当id为空时候新增，当id不为空的时候根据id更新
    @PostMapping
    public Result save(@RequestBody Station station) {
        if (station.getId()==null){
            User currentUser = TokenUtils.getCurrentUser();
            station.setUid(currentUser.getId());
        }
        stationService.saveOrUpdate(station);
        return Result.success();
    }

    //根据id删除数据
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        QueryWrapper<Rainfall> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("sid",id);
        if (rainfallService.list(queryWrapper).size()>0) {
            return Result.error("600","车站已经在使用了");
        }
        stationService.removeById(id);
        return Result.success();
    }

    //根据多个id删除多条数据
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        for (Integer id : ids) {
            QueryWrapper<Rainfall> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("sid",id);
            if (rainfallService.list(queryWrapper).size()>0) {
                return Result.error("600","车站已经在使用了");
            }
        }
        stationService.removeByIds(ids);
        return Result.success();
    }

    //获取所有数据
    @GetMapping
    public Result findAll() {
        return Result.success(stationService.list());
    }

    //根据id获取数据
    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(stationService.getById(id));
    }

    //分页获取数据 name 条件值  pagenum页码  pagesize每页显示条数
    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Station> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        User currentUser = TokenUtils.getCurrentUser();
        if ("ROLE_USER".equals(currentUser.getRole())){
            queryWrapper.like("uid", currentUser.getId());
        }
        Page<Station> page = stationService.page(new Page<>(pageNum, pageSize), queryWrapper);
        for (Station record : page.getRecords()) {
            record.setUser(userService.getById(record.getUid()));
        }
        return Result.success(page);
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Station> list = stationService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Station信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

        }

    /**
     * excel 导入
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<Station> list = reader.readAll(Station.class);

        stationService.saveBatch(list);
        return Result.success();
    }

}

