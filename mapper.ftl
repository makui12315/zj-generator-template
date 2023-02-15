##定义初始变量
$!init
#set($tableName = $tool.append($tableInfo.name, "Mapper"))
##设置回调
$!callback.setFileName($tool.append($tableName, ".java"))
$!callback.setSavePath($tool.append($tableInfo.savePath, "/infra/mapper"))

#if($tableInfo.savePackageName)package $!{tableInfo.savePackageName}.#{end}infra.mapper;

import $!{tableInfo.savePackageName}.api.queryParam.${className}QueryParam;
import io.choerodon.mybatis.common.BaseMapper;
import $!{tableInfo.savePackageName}.domain.vo.${className}VO;
import $!{tableInfo.savePackageName}.domain.entity.${className}Entity;

import java.util.List;

/**
 * $!{tableInfo.comment}($!{tableInfo.name})应用服务
 *
 * @author $!author
 * @since $!time.currTime()
 */
public interface ${className}Mapper extends BaseMapper<${className}Entity> {
    /**
     * 基础查询
     * @param param 查询条件
     * @return 返回值
     */
    List<${className}VO> selectList(${className}QueryParam param);
}
