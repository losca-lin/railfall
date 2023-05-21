package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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

      @ApiModelProperty("工务段名称")
      private String gname;

      @ApiModelProperty("铁路线名称")
      private String lname;

      @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("站点名称")
      private String sname;

      @ApiModelProperty("日总雨量")
      private Integer dayRain;

      @ApiModelProperty("十分钟雨量最大时刻")
      // @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
      private LocalDateTime r10minMaxTime;

      @ApiModelProperty("十分钟最大雨量")
      private Integer r10minMax;

      @ApiModelProperty("1小时雨量最大时刻")
      private LocalDateTime r1hourMaxTime;

      @ApiModelProperty("1小时最大雨量")
      private Integer r1hourMaxr;

      @ApiModelProperty("0点到1点雨量")
      private Integer r1hour;

      @ApiModelProperty("1点到2点雨量")
      private Integer r2hour;

      @ApiModelProperty("2点到3点雨量")
      private Integer r3hour;

      @ApiModelProperty("3点到4点雨量")
      private Integer r4hour;

      @ApiModelProperty("4点到5点雨量")
      private Integer r5hour;

      @ApiModelProperty("5点到6点雨量")
      private Integer r6hour;

      @ApiModelProperty("6点到7点雨量")
      private Integer r7hour;

      @ApiModelProperty("7点到8点雨量")
      private Integer r8hour;

      @ApiModelProperty("8点到9点雨量")
      private Integer r9hour;

      @ApiModelProperty("9点到10点雨量")
      private Integer r10hour;

      @ApiModelProperty("10点到11点雨量")
      private Integer r11hour;

      @ApiModelProperty("11点到12点雨量")
      private Integer r12hour;

      @ApiModelProperty("12点到13点雨量")
      private Integer r13hour;

      @ApiModelProperty("13点到14点雨量")
      private Integer r14hour;

      @ApiModelProperty("14点到15点雨量")
      private Integer r15hour;

      @ApiModelProperty("15点到16点雨量")
      private Integer r16hour;

      @ApiModelProperty("16点到17点雨量")
      private Integer r17hour;

      @ApiModelProperty("17点到18点雨量")
      private Integer r18hour;

      @ApiModelProperty("18点到19点雨量")
      private Integer r19hour;

      @ApiModelProperty("19点到20点雨量")
      private Integer r20hour;

      @ApiModelProperty("20点到21点雨量")
      private Integer r21hour;

      @ApiModelProperty("21点到22点雨量")
      private Integer r22hour;

      @ApiModelProperty("22点到23点雨量")
      private Integer r23hour;

      @ApiModelProperty("23点到24点雨量")
      private Integer r24hour;


}
