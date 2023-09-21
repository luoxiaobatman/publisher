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

### 先说总结

GraalVM 为部署和运行 Java 应用程序提供了一种新方法。与 Java 虚拟机相比，Native Image可以使用更小的内存占用并具有更快的启动时间。它们非常适合使用容器部署的应用程序，并且与“函数即服务”（FaaS）平台结合使用有极其优秀的表现。GraalVM Native Image 是一个完整的、特定于平台的可执行文件。不需要提供 Java 虚拟机。

> [!info] 与JVM应用程序的差异
> - 在构建时对应用程序进行静态分析。
> - 在创建Native Image时无法访问的代码将被移除，不会成为可执行文件的一部分。
> - GraalVM 对代码的动态元素并不直接了解，必须被告知有关反射、资源、序列化和动态代理的信息。
> - 应用程序的类路径在构建时固定，不能更改。
> - 没有懒加载类，可执行文件中的所有内容在启动时都将被加载到内存中。
> - 对于一些 Java 应用程序的某些方面存在一些限制。

> [!success] 使用 GraalVM 的好处：
> - **提升启动速度**：将 Java 应用预编译为独立的二进制文件，使得二进制文件更小，启动速度可达到100倍。
> - **资源高效**：比运行在Java虚拟机(JVM)上的应用程序使用更少的内存和CPU。
> - **增强安全性**：
>     - 减少应用的攻击面。
>     - 从应用二进制文件中排除未使用的类、方法和字段。
>     - 只在构建时限制反射和其他动态Java语言特性。
>     - 不在运行时加载任何未知代码。
> - **广泛支持**：受欢迎的微服务框架如 Spring Boot、Micronaut、Helidon 和 Quarkus，以及主流云平台都支持 GraalVM。
> - **优化性能**：通过使用基于配置的优化和 G1 (优先回收) 垃圾收集器，可以获得更低的延迟和更好的峰值性能及吞吐量。
> - **简便使用**：您可以像使用任何其他Java


### 快速开始

> [!info] 环境准备
> 
> === "windows"
>     参考:
>     https://www.graalvm.org/jdk17/docs/getting-started/windows/
>     需要安装Visual Studio, 配置好一些列环境变量, 具体参考
> === "mac"
>     参考:
>     https://www.graalvm.org/jdk17/docs/getting-started/macos/
>     ```bash
>     xcode-select --install
>     ```
> === "linux"
>     参考:
>     https://www.graalvm.org/jdk17/docs/getting-started/linux/
>     ```bash
>     # 使用YUM包管理器
>     sudo yum install gcc glibc-devel zlib-devel
>     # Ubuntu 使用apt-get
>     sudo apt-get install build-essential libz-dev zlib1g-dev
>     # DNF
>     sudo dnf install gcc glibc-devel zlib-devel libstdc++-static
>     ```
> 准备好环境后, 就可以去[下载GraalVM](https://www.graalvm.org/downloads/)    


编写HelloWorld
```java
public class HelloWorld {
  public static void main(String[] args) {
    System.out.println("Hello, World!");
  }
}
```

编译,执行
```bash
javac HelloWorld.java
native-image HelloWorld

# 打印Hello, World!
./helloworld
```

### 特性

#### 什么是Native Image

Native Image可以提前将 Java 代码编译成二进制文件——一个本地可执行程序。仅包括运行时所需的代码，即应用程序类、标准库类、语言运行时以及来自 JDK 的静态链接的本地代码。

使用 Native Image 生成的可执行文件具有几个重要的优点：

- 运行成本更低, 只需 Java 虚拟机所需资源的一小部分。
- 在毫秒内启动。
- 立即提供峰值性能，无需预热。
- 可被打包成轻量级的容器镜像，便于快速、高效地部署。
- 减少攻击面。

可执行文件是由 Native Image 构建器或 `native-image` 工具创建，该工具为特定的操作系统创建一个二进制文件。首先，`native-image` 工具对您的代码进行静态分析，以确定在应用程序运行时可达的类和方法。

`native-image` 工具可用于构建本地可执行程序（默认）或本地共享库。

### 工作原理

Native Image 接受 Java 字节码作为输入，产生一个独立的二进制文件（一个可执行程序或一个共享库）。在生成二进制文件的过程中，Native Image 可以运行用户代码。最后，Native Image 将编译过的用户代码、Java 运行时的部分内容（例如，垃圾收集器、线程支持等）以及代码执行的结果链接到二进制文件中。

这个二进制文件称为原生可执行程序或Native Image。将生成这个二进制文件的工具称为 native-image 构建器或 native-image 生成器。

为了清楚地区分在Native Image构建期间执行的代码和在Native Image执行期间执行的代码，称这两者之间的差异为构建时(buildtime)和运行时间时(runtime)。

为了生成一个最小的图像，Native Image 还使用一个称为静态分析的过程。

#### 构建时和运行时

```java
public class HelloWorld {
    static class Greeter {
        static {
            System.out.println("Greeter is getting ready!");
        }
        
        public static void greet() {
          System.out.println("Hello, World!");
        }
    }

  public static void main(String[] args) {
    Greeter.greet();
  }
}
```

```
javac HelloWorld.java
java HelloWorld 
Greeter is getting ready!
Hello, World!
```

```
native-image HelloWorld
========================================================================================================================
GraalVM Native Image: Generating 'helloworld' (executable)...
========================================================================================================================
...
Finished generating 'helloworld' in 14.9s.
./helloworld 
Greeter is getting ready!
Hello, World!
```

```
native-image HelloWorld --initialize-at-build-time=HelloWorld\$Greeter
========================================================================================================================
GraalVM Native Image: Generating 'helloworld' (executable)...
========================================================================================================================
Greeter is getting ready!
[1/7] Initializing...                                                                                    (3.1s @ 0.15GB)
 Version info: 'GraalVM dev Java 11 EE'
 Java version info: '11.0.15+4-jvmci-22.1-b02'
 C compiler: gcc (linux, x86_64, 9.4.0)
 Garbage collector: Serial GC
...
Finished generating 'helloworld' in 13.6s.
./helloworld 
Hello, World!
```

#### 图像堆
包括:
- 在图像构建期间创建的、从应用程序代码可达的对象。
- 在Native Image中使用的类的 `java.lang.Class` 对象。
- 嵌入在方法代码中的对象常量。

当Native Image二进制启动时，会从二进制文件复制初始的图像堆。

举个例子
```java
class Example {
    private static final String message;
    
    static {
        message = System.getProperty("message");
    }

    public static void main(String[] args) {
        System.out.println("Hello, World! My message is: " + message);
    }
}
```

```
native-image Example --initialize-at-build-time=Example -Dmessage=native
================================================================================
GraalVM Native Image: Generating 'example' (executable)...
================================================================================
...
Finished generating 'example' in 19.0s.
./example 
Hello, World! My message is: native
```


#### 静态分析

静态分析是一个确定应用程序使用哪些程序元素（如类、方法和字段）的过程。这些元素也被称为可达代码。分析本身有两个部分：

1. 扫描一个方法的字节码，以确定从它可以达到哪些其他元素。
2. 扫描Native Image堆中的根对象（即静态字段）以确定从它们可以达到哪些类。它从应用程序的入口点开始（即主方法）。新发现的元素被迭代地扫描，直到进一步的扫描不再产生元素的可达性中的额外变化。

只有可达的元素会被包含在最终的图像中。一旦构建了一个Native Image，在运行时就不能再添加新的元素，例如，通过类加载添加新的元素。我们将这个约束称为封闭世界假设(1)。
{ .annotate }

1. 封闭世界假设（CWA），在用于知识表示的逻辑正式系统中，是假定一个为真的陈述也被认为是真的。因此，反之，当前不被认为是真的东西，就是假的。这个名称还指的是Raymond Reiter对这一假设的逻辑形式化。封闭世界假设的反面是开放世界假设（OWA），它声明缺乏知识并不意味着是假的。CWA与OWA之间的决策确定了使用相同概念符号的概念表达的实际语义的理解。成功地形式化自然语言语义通常不能避免明确揭示其隐含的逻辑背景是基于CWA还是OWA。[^4]


### SpringBoot3一起使用



#### 快速开始

```java
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class MyApplication {

    @RequestMapping("/")
    String home() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        SpringApplication.run(MyApplication.class, args);
    }

}
```

> [!info] maven构建docker镜像
> 
> ```xml
> <parent>
>     <groupId>org.springframework.boot</groupId>
>     <artifactId>spring-boot-starter-parent</artifactId>
>     <version>3.1.3</version>
> </parent>
> 
> <plugin>
>     <groupId>org.graalvm.buildtools</groupId>
>     <artifactId>native-maven-plugin</artifactId>
> </plugin>
> ```
> 
> ```
> mvn -Pnative spring-boot:build-image
> docker run --rm -p 8080:8080 docker.io/library/myproject:0.0.1-SNAPSHOT
> ```

#### 第三方库的问题

GraalVM Native Image是一种不断发展的技术，并不是所有的第三方库都提供了支持。对于那些没有自行提供可达性元数据的开源项目来说, GraalVM 社区正在通过为努力提供可达性元数据来帮助它们支持GraalVM。但依靠社区的力量, 并不能很好地解决第三方库的问题，Spring 本身也不包含针对第三方库的提示，而是依赖可达性元数据项目。


参考文档 [^1]

[^1]: https://www.graalvm.org/jdk17/docs/introduction/
[^2]: springboot3中关于graalVM的介绍
[^3]: 一些博文
[^4]: [封闭世界假设wiki](https://en.wikipedia.org/wiki/Closed-world_assumption)
[^5]: [SpringBoot GraalVM 支持](https://docs.spring.io/spring-boot/docs/current/reference/html/native-image.html)