##引入mybatis支持
$!mybatisSupport
$!init
##设置保存名称与保存位置
$!callback.setFileName($tool.append($!{tableInfo.name}, "Mapper.xml"))
$!callback.setSavePath($tool.append($modulePath, "/src/main/resources/mapper"))
$!callback.setReformat(false)
##拿到主键
##if(!$tableInfo.pkColumn.isEmpty())
##    #set($pk = $tableInfo.pkColumn.get(0))
##end

##生成sql前缀
#set($prefix = "a")
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="$!{tableInfo.savePackageName}.infra.mapper.$!{tableInfo.name}Mapper">

    <resultMap id="BaseResultMap" type="$!{tableInfo.savePackageName}.domain.entity.$!{tableInfo.name}">
        <!--@Table $!{tableInfo.originTableName}-->
        #foreach($column in $tableInfo.fullColumn)
        <result property="$!column.name" column="$!column.obj.name" jdbcType="$!column.ext.jdbcType"/>
        #end
    </resultMap>

    <sql id="BaseSql">
        #foreach($item in $tableInfo.fullColumn)
        $prefix.$item.obj.name#if($velocityHasNext),
        #end#end

    </sql>

    <select id="selectList" resultType="$!{tableInfo.savePackageName}.domain.vo.${className}VO">
        select
        <include refid="BaseSql"/>
        from $!{tableInfo.obj.name} $prefix
        <where>
            #foreach($column in $tableInfo.fullColumn)
            #if($!{tool.getClsNameByFullName($column.type)}=='String')
            <if test="$!column.name != null and $!column.name != ''">
                and $prefix.$!column.obj.name like concat(#{$!column.name}, '%')
            </if>
            #else
            <if test="$!column.name != null">
                and $prefix.$!column.obj.name = #{$!column.name}
            </if>
            #end
            #end
        </where>
        order by id desc
    </select>
</mapper>
