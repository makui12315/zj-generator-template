##引入宏定义
$!init
$!define

##使用宏定义设置回调（保存位置与文件后缀）
#save("/domain/vo","VO.java")

##使用宏定义设置包后缀
#setPackageSuffix("domain.vo")

##使用全局变量实现默认包导入
$!autoImport
import java.io.Serializable;
import $!{tableInfo.savePackageName}.domain.entity.${className};
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
* $!{tableInfo.comment}($!{tableInfo.name}) VO
*
* @author $!{tableInfo.author}
* @since $!time.currTime()
*
* @see $!{tableInfo.name}
*/
@Getter
@Setter
@ToString
public class $!{tableInfo.name}VO extends $!{tableInfo.name} implements Serializable {
private static final long serialVersionUID=$!tool.serial();

}
