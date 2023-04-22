package com.example.springboot.entity;

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
  @ApiModel(value = "Text对象", description = "")
public class Text implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("id")
        private Integer id;

      @ApiModelProperty("名称")
      private String name;

      @ApiModelProperty("文本11111111")
      private String text;


}
