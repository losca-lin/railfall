package com.example.springboot.controller;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.common.Result;
import com.example.springboot.entity.Essage;
import com.example.springboot.service.IEssageService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.time.LocalDateTime;
import java.util.List;
/**
 * <p>
 * 系统公告 前端控制器
 * </p>
 */
@RestController
@RequestMapping("/essage")
public class EssageController {

    @Resource
    private IEssageService essageService;

    // 新增或者更新 当id为空时候新增，当id不为空的时候根据id更新
    @PostMapping
    public Result save(@RequestBody Essage essage) {
        essage.setTime(LocalDateTime.now());
        essageService.saveOrUpdate(essage);
        return Result.success();
    }

    //根据id删除数据
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        essageService.removeById(id);
        return Result.success();
    }

    //根据多个id删除多条数据
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        essageService.removeByIds(ids);
        return Result.success();
    }

    //获取所有数据
    @GetMapping
    public Result findAll() {
        return Result.success(essageService.list());
    }

    //根据id获取数据
    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(essageService.getById(id));
    }

    //分页获取数据 name 条件值  pagenum页码  pagesize每页显示条数
    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Essage> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        return Result.success(essageService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Essage> list = essageService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("Essage信息表", "UTF-8");
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
        List<Essage> list = reader.readAll(Essage.class);

        essageService.saveBatch(list);
        return Result.success();
    }

}

