##定义初始变量
$!init
#set($tableName = $tool.append($tableInfo.name, "Service"))
##设置回调
$!callback.setFileName($tool.append($tableName, ".java"))
$!callback.setSavePath($tool.append($tableInfo.savePath, "/app/service"))

#if($tableInfo.savePackageName)package $!{tableInfo.savePackageName}.#{end}app.service;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import $!{tableInfo.savePackageName}.domain.entity.${className};
import $!{tableInfo.savePackageName}.api.dto.${className}DTO;
import $!{tableInfo.savePackageName}.infra.mapper.${className}Mapper;
import java.util.List;

/**
* $!{tableInfo.comment}($!{tableInfo.name})应用服务
*
* @author $!{tableInfo.author}
* @since $!time.currTime()
*/
@Service
@RequiredArgsConstructor
public class ${className}Service {

private final ${className}Mapper ${classname}Mapper;

public void create(${className}DTO dto) {
${className} entity = new ${className}();
BeanUtils.copyProperties(dto, entity);
${classname}Mapper.insert(entity);
}

public void update(${className}DTO dto) {
final ${className} one = ${tool.firstLowerCase(${className})}Mapper.selectById(dto.getId());
BeanUtils.copyProperties(dto, one);
storeQuotaInfoMapper.updateById(one);
}

public void delete(List<Integer> ids) {
 storeQuotaInfoMapper.deleteBatchIds(ids);
 }
 }
