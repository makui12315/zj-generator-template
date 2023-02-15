##引入宏定义
$!init
$!define

##使用宏定义设置回调（保存位置与文件后缀）
#save("/domain/entity",".java")

##使用宏定义设置包后缀
#setPackageSuffix("domain.entity")

##使用全局变量实现默认包导入
$!autoImport
import lombok.Getter;
import lombok.Setter;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

##使用宏定义实现类注释信息
#tableComment("实体类")
@TableName("$!{tableInfo.obj.name}")
@Getter
@Setter
public class $!{tableInfo.name} implements Serializable{

private static final long serialVersionUID=$!tool.serial();

#foreach($column in $tableInfo.fullColumn)

/**
#if(${column.comment})
* ${column.comment}
#end
#if(!${column.nullAble})
* notNull
#end
*/
#if($!{column.name}==$pk.name)
@TableId(value = "id", type = IdType.AUTO)
#end
private $!{tool.getClsNameByFullName($column.type)} $!{column.name};
#end
}
