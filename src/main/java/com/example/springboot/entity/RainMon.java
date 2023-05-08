package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

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

      @ApiModelProperty("工务段id")
      private Integer gid;

      @ApiModelProperty("铁路线id")
      private Integer lid;

      @ApiModelProperty("站点id")
        private Integer id;

      @ApiModelProperty("月总雨量")
        private Integer dayMon;

      @ApiModelProperty("1号总雨量")
      private Integer r1day;

      @ApiModelProperty("下面同理我就不写了")
      private Integer r2day;

      @ApiModelProperty("1号总雨量")
      private Integer r3day;

      @ApiModelProperty("1号总雨量")
      private Integer r4day;

      @ApiModelProperty("1号总雨量")
      private Integer r5day;

      @ApiModelProperty("1号总雨量")
      private Integer r6day;

      @ApiModelProperty("1号总雨量")
      private Integer r7day;

      @ApiModelProperty("1号总雨量")
      private Integer r8day;

      @ApiModelProperty("1号总雨量")
      private Integer r9day;

      @ApiModelProperty("1号总雨量")
      private Integer r10day;

      @ApiModelProperty("1号总雨量")
      private Integer r11day;

      @ApiModelProperty("1号总雨量")
      private Integer r12day;

      @ApiModelProperty("1号总雨量")
      private Integer r13day;

      @ApiModelProperty("1号总雨量")
      private Integer r14day;

      @ApiModelProperty("1号总雨量")
      private Integer r15day;

      @ApiModelProperty("1号总雨量")
      private Integer r16day;

      @ApiModelProperty("1号总雨量")
      private Integer r17day;

      @ApiModelProperty("1号总雨量")
      private Integer r18day;

      @ApiModelProperty("1号总雨量")
      private Integer r19day;

      @ApiModelProperty("1号总雨量")
      private Integer r20day;

      @ApiModelProperty("1号总雨量")
      private Integer r21day;

      @ApiModelProperty("1号总雨量")
      private Integer r22day;

      @ApiModelProperty("1号总雨量")
      private Integer r23day;

      @ApiModelProperty("1号总雨量")
      private Integer r24day;

      @ApiModelProperty("1号总雨量")
      private Integer r25day;

      @ApiModelProperty("1号总雨量")
      private Integer r26day;

      @ApiModelProperty("1号总雨量")
      private Integer r27day;

      @ApiModelProperty("1号总雨量")
      private Integer r28day;

      @ApiModelProperty("1号总雨量")
      private Integer r29day;

      @ApiModelProperty("1号总雨量")
      private Integer r30day;

      @ApiModelProperty("1号总雨量")
      private Integer r31day;


}
