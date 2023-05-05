---
created: 2023-05-05
share: true
category: 经验
title: Java的一些最佳实践
---

### java.time
The `java.time` package, introduced in Java 8, is a modern and comprehensive library for handling dates and times. Here are some best practices for using the `java.time` package effectively:

1. Use `LocalDate`, `LocalTime`, and `LocalDateTime` for representing dates, times, and date-times without timezone information:

```java
LocalDate date = LocalDate.now(); // current date
LocalTime time = LocalTime.now(); // current time
LocalDateTime dateTime = LocalDateTime.now(); // current date-time
```

2. Use `ZonedDateTime` and `OffsetDateTime` for representing date-times with timezone information:

```java
ZoneId zone = ZoneId.of("America/New_York");
ZonedDateTime zonedDateTime = ZonedDateTime.now(zone); // current date-time in the specified timezone

OffsetDateTime offsetDateTime = OffsetDateTime.now(zone); // current date-time with a timezone offset
```

3. Use `Instant` for representing a single point in time, often used for timestamps:

```java
Instant now = Instant.now(); // current timestamp
```

4. For parsing and formatting dates and times, use `DateTimeFormatter`:

```java
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
String formattedDateTime = dateTime.format(formatter); // formats the LocalDateTime object as a string
LocalDateTime parsedDateTime = LocalDateTime.parse("2023-05-05 12:34:56", formatter); // parses a string to LocalDateTime object
```

5. Perform date and time arithmetic using the provided `plus` and `minus` methods:

```java
LocalDate tomorrow = date.plusDays(1);
LocalTime oneHourLater = time.plusHours(1);
LocalDateTime nextWeek = dateTime.plusWeeks(1);
```

6. Use `Period` and `Duration` for representing a range of time in terms of dates and times, respectively:

```java
Period oneMonth = Period.ofMonths(1);
Duration oneHour = Duration.ofHours(1);

LocalDate nextMonth = date.plus(oneMonth);
LocalDateTime dateTimeAfterOneHour = dateTime.plus(oneHour);
```

7. To compare dates and times, use the `isBefore`, `isAfter`, and `isEqual` methods:

```java
boolean isPast = dateTime.isBefore(LocalDateTime.now());
boolean isFuture = dateTime.isAfter(LocalDateTime.now());
boolean isNow = dateTime.isEqual(LocalDateTime.now());
```

8. When working with legacy code, convert between `java.util.Date` and `java.time` classes using the `toInstant` and `from` methods:

```java
// Convert java.util.Date to java.time.Instant
Date legacyDate = new Date();
Instant instant = legacyDate.toInstant();

// Convert java.time.Instant to java.util.Date
Date newLegacyDate = Date.from(instant);
```

Following these best practices will help you effectively use the `java.time` package to handle date and time operations in your Java applications.

#### Some Fun fact
Certainly! Here are some fun facts and useful information about the `java.time` package:

1. Inspired by Joda-Time: The `java.time` package was inspired by the popular Joda-Time library, which was widely used before Java 8. Stephen Colebourne, the creator of Joda-Time, also contributed to the development of `java.time`.

2. Part of JSR-310: The `java.time` package is part of the JSR-310 (Java Specification Request 310), which aimed to improve the Java Date and Time API. This led to the development of a more comprehensive and user-friendly date and time handling library.

3. Immutable objects: One of the key features of the `java.time` package is that its classes are immutable. This means that once an object is created, it cannot be modified. This design choice reduces the risk of bugs caused by shared mutable state and makes the API easier to reason about.

4. Fluent API: The `java.time` package offers a fluent API, which means that you can chain methods together in a more readable and expressive way. This makes it easier to perform complex operations on dates and times.

5. Built-in time zones and daylight saving time support: The `java.time` package comes with built-in support for time zones and daylight saving time. This makes it easy to work with different time zones and handle daylight saving time changes.

6. Leap years and leap seconds: The `java.time` package can handle leap years and leap seconds, ensuring that date and time calculations are accurate even when accounting for these irregularities.

7. Temporal adjusters: The `java.time` package includes a set of utility classes called temporal adjusters, which can be used to perform common date and time adjustments, like finding the first or last day of a month, the next or previous day of the week, and so on.

8. Interoperability with other date and time libraries: The `java.time` package can be easily used with other popular date and time libraries, such as the ThreeTen-Extra library, which provides additional date and time functionality not included in the core Java library.

9. Backport for Java 6 and 7: Although the `java.time` package was introduced in Java 8, there is a backport called ThreeTenABP available for Java 6 and 7. This backport allows developers using older Java versions to benefit from the improved date and time API.

1. ISO-8601 standard: The `java.time` package follows the ISO-8601 standard for date and time representations. This ensures consistency and interoperability with other systems and programming languages that also follow the standard.


### The deprecated SecurityManager
The `java.lang.SecurityManager` is a class in the Java Standard Library that allows you to define a custom security policy for your Java application. It is used to enforce restrictions on code that is executed within the Java Virtual Machine (JVM) and to protect sensitive resources, such as files, network connections, and system properties.

The SecurityManager acts as a central point for checking whether a specific operation is allowed or not, based on the current security policy. By default, Java applications do not have a SecurityManager installed, which means they have no security restrictions. However, you can define your own SecurityManager and install it using `System.setSecurityManager()` to enforce a custom security policy.

Here's an overview of what the SecurityManager does:

1. Permission checks: When a potentially sensitive operation is performed, such as file access or network connections, the SecurityManager checks if the operation is allowed according to the security policy. The security policy is defined using `java.security.Permission` objects and can be configured programmatically or by using a policy file.

2. Code source and protection domains: The SecurityManager associates code with a `java.security.CodeSource`, which includes information about where the code was loaded from (e.g., a JAR file or a network location) and any associated cryptographic signatures. This information is used to create a `java.security.ProtectionDomain`, which is a combination of a CodeSource and the set of Permissions granted to that code.

3. Stack inspection: When a security check is performed, the SecurityManager inspects the call stack to determine which ProtectionDomains are involved in the operation. It checks if all relevant ProtectionDomains have the necessary permissions to perform the operation. If any of them lack the required permissions, a `java.lang.SecurityException` is thrown, denying the operation.

4. Usage in applets and web start applications: The SecurityManager is often used in Java applets and Java Web Start applications to enforce strict security policies, protecting users from potentially malicious code.

5. Custom SecurityManager: You can extend the SecurityManager class and override its methods to implement custom security policies or to add additional logging and monitoring to your application.

Please note that the use of `SecurityManager` has declined in recent years due to the deprecation of Java applets and the increasing use of alternative security mechanisms, such as Java's modular system (introduced in Java 9) and containerization technologies. However, it remains a useful tool for enforcing security policies in certain scenarios.

#### Why deprecated
You're correct that the `SecurityManager` class has been deprecated in Java 17 (JEP 411). The primary reason for this deprecation is that the `SecurityManager` and its associated infrastructure have become less relevant with the evolution of the Java platform and the JVM ecosystem.

Some of the factors that contributed to the deprecation of `SecurityManager` include:

1. Reduced usage: The use of `SecurityManager` has declined significantly over the years, primarily due to the deprecation and eventual removal of applets and Java Web Start. These technologies relied heavily on the `SecurityManager` to enforce security policies. Modern Java applications tend to use different security mechanisms.

2. Complexity and performance overhead: The `SecurityManager` and its related infrastructure add complexity and performance overhead to the JVM. As the Java platform evolves, it is becoming more challenging to maintain backward compatibility and ensure the correctness of the `SecurityManager`.

3. Alternatives and enhancements: Newer enhancements to the Java platform, such as the Java module system (introduced in Java 9 with Project Jigsaw) and containerization technologies, provide alternative approaches to managing and securing code execution in the JVM.

While there isn't a direct replacement for the `SecurityManager`, some alternatives and complementary mechanisms can be used to enforce security policies in modern Java applications:

1. Java Module System: The module system, introduced in Java 9, allows you to encapsulate code and explicitly define the dependencies and exports of a module. This can help to limit the surface area of an application and prevent unauthorized access to sensitive code.

2. Containerization: Technologies like Docker and Kubernetes can be used to run Java applications in isolated environments with limited access to resources. This can help to enforce security boundaries and reduce the attack surface.

3. Fine-grained access control: For specific use cases, you can implement fine-grained access control in your application code, using custom checks and conditions based on your security requirements.

4. Platform-specific security mechanisms: Depending on the environment in which your Java application runs, you may be able to leverage platform-specific security mechanisms, such as operating system-level access controls and file permissions.

It is important to note that although the `SecurityManager` has been deprecated, it has not yet been removed from the JDK. The deprecation serves as a signal to developers that the `SecurityManager` will likely be removed in a future release and that they should consider using alternative security mechanisms for new applications.


### java.util.Collection
Here's the Java `java.util.Collection` interfaces and implementation hierarchy in a tree-like format:
```
.
├── Collection
│   ├── Set
│   │   ├── HashSet // A hash table-based implementation of the Set interface, allows null value, no guarantee of order
│   │   ├── LinkedHashSet // A hash table and linked list-based implementation, maintains insertion order
│   │   └── TreeSet // A sorted set implementation backed by a balanced binary search tree (Red-Black tree), does not allow null values
│   ├── Queue
│   │   ├── PriorityQueue // A priority-based unbounded queue based on a priority heap, elements are ordered according to their natural order or by a provided comparator
│   │   ├── ArrayDeque // A resizable-array based implementation of the Deque interface, can be used as a stack or queue
│   │   ├── LinkedList // A doubly-linked list-based implementation of the List and Deque interfaces, allows null values
│   │   └── ConcurrentLinkedQueue // A lock-free, thread-safe, linked list-based queue, suitable for high concurrency scenarios
│   ├── List
│   │   ├── ArrayList // A dynamic array-based implementation of the List interface, allows null values, provides fast random access
│   │   └── LinkedList // A doubly-linked list-based implementation of the List and Deque interfaces, allows null values
│   └── Deque
│       ├── ArrayDeque // A resizable-array based implementation of the Deque interface, can be used as a stack or queue
│       └── LinkedList // A doubly-linked list-based implementation of the List and Deque interfaces, allows null values
```

Note that this list is not exhaustive, and there are other specialized implementations and interfaces in the `java.util.concurrent` package, but this should give you a good overview of the core Collection hierarchy.
