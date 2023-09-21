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

GraalVM 可将您的 Java 应用程序预编译为独立的二进制文件。这些二进制文件更小，启动速度可快达100倍，无需预热即可提供最高性能，并且比运行在Java虚拟机(JVM)上的应用程序使用更少的内存和CPU。

GraalVM 减少了您应用的攻击面。它从应用二进制文件中排除了未使用的类、方法和字段。它只在构建时限制反射和其他动态Java语言特性。它在运行时不加载任何未知代码。

受欢迎的微服务框架，如 Spring Boot、Micronaut、Helidon 和 Quarkus，以及云平台如 Oracle Cloud Infrastructure、Amazon Web Services、Google Cloud Platform 和 Microsoft Azure 都支持 GraalVM。

通过使用基于配置的优化和 G1 (优先回收) 垃圾收集器，您可以获得更低的延迟，以及与运行在Java虚拟机(JVM)上的应用程序相当或更好的峰值性能和吞吐量。

您可以在您的IDE中像使用任何其他Java开发套件一样使用GraalVM JDK。

### 快速开始

=== tab1
    ffd
=== tab2
    ddf

### 特性

### 工作原理

### 与SpringBoot3的关系

参考文档 [^1]

[^1]: https://www.graalvm.org/jdk17/docs/introduction/