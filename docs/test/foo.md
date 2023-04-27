---
created: 2023-04-27
intention: random thoughts.
gh-title: Foo
category: test
share: true
tags:
  - sketch
  - topdown
---


#sketch #topdown 

> Mountains cannot be surmounted except by winding paths.
> — <cite>Johann Wolfgang von Goethe</cite>

# h1
## h2

```puml
@startuml

!include /Users/xiaoluo/Documents/Obsidian Vault/insight/head.iuml

!define ctl |#LightBlue|控制单元|
!define agg |#Gold|聚合单元|
!define cal |#Wheat|计算单元|

title 设备性能动态统计数值计算

ctl
start
:开始动态统计;
:校验参数合法和以及存在性;
if (统计粒度是否汇总或plmn) then (yes)
    :查汇总表数据;
    note right #Tomato
        V3.1新增
        变量列表查询
    end note
else (no)
    :查天表的数据;
    note left #Tomato
        V3.1新增
        变量列表查询
    end note
endif

:开始聚合基础指标|

agg
    :数据清洗;
    split
        :天+plmn;
    split again
        :周+小区;
    split again
        :...;
    end split
ctl
:开始计算基础指标|
cal
    split
        :均值;
    split again
        :最大;
    split again
        :...;
    end split
ctl
:开始再次聚合基础指标|
agg
    :采集结束时间;
ctl
:开始计算指标|
cal
    :依赖分析;
    :缺省丢弃;
    :根据指标的数学公式计算结果;
    :公式非法丢弃;
    :NaN/Infinity丢弃;
ctl
:结果;
end


@enduml
```

<div style="page-break-after: always; visibility: hidden">\pagebreak</div>

![[../media/device_performance_monitor.activity.puml|device_performance_monitor.activity.puml]]

### h3
#### h4
##### h5
###### h6

[[./bar|bar]]
