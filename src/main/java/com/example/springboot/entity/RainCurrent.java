package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 */
@Getter
@Setter
  @TableName("rain_current")
@ApiModel(value = "RainCurrent对象", description = "")
public class RainCurrent implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("工务段id")
      private Integer gid;

      @ApiModelProperty("铁路线id")
      private Integer lid;

      @ApiModelProperty("站点id")
        private Integer id;

      @ApiModelProperty("10分钟雨量数据")
      private Integer r10min;

      @ApiModelProperty("1小时雨量数据")
      private Integer r1hour;

      @ApiModelProperty("3小时雨量数据")
      private Integer r3hour;

      @ApiModelProperty("6小时雨量数据")
      private Integer r6hour;

      @ApiModelProperty("12小时雨量数据")
      private Integer r12hour;

      @ApiModelProperty("24小时雨量数据")
      private Integer r24hour;

      @ApiModelProperty("十分钟雨量最大时刻")
      private LocalDateTime r10minMaxTime;

      @ApiModelProperty("十分钟最大雨量")
      private Integer r10minMax;

      @ApiModelProperty("1小时雨量最大时刻")
      private LocalDateTime r1hourMaxTime;

      @ApiModelProperty("1小时最大雨量")
      private Integer r1hourMax;


}
