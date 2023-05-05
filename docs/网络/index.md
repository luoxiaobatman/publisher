---
created: 2023-05-05
share: true
category: 网络
title: index
---

> A leader is one who knows the way, goes the way, and shows the way.
> — <cite>John C. Maxwell</cite>

### Broadcast, Multicast, Unicast
In computer networking, there are different methods of communication based on the number of intended recipients for a specific message or packet. The primary communication types are unicast, multicast, and broadcast. Here's an overview of each:

1. Unicast:

Unicast is a one-to-one communication method where a message or packet is sent from one sender to a single recipient. The sender uses the recipient's unique IP address as the destination address for the message. In both IPv4 and IPv6 networks, unicast is the most common type of communication used for regular internet traffic, such as browsing websites, downloading files, or streaming videos.

2. Multicast:

Multicast is a one-to-many or many-to-many communication method in which a message or packet is sent from one or more senders to multiple recipients simultaneously. Instead of using unique IP addresses for each recipient, multicast utilizes a special range of IP addresses that represent multicast groups. Devices that are interested in receiving multicast traffic for a specific group join the corresponding multicast address.

Multicast is efficient for applications that need to transmit data to multiple recipients at once, such as streaming live video or audio, IPTV, or distributing software updates. It reduces network congestion and bandwidth consumption compared to unicast since the sender only needs to transmit a single copy of the message, which is then delivered to all recipients in the multicast group.

In IPv4, multicast addresses range from 224.0.0.0 to 239.255.255.255. In IPv6, multicast addresses start with the prefix ff00::/8.

3. Broadcast:

Broadcast is a one-to-all communication method where a message or packet is sent from one sender to all devices within a network segment or broadcast domain. In IPv4 networks, broadcast addresses are used to send messages that should be received by all devices within the domain, such as Address Resolution Protocol (ARP) requests or DHCP requests.

IPv4 broadcast addresses are formed by setting all host bits in the IP address to '1'. For example, in a network with the address 192.168.1.0/24, the broadcast address would be 192.168.1.255.

IPv6 does not support broadcast communication. Instead, it relies on multicast and anycast addressing for targeted and efficient communication. For tasks that previously used broadcast in IPv4, IPv6 uses specific multicast addresses, such as the all-nodes multicast address (ff02::1) or the solicited-node multicast address (ff02::1:ff00:0/104).

In summary, unicast is used for one-to-one communication, multicast for one-to-many or many-to-many communication, and broadcast for one-to-all communication within a network segment. These communication methods help facilitate different types of data transmission and optimize network resource usage.


#### Multicast range 224.0.0.0 to 239.255.255.255
The IP address range 224.0.0.0 to 239.255.255.255 is reserved for multicast communication in IPv4 networks. This range is known as the Class D address space, and it is specifically designated for multicast use. Using addresses outside of this range for multicast is not compliant with the IPv4 protocol and would not be recognized as multicast by network devices.

Multicast addresses within the 224.0.0.0 to 239.255.255.255 range are used to represent multicast groups rather than individual devices. When a sender transmits data to a multicast address, routers and switches forward the data to all devices that have joined the corresponding multicast group.

The multicast range can be further divided into sub-ranges with different purposes:

1. Local Network Control Block (224.0.0.0 to 224.0.0.255): These addresses are reserved for use within a local network segment and should not be forwarded by routers. Examples include 224.0.0.1 (all hosts on the same network segment) and 224.0.0.2 (all routers on the same network segment).

2. Internetwork Control Block (224.0.1.0 to 224.0.1.255): These addresses are used for applications that require multicast communication across the internet, such as the Network Time Protocol (NTP).

3. Source-Specific Multicast (SSM) Block (232.0.0.0 to 232.255.255.255): This range is used for Source-Specific Multicast, a type of multicast where receivers specify both the multicast group address and the source address of the sender.

4. Global Scope Block (233.0.0.0 to 233.255.255.255): These addresses, known as GLOP addresses, are used for globally unique multicast communication across the internet.

5. Other ranges within the Class D space are used for various purposes, such as provider and organization-local scope multicast addresses.

To summarize, the 224.0.0.0 to 239.255.255.255 range is reserved for multicast communication in IPv4 networks, and using other addresses for multicast would not be recognized as valid multicast traffic by network devices. This dedicated range ensures that multicast traffic can be efficiently processed and forwarded by routers and switches, optimizing network resource usage for multicast applications.


#### How to Join a multicast group
When a host wants to join a multicast group, it uses the Internet Group Management Protocol (IGMP) for IPv4 or Multicast Listener Discovery (MLD) for IPv6. These protocols allow hosts to communicate their interest in receiving multicast traffic for specific groups to their local routers, which then forward the multicast traffic accordingly. Here's an overview of the process for each protocol:

1. Internet Group Management Protocol (IGMP) for IPv4:

- The host sends an IGMP "Join" message (also known as a Membership Report) to its local router, indicating its interest in a specific multicast group. The message contains the multicast group address the host wants to join.
- The local router receives the IGMP Join message, updates its multicast group membership table, and starts forwarding multicast traffic for the specified group to the host.
- If the local router is not already a member of the multicast group, it sends an IGMP Join message upstream toward the multicast source (or a designated rendezvous point for shared tree multicast routing) to receive multicast traffic for that group.
- Periodically, the local router sends IGMP Query messages to verify the hosts' continued interest in the multicast group. Hosts that still want to receive traffic for the group respond with IGMP Membership Reports. If a host no longer wants to receive traffic for a group, it can either send an IGMP Leave message or simply not respond to the IGMP Query.

2. Multicast Listener Discovery (MLD) for IPv6:

- MLD is part of the IPv6 Neighbor Discovery Protocol (NDP) and operates similarly to IGMP for IPv4.
- The host sends an MLD "Join" message (MLD Listener Report) to its local router, indicating its interest in a specific multicast group. The message contains the multicast group address the host wants to join.
- The local router receives the MLD Join message, updates its multicast group membership table, and starts forwarding multicast traffic for the specified group to the host.
- If the local router is not already a member of the multicast group, it sends an MLD Join message upstream toward the multicast source (or a designated rendezvous point for shared tree multicast routing) to receive multicast traffic for that group.
- Periodically, the local router sends MLD Query messages to verify the hosts' continued interest in the multicast group. Hosts that still want to receive traffic for the group respond with MLD Listener Reports. If a host no longer wants to receive traffic for a group, it can either send an MLD Leave message (MLD Listener Done) or simply not respond to the MLD Query.

By using IGMP for IPv4 or MLD for IPv6, hosts can join multicast groups and inform their local routers about their interest in receiving multicast traffic. The routers then update their membership tables and forward multicast traffic to the appropriate hosts, ensuring efficient distribution of multicast data.


### Link layer
A link layer protocol is a set of rules that govern the communication between devices on a local network segment, also known as a data link layer in the OSI (Open Systems Interconnection) model. The data link layer is the second layer in the OSI model, sitting just above the physical layer and below the network layer. It is responsible for the reliable transmission of data frames between nodes on a network.

There are several key functions of link layer protocols, including:

1. Framing: The process of encapsulating data from the upper layers into data frames, which are the basic units of communication at the data link layer. Each frame typically contains a header, payload, and a trailer.

2. Physical addressing: Link layer protocols define the addressing scheme for devices on the local network, using MAC (Media Access Control) addresses. MAC addresses are unique 48-bit identifiers assigned to network interface cards (NICs).

3. Flow control: This mechanism ensures that a sender does not overwhelm a receiver with data by regulating the rate at which data is transmitted.

4. Error detection and correction: Link layer protocols use various techniques, such as checksums or cyclic redundancy checks (CRC), to detect and possibly correct errors that might occur during data transmission.

5. Access control: Protocols at the data link layer determine how devices on the local network can access the shared medium (e.g., Ethernet, Wi-Fi), using techniques such as CSMA/CD (Carrier Sense Multiple Access with Collision Detection) or CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance).

Some common examples of link layer protocols are:

1. Ethernet: A widely used wired networking technology that uses MAC addresses for device identification and CSMA/CD for access control.
2. Wi-Fi: A wireless networking technology based on the IEEE 802.11 standards, which also uses MAC addresses for device identification and CSMA/CA for access control.
3. PPP (Point-to-Point Protocol): A protocol commonly used in dial-up and broadband connections, allowing communication between two devices over a serial link.
4. HDLC (High-Level Data Link Control): A bit-oriented, synchronous data link layer protocol used in various communication networks, including telecommunication and radio systems.

These protocols and others enable the smooth and efficient communication of data between devices on local networks.

