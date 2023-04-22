package com.example.springboot.controller;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Railwayline;
import com.example.springboot.entity.RailwaylineStation;
import com.example.springboot.entity.Station;
import com.example.springboot.entity.User;
import com.example.springboot.mapper.RailwaylineMapper;
import com.example.springboot.service.IRailwaylineService;
import com.example.springboot.service.IRailwaylineStationService;
import com.example.springboot.service.IStationService;
import com.example.springboot.service.IUserService;
import com.example.springboot.utils.TokenUtils;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 铁路线管理 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/railwayline")
public class RailwaylineController {

    @Resource
    private IRailwaylineService railwaylineService;
    @Resource
    private RailwaylineMapper railwaylineMapper;
    @Resource
    private IUserService userService;
    @Resource
    private IStationService stationService;
    @Resource
    private IRailwaylineStationService railwaylineStationService;

    // 新增或者更新 当id为空时候新增，当id不为空的时候根据id更新
    @PostMapping
    public Result save(@RequestBody Railwayline railwayline) {
        if (railwayline.getId()!=null){
            railwaylineService.updateById(railwayline);
            QueryWrapper<RailwaylineStation> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.eq("rid",railwayline.getId());
            railwaylineStationService.remove(queryWrapper1);

        }else {
            User currentUser = TokenUtils.getCurrentUser();
            railwayline.setUid(currentUser.getId());
            railwaylineMapper.insert(railwayline);
        }
        if (!CollectionUtils.isEmpty(railwayline.getStationListid())){
            for (Integer integer : railwayline.getStationListid()) {
                railwaylineStationService.save(new RailwaylineStation(railwayline.getId(), integer));
            }
        }
        return Result.success();
    }

    //根据id删除数据
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        railwaylineService.removeById(id);
        return Result.success();
    }

    //根据多个id删除多条数据
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        railwaylineService.removeByIds(ids);
        return Result.success();
    }

    //获取所有数据
    @GetMapping
    public Result findAll() {
        return Result.success(railwaylineService.list());
    }

    //根据id获取数据
    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(railwaylineService.getById(id));
    }

    //分页获取数据 name 条件值  pagenum页码  pagesize每页显示条数
    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Railwayline> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        Page<Railwayline> page = railwaylineService.page(new Page<>(pageNum, pageSize), queryWrapper);
        for (Railwayline record : page.getRecords()) {
            record.setUser(userService.getById(record.getUid()));
            QueryWrapper<RailwaylineStation> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.eq("rid",record.getId());
            List<RailwaylineStation> list = railwaylineStationService.list(queryWrapper1);
            if (!CollectionUtils.isEmpty(list)){
                List<Integer> collect = list.stream().map(RailwaylineStation::getSid).collect(Collectors.toList());
                QueryWrapper<Station> queryWrapper2 = new QueryWrapper<>();
                queryWrapper2.in("id", collect);
                List<Station> list1 = stationService.list(queryWrapper2);
                record.setStationList(list1);
                record.setStationListid(list1.stream().map(Station::getId).collect(Collectors.toList()));
            }
        }
        return Result.success(page);
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Railwayline> list = railwaylineService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Railwayline信息表", "UTF-8");
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
        List<Railwayline> list = reader.readAll(Railwayline.class);

        railwaylineService.saveBatch(list);
        return Result.success();
    }

}

