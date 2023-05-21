package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 */
@Getter
@Setter
  @TableName("rain_mon")
@ApiModel(value = "RainMon对象", description = "")
public class RainMon implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("工务段名称")
      private String gname;

      @ApiModelProperty("铁路线名称")
      private String lname;

      @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("站点")
      private String sname;

      @ApiModelProperty("月总雨量")
      private Integer dayMon;

      @ApiModelProperty("1号总雨量")
      private Integer r1day;

      @ApiModelProperty("2号总雨量")
      private Integer r2day;

      @ApiModelProperty("3号总雨量")
      private Integer r3day;

      @ApiModelProperty("4号总雨量")
      private Integer r4day;

      @ApiModelProperty("5号总雨量")
      private Integer r5day;

      @ApiModelProperty("6号总雨量")
      private Integer r6day;

      @ApiModelProperty("7号总雨量")
      private Integer r7day;

      @ApiModelProperty("8号总雨量")
      private Integer r8day;

      @ApiModelProperty("9号总雨量")
      private Integer r9day;

      @ApiModelProperty("10号总雨量")
      private Integer r10day;

      @ApiModelProperty("11号总雨量")
      private Integer r11day;

      @ApiModelProperty("12号总雨量")
      private Integer r12day;

      @ApiModelProperty("13号总雨量")
      private Integer r13day;

      @ApiModelProperty("14号总雨量")
      private Integer r14day;

      @ApiModelProperty("15号总雨量")
      private Integer r15day;

      @ApiModelProperty("16号总雨量")
      private Integer r16day;

      @ApiModelProperty("17号总雨量")
      private Integer r17day;

      @ApiModelProperty("18号总雨量")
      private Integer r18day;

      @ApiModelProperty("19号总雨量")
      private Integer r19day;

      @ApiModelProperty("20号总雨量")
      private Integer r20day;

      @ApiModelProperty("21号总雨量")
      private Integer r21day;

      @ApiModelProperty("22号总雨量")
      private Integer r22day;

      @ApiModelProperty("23号总雨量")
      private Integer r23day;

      @ApiModelProperty("24号总雨量")
      private Integer r24day;

      @ApiModelProperty("25号总雨量")
      private Integer r25day;

      @ApiModelProperty("26号总雨量")
      private Integer r26day;

      @ApiModelProperty("27号总雨量")
      private Integer r27day;

      @ApiModelProperty("28号总雨量")
      private Integer r28day;

      @ApiModelProperty("29号总雨量")
      private Integer r29day;

      @ApiModelProperty("30号总雨量")
      private Integer r30day;

      @ApiModelProperty("31号总雨量")
      private Integer r31day;


}
