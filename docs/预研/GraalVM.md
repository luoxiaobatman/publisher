---
created: 2023-09-21
number headings: first-level 2, start-at 1, max 6, 1.1-
title: GraalVM
author: 罗潇
cssclass: wideTable
first-level: 1
pdf-filename: GraalVM
platform: true
category: 预研
---


使用 GraalVM 的好处：

- **预编译性能**：将 Java 应用预编译为独立的二进制文件，使得二进制文件更小，启动速度可达到100倍。
- **资源高效**：比运行在Java虚拟机(JVM)上的应用程序使用更少的内存和CPU。
- **增强安全性**：
    - 减少应用的攻击面。
    - 从应用二进制文件中排除未使用的类、方法和字段。
    - 只在构建时限制反射和其他动态Java语言特性。
    - 不在运行时加载任何未知代码。
- **广泛支持**：受欢迎的微服务框架如 Spring Boot、Micronaut、Helidon 和 Quarkus，以及主流云平台都支持 GraalVM。
- **优化性能**：通过使用基于配置的优化和 G1 (优先回收) 垃圾收集器，可以获得更低的延迟和更好的峰值性能及吞吐量。
- **简便使用**：您可以像使用任何其他Java

### 快速开始
> [!info] 快速开始
> 
> === "windows"
>     ``` bash
>     ls
>     ```
> === "mac"
>     ```bash
>     ls
>     ```
> === "linux"
> ```bash
> ls
> ```

### 特性

### 工作原理

### 与SpringBoot3的关系

参考文档 [^1]

[^1]: https://www.graalvm.org/jdk17/docs/introduction/