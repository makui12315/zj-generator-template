##定义初始变量
$!init
#set($tableName = $tool.append($tableInfo.name, "Controller"))
##设置回调
$!callback.setFileName($tool.append($tableName, ".java"))
$!callback.setSavePath($tool.append($tableInfo.savePath, "/api/controller/v1"))

#if($tableInfo.savePackageName)package $!{tableInfo.savePackageName}.#{end}api.controller.v1;

import $!{tableInfo.savePackageName}.api.queryParam.${className}QueryParam;
import cn.zjcloth.erp.order.common.CommonResult;
import cn.zjcloth.erp.order.common.PageResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import $!{tableInfo.savePackageName}.api.dto.${className}DTO;
import $!{tableInfo.savePackageName}.domain.vo.${className}VO;
import $!{tableInfo.savePackageName}.infra.mapper.${className}Mapper;
import $!{tableInfo.savePackageName}.app.service.${className}Service;
import java.util.List;
import java.util.Optional;
import javax.validation.Valid;

/**
 * $!{tableInfo.comment}($!{tableInfo.name}) 控制层
 *
 * @author $!author
 * @since $!time.currTime()
 */
@RestController
@RequestMapping("/$tool.firstLowerCase($className)")
@RequiredArgsConstructor
public class ${className}Controller {
  
    private final ${className}Mapper ${classname}Mapper;
    
    private final ${className}Service ${classname}Service;

    @ApiOperation(value = "查询")
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public PageResult<${className}VO> page(${className}QueryParam param) {
        final Integer pageNum = Optional.ofNullable(param.getPage()).orElse(1);
        final Integer pageSize = Optional.ofNullable(param.getLimit()).orElse(20);
       final PageInfo<${className}VO> pageInfo = PageHelper.startPage(pageNum, pageSize)
                .doSelectPageInfo(()->${classname}Mapper.searchList(param));
        return PageResult.success(pageInfo);
    }


    @ApiOperation(value = "创建")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult<Void> create(@RequestBody @Valid ${className}DTO dto){
        ${classname}Service.create(dto);
        return CommonResult.success();
    }

    @ApiOperation(value = "修改")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult<Void> update(@RequestBody @Valid ${className}DTO dto){
        ${classname}Service.update(dto);
        return CommonResult.success();
    }

    @ApiOperation(value = "删除")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public CommonResult<Void> delete(@RequestBody List<Integer> ids){
         Assert.state(!CollectionUtils.isEmpty(ids), "请选择要删除的数据");
         ${classname}Service.delete(ids);
        return CommonResult.success();
    }
}