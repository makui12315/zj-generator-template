##引入宏定义
$!init
$!define

##使用宏定义设置回调（保存位置与文件后缀）
#save("/api/queryParam","QueryParam.java")

##使用宏定义设置包后缀
#setPackageSuffix("api.queryParam")

##使用全局变量实现默认包导入
$!autoImport
import java.io.Serializable;
import $!{tableInfo.savePackageName}.domain.entity.${className};
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
* $!{tableInfo.comment}($!{tableInfo.name})查询参数
*
* @author $!{tableInfo.author}
* @since $!time.currTime()
*
* @see $!{tableInfo.name}
*/
@Getter
@Setter
@ToString
@ApiModel("$!{tableInfo.obj.comment}")
public class $!{tableInfo.name}QueryParam implements Serializable {
private static final long serialVersionUID=$!tool.serial();

@ApiModelProperty(value = "page")
private Integer page;

@ApiModelProperty(value = "size")
private Integer limit;

#foreach($column in $tableInfo.fullColumn)
@ApiModelProperty(value = "${column.comment}")
private $!{tool.getClsNameByFullName($column.type)} $!{column.name};

#end
}

