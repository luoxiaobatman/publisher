---
created: 2023-05-04
share: true
category: 网络
title: IPV6
---

> Leave no stone unturned.
> — <cite>Euripides</cite>

### 简介
Internet Protocol version 6 (IPv6) is the most recent version of the Internet Protocol, which is the principal communications protocol used for relaying datagrams (packets) across a network. It was designed as an evolutionary upgrade to the Internet Protocol version 4 (IPv4) to address the exhaustion of available IPv4 addresses and improve upon its limitations.

Key features and improvements of IPv6 include:

1. Larger address space: IPv6 uses 128-bit addresses, providing a significantly larger address pool compared to the 32-bit addresses used in IPv4. This allows for virtually unlimited IP addresses, ensuring that there will be enough addresses for the rapidly growing number of internet-connected devices.

2. Simplified header format: IPv6 has a simplified header format, which streamlines packet processing by removing unnecessary fields and making the handling of packets more efficient.

3. Hierarchical addressing and routing infrastructure: IPv6 employs a hierarchical structure for addresses and routing, which reduces the size of routing tables and improves routing efficiency. This makes it easier to manage the growth of the internet and enables better scalability.

4. Improved support for extensions and options: IPv6 includes built-in support for optional extensions, such as new routing protocols or security features. This makes it easier to add new features and capabilities to the protocol as needed.

5. Enhanced multicast and anycast capabilities: IPv6 has improved support for multicast and anycast addressing, allowing for more efficient distribution of data to multiple destinations and better load balancing.

6. Stateless address autoconfiguration: IPv6 enables devices to automatically generate their own IP addresses without the need for a central server, making network configuration easier and more efficient.

7. Enhanced security: IPv6 includes built-in support for IPsec (Internet Protocol Security), which provides encryption and authentication for secure communications between devices. While IPsec is also available for IPv4, it is optional and not as seamlessly integrated as in IPv6.

8. Improved mobility and performance: IPv6 has better support for mobile devices and improves performance by reducing latency and enabling more efficient use of network resources.

Overall, IPv6 addresses many of the limitations and inefficiencies of IPv4, making it better suited for the continued growth and development of the internet. However, the transition to IPv6 has been slow due to the need for upgrades in hardware, software, and network infrastructure. Many devices and networks still rely on IPv4, often using transitional technologies that allow for communication between IPv4 and IPv6 systems.


### 和ipv4对比
IPv6 was designed to overcome the limitations of IPv4 and to provide a more scalable and efficient networking protocol. Here are the main differences between IPv4 and IPv6:

1. Address space: IPv4 uses 32-bit addresses, resulting in approximately 4.3 billion unique IP addresses. In contrast, IPv6 uses 128-bit addresses, providing a vastly larger address space of about 3.4 x 10^38 unique addresses. This difference helps to alleviate the IPv4 address exhaustion issue.

2. Address notation: IPv4 addresses are represented in dotted-decimal notation, with four decimal numbers separated by periods (e.g., 192.168.1.1). IPv6 addresses use a hexadecimal notation separated by colons, consisting of eight groups of four hexadecimal digits (e.g., 2001:0db8:85a3:0000:0000:8a2e:0370:7334).

3. Header structure: IPv6 has a simplified and fixed-length header format, which streamlines packet processing and improves efficiency. In contrast, IPv4 headers can have variable lengths and include more fields, which can slow down packet processing.

4. Fragmentation: In IPv4, routers can fragment packets if they are too large for the destination network. In IPv6, routers do not perform fragmentation; this is the responsibility of the source device, which uses Path MTU Discovery to determine the appropriate packet size.

5. Checksum: IPv4 headers include a checksum field, which needs to be recalculated at each hop, causing additional processing overhead. IPv6 headers do not include a checksum, relying instead on the lower-level link layer and transport layer protocols to handle error detection.

6. Address autoconfiguration: IPv6 supports stateless address autoconfiguration, allowing devices to generate their own IP addresses without the need for a central server like DHCP. This simplifies network configuration and management. While IPv4 has some autoconfiguration features, they are not as advanced or reliable as IPv6's.

7. Multicast and anycast support: IPv6 has improved support for multicast and anycast addressing, providing more efficient communication methods for group communication and load balancing. While IPv4 also supports multicast and anycast, the implementations are less efficient and less widely used.

8. Mobility and performance: IPv6 provides better support for mobile devices and improves performance through features like flow labeling and reduced latency.

9. Security: IPv6 has built-in support for IPsec, a security protocol providing encryption and authentication. While IPsec is available for IPv4, it is optional and not as seamlessly integrated as in IPv6.

Despite these improvements, the transition to IPv6 has been slow due to the need for upgrades in hardware, software, and network infrastructure. Many devices and networks still use IPv4, often relying on transitional technologies that enable communication between IPv4 and IPv6 systems.


#### 为什么要去掉Checksum
The Header Checksum field was removed in IPv6 for a few reasons, mainly to improve efficiency and reduce processing overhead in routers and other network devices:

1. Redundancy: Modern networking hardware (like Ethernet and Wi-Fi) and transport layer protocols (such as TCP and UDP) already include their own error-checking mechanisms. With these additional layers of error detection, the IPv6 header checksum was deemed redundant. By removing the checksum field, the designers of IPv6 aimed to reduce unnecessary processing without sacrificing the integrity of data transmission.

2. Performance: In IPv4, routers must recalculate the checksum at each hop because the Time to Live (TTL) field is decremented, which can impact router performance. By removing the checksum field in IPv6, routers no longer need to spend processing power on this task, allowing them to process packets more quickly and improving overall network performance.

3. Simplification: Eliminating the header checksum simplifies the IPv6 header structure, contributing to the overall goal of creating a more streamlined and efficient protocol. A simpler header format helps routers and other network devices process IPv6 packets more efficiently.

It is worth noting that removing the header checksum from IPv6 does not compromise data integrity, as the lower-level link layer and transport layer protocols still provide error detection and correction mechanisms. The designers of IPv6 felt that the performance and efficiency gains achieved by removing the checksum outweighed any potential risks.


### Hiarachical structure
IPv6 implements a hierarchical structure for addresses and routing through its address allocation and assignment scheme. This hierarchical approach enhances routing efficiency, aggregation, and scalability. IPv6 addresses are divided into several parts that reflect this hierarchical structure:

1. Global Routing Prefix: The first part of an IPv6 address is the Global Routing Prefix, which is assigned to organizations by regional internet registries (RIRs). This prefix identifies a specific organization's network on the global internet and typically consists of the first 48 bits of the address. The Global Routing Prefix helps routers determine the appropriate path to forward packets toward the destination network.

2. Subnet ID: The next part of the IPv6 address is the Subnet ID, which usually occupies the next 16 bits. Organizations can divide their network into multiple subnets by assigning different Subnet IDs. This level of hierarchy enables efficient routing within an organization's network by allowing routers to aggregate routes for multiple subnets under a single Global Routing Prefix.

3. Interface ID: The last 64 bits of an IPv6 address form the Interface ID, which uniquely identifies a network interface (e.g., a device) within a subnet. The Interface ID can be generated through various methods, including the use of the device's MAC address or stateless address autoconfiguration (SLAAC).

The hierarchical structure of IPv6 addresses enables routers to efficiently forward packets by aggregating routes based on the Global Routing Prefix and Subnet ID. This structure reduces the size of routing tables, making it easier for routers to find the best path to forward packets and allowing the internet to scale more effectively.

In addition to the hierarchical addressing structure, IPv6 also supports Provider Aggregatable (PA) and Provider Independent (PI) address spaces. PA addresses are allocated by internet service providers (ISPs) and follow the ISP's own address hierarchy, which further improves route aggregation and reduces the size of routing tables. PI addresses, on the other hand, are assigned directly by RIRs and do not depend on a specific ISP, providing more flexibility for organizations that require multihoming or change ISPs frequently.

The last 64 bits of an IPv6 address, often known as the "interface identifier", is usually derived from the MAC address of the network interface card (NIC). This is part of the Stateless Address Autoconfiguration (SLAAC) mechanism in IPv6.

Here is the general procedure to create a 64-bit interface identifier from a 48-bit MAC address:

1. Split the 48-bit MAC address into two 24-bit halves. For example, a MAC address "00:0a:95:9d:68:16" would be split into "00:0a:95" and "9d:68:16".

2. Insert the hexadecimal digits "FF:FE" between the two halves. This extends the MAC address from 48 bits to 64 bits. Using our example, the address would become "00:0a:95:ff:fe:9d:68:16".

3. In the first 8-bit section of the extended address, flip the bit in the seventh position (counting from 0). This is known as setting the "universal/local" (U/L) bit to indicate that this is a globally unique address. In our example, the "00" at the start becomes "02", making the final address "02:0a:95:ff:fe:9d:68:16".

Therefore, the last 64 bits of the IPv6 address will be "020a:95ff:fe9d:6816". This process is also known as EUI-64.

This method is used when creating IPv6 "link-local" addresses and also when auto-configuring "global" addresses. However, for privacy reasons, some operating systems randomize the interface identifier when creating global addresses, so this is not the only method to create the last 64 bits of an IPv6 address. 

Please note that not all the 128 bits are always used in the addressing; depending on the network setup, sometimes fewer bits are required. There are also different types of IPv6 addresses, such as unicast, multicast, and anycast addresses, each with their own structure and use cases.



### How a host get ipv6 address
An IPv6 host can obtain its IPv6 address using different methods. The two primary methods are Stateless Address Autoconfiguration (SLAAC) and Dynamic Host Configuration Protocol version 6 (DHCPv6). Here is an overview of both methods:

1. Stateless Address Autoconfiguration (SLAAC):

SLAAC allows IPv6 hosts to generate their own IPv6 addresses without relying on a central server. It's called "stateless" because no central server (like DHCP) keeps track of the assigned addresses. SLAAC involves the following steps:

- When a host connects to a network, it receives a Router Advertisement (RA) message from a local router. The RA message contains the network's prefix information, which typically consists of the first 64 bits of the IPv6 address.
- The host then generates the Interface ID, which is the last 64 bits of the IPv6 address. The Interface ID can be created using the host's MAC address and the EUI-64 format or through other methods, such as random number generation.
- The host combines the network prefix from the RA message with the generated Interface ID to form a complete IPv6 address. The host then checks for duplicate addresses on the network using the Neighbor Solicitation and Neighbor Advertisement messages in the Neighbor Discovery Protocol (NDP).
- If there is no duplicate address, the host configures the generated IPv6 address for its network interface.

2. Dynamic Host Configuration Protocol version 6 (DHCPv6):

DHCPv6 is similar to DHCP for IPv4, with a DHCPv6 server assigning IPv6 addresses and providing other network configuration information to hosts. DHCPv6 can work in stateful or stateless mode:

- Stateful DHCPv6: In this mode, the DHCPv6 server maintains a record of assigned IPv6 addresses and provides hosts with IPv6 addresses, DNS server information, and other network configuration details. The host sends a DHCPv6 Solicit message to request an IPv6 address from the server, which then assigns an available address and sends it to the host in a DHCPv6 Advertise message.
- Stateless DHCPv6: In this mode, the host generates its own IPv6 address using SLAAC, while the DHCPv6 server only provides additional network configuration information, such as DNS server addresses. This mode combines the benefits of SLAAC with the centralized management of network configuration details.

Both SLAAC and DHCPv6 can be used in the same network, depending on the desired level of control and management for IPv6 address assignment and network configuration.

Yes, just like IPv4, IPv6 addresses can also be assigned using the Dynamic Host Configuration Protocol (DHCP). The IPv6 version of the protocol is known as DHCPv6.

DHCPv6 can automatically assign

Yes, just like IPv4, IPv6 addresses can also be assigned using the Dynamic Host Configuration Protocol (DHCP). The IPv6 version of the protocol is known as DHCPv6.

DHCPv6 can automatically assign entire IPv6 addresses to clients, or it can assign network prefixes to routers, which can then assign the rest of the address locally. This is unlike IPv4 where DHCP only assigns full addresses to clients.

Additionally, DHCPv6 provides other network configuration information to clients as well, such as the addresses of DNS servers.

It's important to note, however, that unlike in IPv4 networks, where DHCP is often the primary means of address assignment, in IPv6 networks, address assignment can also be done via Stateless Address Autoconfiguration (SLAAC), where nodes assign themselves an address, or through a combination of DHCPv6 and SLAAC. The choice between DHCPv6, SLAAC, or a combination, can depend on the specific needs and design of the network.


### how human visit ipv6
You're right that IPv6 addresses are longer and more difficult to remember for humans compared to IPv4 addresses. However, the process of visiting a host remains user-friendly due to the Domain Name System (DNS), which translates human-readable domain names into IP addresses. 

When a user wants to visit a website or access a network resource, they typically enter the domain name (e.g., www.example.com) into their web browser or application instead of the IP address. The DNS then resolves the domain name to the corresponding IP address (either IPv4 or IPv6) and connects the user to the host.

Here's a brief overview of the process:

1. The user enters a domain name in the web browser or application.
2. The browser or application sends a DNS query to a DNS resolver, requesting the IP address associated with the domain name.
3. The DNS resolver checks its cache for the IP address. If it doesn't have the information, it contacts other DNS servers in a hierarchical manner (root servers, top-level domain servers, and authoritative name servers) until it finds the appropriate IP address.
4. The DNS resolver returns the IP address to the browser or application, which then uses the address to establish a connection to the host.

IPv6 also supports DNS, and modern DNS implementations can handle both IPv4 and IPv6 addresses. When a DNS query is made for a domain name, the DNS resolver will return the appropriate IP address based on the type of query:

- An "A" record query returns an IPv4 address.
- An "AAAA" record query (also known as a "quad-A" record) returns an IPv6 address.

Most modern browsers and applications are capable of performing both types of queries, and they can choose the appropriate IP address version based on the available network connectivity.

So, even though IPv6 addresses are longer and harder to remember, users don't need to interact with them directly. Instead, they can continue using easily memorable domain names, with the DNS handling the translation to IPv6 addresses behind the scenes.


### One more thing
Certainly! Here are a few interesting aspects of IPv6 that are worth mentioning:

1. Transition mechanisms: Given the slow adoption of IPv6, various transition mechanisms have been developed to enable communication between IPv4 and IPv6 networks. These mechanisms include dual-stack networks (supporting both IPv4 and IPv6), tunneling (encapsulating IPv6 packets within IPv4 packets), and translation (converting IPv6 packets to IPv4 packets and vice versa). These methods help facilitate the gradual transition from IPv4 to IPv6.

2. Privacy extensions: IPv6 introduced privacy extensions that enable hosts to use temporary, randomly generated IPv6 addresses for outgoing connections. This feature, known as "IPv6 Privacy Extensions" or "Temporary Addresses," helps protect user privacy by making it more difficult to track a device based on its IP address. Temporary addresses are used alongside stable, autoconfigured addresses, which are still employed for incoming connections and other network functions.

3. No more broadcast: IPv6 does not use broadcast messages, which are messages sent to all devices on a network. Instead, it relies on multicast and anycast addressing to target specific groups of devices or the nearest device, respectively. This change reduces network congestion and improves efficiency.

4. Larger payload: With IPv6's larger address space, the Maximum Transmission Unit (MTU) for IPv6 is also larger than that of IPv4. The minimum MTU for IPv6 is 1280 bytes, while the minimum for IPv4 is 576 bytes. This difference allows for the transmission of larger packets, improving network efficiency and performance.

5. Improved Quality of Service (QoS): The Flow Label field in the IPv6 header allows routers to identify and manage packets belonging to the same flow more easily. This feature enables better handling of real-time applications, such as video conferencing and online gaming, by providing improved QoS and reducing latency.

These interesting aspects of IPv6 showcase the improvements and innovations introduced with the new protocol, as well as the efforts to facilitate a smoother transition from IPv4 to IPv6. As more networks and devices adopt IPv6, its benefits will become increasingly apparent, leading to a more efficient and scalable internet.


### Header structure
Here's an ASCII representation of the IPv6 header:

```
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|Version| Traffic Class |           Flow Label                  |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|         Payload Length        |  Next Header  |   Hop Limit   |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                                                               +
|                                                               |
+                         Source Address                        +
|                                                               |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                                                               +
|                                                               |
+                      Destination Address                      +
|                                                               |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

Here's a brief explanation of each field in the IPv6 header:

- Version (4 bits): Indicates the IP version, which is 6 for IPv6.
- Traffic Class (8 bits): Used for Differentiated Services (DiffServ) and Explicit Congestion Notification (ECN). It helps define the priority and handling of the packet.
- Flow Label (20 bits): Used to identify and manage packets belonging to the same flow, which improves Quality of Service (QoS) for specific types of traffic.
- Payload Length (16 bits): Specifies the length of the payload (data) in bytes, not including the header.
- Next Header (8 bits): Indicates the type of header that immediately follows the IPv6 header. It can be a higher-layer protocol header (e.g., TCP or UDP) or an IPv6 extension header.
- Hop Limit (8 bits): Similar to the Time to Live (TTL) field in IPv4, it decrements by 1 at each hop. When the Hop Limit reaches 0, the packet is discarded.
- Source Address (128 bits): Specifies the IPv6 address of the originating host.
- Destination Address (128 bits): Specifies the IPv6 address of the destination host.

This representation provides a visual understanding of the IPv6 header structure, with each field having a specific purpose and function.

### SLAAC vs. DHCPv6
Both Stateless Address Autoconfiguration (SLAAC) and Dynamic Host Configuration Protocol version 6 (DHCPv6) are methods to assign IPv6 addresses to hosts in a network, but they operate under different paradigms and offer different capabilities, making them suitable for different scenarios.

**1. Stateless Address Autoconfiguration (SLAAC)**

SLAAC allows a device to generate its own IPv6 addresses using a combination of locally available information and information advertised by routers. In other words, a device using SLAAC doesn't require a server to obtain an IP address, making SLAAC simple and suitable for smaller networks or networks where IP address management isn't a significant concern.

Examples where SLAAC is suitable:

- **Small home networks**: These networks generally don't require complex management or tracking of which device has which IP address, and so the simplicity of SLAAC can be beneficial.
  
- **Ad-hoc networks**: In scenarios where a network needs to be quickly set up with minimal configuration, such as in emergency situations or temporary event setups, SLAAC can provide immediate network connectivity without the need for a DHCP server.

However, a key limitation of SLAAC is that it only provides network address and default gateway information. It does not convey other important network information such as DNS server addresses, domain search lists, or other DHCP options.

**2. Dynamic Host Configuration Protocol version 6 (DHCPv6)**

DHCPv6, on the other hand, allows for detailed control of IP address assignments and can provide hosts with additional configuration information, such as the addresses of DNS servers. DHCPv6 requires a DHCP server, and its IP address assignments can be static (always assigning the same address to a particular host) or dynamic (assigning addresses on-the-fly from a pool of addresses). This makes DHCPv6 more suitable for larger, more complex networks where central control and management of IP addresses are important.

Examples where DHCPv6 is suitable:

- **Large enterprise networks**: In these networks, administrators may want to maintain tight control over IP address assignments for security and management purposes. DHCPv6 allows for centralized management and control, making it the preferred choice.

- **ISP customers**: Internet Service Providers (ISPs) may want to assign specific IPv6 prefixes to customers. DHCPv6-PD (Prefix Delegation) is a method for assigning a block of IPv6 addresses to the customer's router, which can then further assign addresses to the devices on the customer's network.

**SLAAC vs DHCPv6: The Combined Approach**

In many cases, networks use a combined approach of SLAAC and DHCPv6 to take advantage of the strengths of both. For instance, a network could use SLAAC for address assignment and stateless DHCPv6 to provide additional information like DNS server addresses. 

The choice between SLAAC, DHCPv6, or a combination depends on the network's requirements, including the size and complexity of the network, the need for centralized control, and the importance of tracking IP address assignments.