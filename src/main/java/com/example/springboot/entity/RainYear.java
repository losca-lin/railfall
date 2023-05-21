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
  @TableName("rain_year")
@ApiModel(value = "RainYear对象", description = "")
public class RainYear implements Serializable {

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

      @ApiModelProperty("年总雨量")
      private Integer dayYear;

      @ApiModelProperty("1月总雨量")
      private Integer r1mon;

      @ApiModelProperty("2月总雨量")
      private Integer r2mon;

      @ApiModelProperty("3月总雨量")
      private Integer r3mon;

      @ApiModelProperty("4月总雨量")
      private Integer r4mon;

      @ApiModelProperty("5月总雨量")
      private Integer r5mon;

      @ApiModelProperty("6月总雨量")
      private Integer r6mon;

      @ApiModelProperty("7月总雨量")
      private Integer r7mon;

      @ApiModelProperty("8月总雨量")
      private Integer r8mon;

      @ApiModelProperty("9月总雨量")
      private Integer r9mon;

      @ApiModelProperty("10月总雨量")
      private Integer r10mon;

      @ApiModelProperty("11月总雨量")
      private Integer r11mon;

      @ApiModelProperty("12月总雨量")
      private Integer r12mon;


}
