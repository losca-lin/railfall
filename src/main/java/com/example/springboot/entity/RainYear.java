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
  @TableName("rain_year")
@ApiModel(value = "RainYear对象", description = "")
public class RainYear implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("工务段id")
      private Integer gid;

      @ApiModelProperty("铁路线id")
      private Integer lid;

      @ApiModelProperty("站点id")
        private Integer id;

      @ApiModelProperty("年总雨量")
        private Integer dayYear;

      @ApiModelProperty("1月总雨量")
      private Integer r1mon;

      @ApiModelProperty("下面同理我就不写了")
      private Integer r2mon;

      @ApiModelProperty("1号总雨量")
      private Integer r3mon;

      @ApiModelProperty("1号总雨量")
      private Integer r4mon;

      @ApiModelProperty("1号总雨量")
      private Integer r5mon;

      @ApiModelProperty("1号总雨量")
      private Integer r6mon;

      @ApiModelProperty("1号总雨量")
      private Integer r7mon;

      @ApiModelProperty("1号总雨量")
      private Integer r8mon;

      @ApiModelProperty("1号总雨量")
      private Integer r9mon;

      @ApiModelProperty("1号总雨量")
      private Integer r10mon;

      @ApiModelProperty("1号总雨量")
      private Integer r11mon;

      @ApiModelProperty("1号总雨量")
      private Integer r12mon;


}
