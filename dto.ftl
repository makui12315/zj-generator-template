##引入宏定义
$!init
$!define

##使用宏定义设置回调（保存位置与文件后缀）
#save("/api/dto","DTO.java")

##使用宏定义设置包后缀
#setPackageSuffix("api.dto")

##使用全局变量实现默认包导入
$!autoImport
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import $!{tableInfo.savePackageName}.domain.entity.${className};
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

##使用宏定义实现类注释信息
/**
* $!{tableInfo.comment}($!{tableInfo.name}) DTO
*
* @author $!{tableInfo.author}
* @since $!time.currTime()
*
* @see $!{tableInfo.name}
*/
@ApiModel("$!{tableInfo.obj.comment}")
@Getter
@Setter
@ToString
public class $!{tableInfo.name}DTO implements Serializable {
private static final long serialVersionUID=$!tool.serial();

#foreach($column in $tableInfo.fullColumn)
#if($!{column.name}==$pk.name)
#if(${column.comment})
@ApiModelProperty("${column.comment}")
#end
#else
#if(!${column.nullAble})
@ApiModelProperty(value = "${column.comment}", required = true)
#if($!{tool.getClsNameByFullName($column.type)}=='String')
@NotBlank
#else
@NotNull
#end
#else
#if(${column.comment})
@ApiModelProperty(value = "${column.comment}")
#end
#end
#end
private $!{tool.getClsNameByFullName($column.type)} $!{column.name};

#end
}
