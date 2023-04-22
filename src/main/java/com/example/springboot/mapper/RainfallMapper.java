package com.example.springboot.mapper;

import com.example.springboot.entity.Rainfall;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 雨量信息表 Mapper 接口
 * </p>
 *
 * @author xxx
 * @since 2023-03-13
 */
public interface RainfallMapper extends BaseMapper<Rainfall> {

    List<Rainfall> selectonemonth(@Param("minusDays") LocalDateTime minusDays);
}
