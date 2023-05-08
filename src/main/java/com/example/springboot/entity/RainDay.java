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
  @TableName("rain_day")
@ApiModel(value = "RainDay对象", description = "")
public class RainDay implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("工务段id")
      private Integer gid;

      @ApiModelProperty("铁路线id")
      private Integer lid;

      @ApiModelProperty("站点id")
        private Integer id;

      @ApiModelProperty("日总雨量")
      private Integer dayRain;

      @ApiModelProperty("十分钟雨量最大时刻")
      private LocalDateTime r10minMaxTime;

      @ApiModelProperty("十分钟最大雨量")
      private Integer r10minMax;

      @ApiModelProperty("1小时雨量最大时刻")
      private LocalDateTime r1hourMaxTime;

      @ApiModelProperty("1小时最大雨量")
      private Integer r1hourMaxr;

      @ApiModelProperty("0点到1点雨量")
      private Integer r1hour;

      @ApiModelProperty("下面同上，我就不改了")
      private Integer r2hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r3hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r4hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r5hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r6hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r7hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r8hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r9hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r10hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r11hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r12hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r13hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r14hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r15hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r16hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r17hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r18hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r19hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r20hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r21hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r22hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r23hour;

      @ApiModelProperty("0点到1点雨量")
      private Integer r24hour;


}
