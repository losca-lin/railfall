package com.example.springboot.controller;

import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import com.example.springboot.common.Result;

import com.example.springboot.service.IRainYearService;
import com.example.springboot.entity.RainYear;

import org.springframework.web.bind.annotation.RestController;
import java.net.URLEncoder;
import java.util.List;
/**
 * <p>
 *  前端控制器
 * </p>
 */
@RestController
@RequestMapping("/rainYear")
public class RainYearController {

    @Resource
    private IRainYearService rainYearService;

    // 新增或者更新 当id为空时候新增，当id不为空的时候根据id更新
    @PostMapping
    public Result save(@RequestBody RainYear rainYear) {
        rainYearService.saveOrUpdate(rainYear);
        return Result.success();
    }

    //根据id删除数据
    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        rainYearService.removeById(id);
        return Result.success();
    }

    //根据多个id删除多条数据
    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        rainYearService.removeByIds(ids);
        return Result.success();
    }

    //获取所有数据
    @GetMapping
    public Result findAll() {
        return Result.success(rainYearService.list());
    }

    //根据id获取数据
    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(rainYearService.getById(id));
    }

    //分页获取数据 name 条件值  pagenum页码  pagesize每页显示条数
    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<RainYear> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
        return Result.success(rainYearService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<RainYear> list = rainYearService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("RainYear信息表", "UTF-8");
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
        List<RainYear> list = reader.readAll(RainYear.class);

        rainYearService.saveBatch(list);
        return Result.success();
    }

}

