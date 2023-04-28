---
created: 2023-04-28
share: true
category: 网络
title: BGP
---

%%
> No one has a finer command of language than the person who keeps his mouth shut.
> — <cite>Sam Rayburn</cite>
%%

### Overview
The Border Gateway Protocol (BGP) is a standardized exterior gateway protocol designed to exchange routing and reachability information between autonomous systems (ASes) on the Internet. BGP is classified as a path-vector routing protocol, and its primary function is to maintain the stability of the Internet routing system and prevent routing loops. It was first introduced in 1989 and has evolved over time. The current version is BGP-4, defined in RFC 4271.

BGP routers, also known as BGP speakers, establish connections with their neighboring routers using a reliable transport protocol, typically TCP (Transmission Control Protocol), over port 179. BGP routers exchange routing information using BGP messages, including OPEN, UPDATE, KEEPALIVE, and NOTIFICATION messages. 

Some key features of BGP are:

1. Autonomous system (AS) support: BGP routers belong to an autonomous system, which is a collection of IP networks and routers under the control of a single organization. Each AS has a unique 16-bit or 32-bit AS number assigned by a global authority such as the Internet Assigned Numbers Authority (IANA).

2. Path-vector routing: BGP routers exchange routing information in the form of Network Layer Reachability Information (NLRI), which contains the destination prefix and its associated attributes. The most important attribute is the AS_PATH, which is a sequence of AS numbers representing the path taken by the route advertisement.

3. Policy-based routing: BGP allows network administrators to implement routing policies based on various attributes, such as AS_PATH, origin, local preference, and Multi-Exit Discriminator (MED), to influence the selection of the best route to a destination.

4. Route aggregation and de-aggregation: BGP enables routers to aggregate or summarize multiple prefixes into a single advertisement, reducing the size of the global routing table. Conversely, de-aggregation allows more specific routes to be advertised when needed.

5. Loop prevention: BGP uses the AS_PATH attribute to prevent routing loops. If a router receives a route advertisement containing its own AS number in the AS_PATH, it will discard the advertisement.

6. Route dampening: BGP can detect and suppress unstable routes that frequently oscillate between available and unavailable states, reducing the impact of route flapping on the network.

BGP is an essential protocol for the stability and scalability of the Internet. However, it has some limitations, such as its reliance on manual configuration, slow convergence times, and susceptibility to misconfigurations and malicious attacks. Several enhancements and security mechanisms have been proposed to address these challenges, including BGPsec, RPKI (Resource Public Key Infrastructure), and prefix filtering.


#### Autonomous system
An Autonomous System (AS) is a collection of IP networks and routers under the control of a single organization that presents a common and clearly defined routing policy to the Internet. An AS can consist of one or multiple IP networks and can be connected to other ASes. These connections enable the exchange of routing information between them, allowing for end-to-end communication across the Internet.

Each AS is assigned a unique number, called the Autonomous System Number (ASN), which is either a 16-bit or a 32-bit integer. The Internet Assigned Numbers Authority (IANA) is responsible for allocating ASNs to organizations. When two ASes establish a connection, it's called an inter-domain connection, and the routing protocol used to exchange routing information between them is usually the Border Gateway Protocol (BGP).

In summary, an Autonomous System is a unit of routing policy and a way to group networks and routers under a single administrative domain, allowing for better management and control over routing policies.

##### how to get an AS
Acquiring an Autonomous System (AS) involves obtaining an Autonomous System Number (ASN) and IP address space. Here is a step-by-step guide to help you acquire an AS:

1. Determine your eligibility: To acquire an AS, you should be a network operator, such as an Internet Service Provider (ISP), a large organization with a complex network infrastructure, or a company that requires multi-homing for redundancy and performance reasons.

2. Obtain IP address space: You will need a block of IP addresses to use within your AS. You can request IP addresses directly from a Regional Internet Registry (RIR) or lease them from an existing IP address holder. There are five RIRs responsible for managing IP address allocations in different regions:

   - African Network Information Centre (AFRINIC) for Africa
   - American Registry for Internet Numbers (ARIN) for North America
   - Asia-Pacific Network Information Centre (APNIC) for the Asia-Pacific region
   - Latin America and Caribbean Network Information Centre (LACNIC) for Latin America and the Caribbean
   - Réseaux IP Européens Network Coordination Centre (RIPE NCC) for Europe, the Middle East, and parts of Central Asia

3. Request an ASN: Apply for an ASN from the RIR that serves your region. You will need to provide information about your network, such as its topology, the reason for needing an ASN, and your plans for using the AS. The RIR will evaluate your application and, if approved, will assign you a unique ASN. Note that you may be assigned a 16-bit or a 32-bit ASN, depending on the RIR's policies and the availability of ASNs.

4. Set up BGP: Configure your routers to support the Border Gateway Protocol (BGP), the standard routing protocol used to exchange routing information between ASes. BGP configuration will require specifying your ASN, the ASNs of your neighbors (such as upstream providers or peers), and your routing policies.

5. Establish BGP sessions: Create BGP sessions with your neighbors, such as other ASes or ISPs, to exchange routing information. This typically involves coordinating with the network administrators of your neighboring ASes and agreeing on policies for exchanging routes and traffic.

6. Announce your IP prefixes: Advertise your IP address space to your BGP neighbors using BGP UPDATE messages. This ensures that other networks can reach your AS and its associated IP addresses.

7. Register your AS and routing information: Update the appropriate Internet Routing Registry (IRR) or Routing Policy Specification Language (RPSL) databases with information about your AS, its associated IP address space, and your routing policies. This helps other network operators understand your routing intentions and facilitates troubleshooting and coordination.

8. Maintain and monitor your AS: Regularly monitor and maintain your AS to ensure its proper functioning. This includes monitoring BGP sessions, tracking routing table changes, and responding to network events or outages.

By following these steps, you can acquire an AS, set up BGP, establish BGP sessions with your neighbors, and participate in the global Internet routing system.

#### Path-vector routing
Path-vector routing is a network routing protocol that maintains the path information needed to reach a destination in the form of a sequence of autonomous systems (ASes) traversed by a route advertisement. BGP is an example of a path-vector routing protocol.

When a BGP router receives a route advertisement from a neighboring router, it appends its own ASN to the AS_PATH attribute of the route. The AS_PATH attribute thus represents the sequence of ASes traversed by the route advertisement from its origin to the receiving router. BGP routers use the AS_PATH information to prevent routing loops and determine the best path to a destination based on policy decisions.

A path-vector routing protocol allows network administrators to implement complex routing policies based on various attributes, such as the length of the AS_PATH, origin of the route, and other custom-defined preferences. This offers more flexibility and control over routing decisions compared to distance-vector or link-state routing protocols, which primarily rely on metrics like hop count or link cost.

In summary, path-vector routing is a routing protocol mechanism that maintains the path information (in the form of ASes) traversed by route advertisements, enabling policy-based routing decisions and loop prevention.


### Advertizing process
Here's a detailed, step-by-step example of a route advertisement process using the Border Gateway Protocol (BGP) between two autonomous systems (ASes):

1. Establishing BGP session:
   Two BGP routers, Router A in AS 100 and Router B in AS 200, establish a BGP session. They will first establish a TCP connection (typically over port 179) and then exchange OPEN messages to negotiate BGP session parameters.

2. Exchanging routing information:
   Router A has a network prefix, 192.168.1.0/24, that it wants to advertise to Router B. Router A sends an UPDATE message containing the Network Layer Reachability Information (NLRI) for this prefix, which includes the destination prefix itself (192.168.1.0/24) and its associated attributes, such as AS_PATH and NEXT_HOP. Initially, the AS_PATH is empty, and the NEXT_HOP is set to Router A's IP address.

3. Processing received advertisement:
   Router B receives the UPDATE message and processes the NLRI. It adds AS 100 to the AS_PATH attribute, updates the NEXT_HOP attribute to its own IP address, and stores the route in its BGP routing table.

4. Propagating the advertisement:
   If Router B has other BGP neighbors, it may propagate the route advertisement further. Before doing so, Router B will add its own ASN (AS 200) to the AS_PATH attribute and set the NEXT_HOP attribute to its own IP address.

5. Best path selection:
   When a BGP router receives multiple route advertisements for the same prefix, it will select the best path based on a set of predefined criteria, such as the shortest AS_PATH, highest local preference, lowest Multi-Exit Discriminator (MED), and so on. The selected best path is then installed in the router's routing table.

6. Routing table updates:
   Router B installs the route advertisement for the 192.168.1.0/24 prefix into its routing table, with the updated AS_PATH (100, 200) and NEXT_HOP attributes. The routing table now contains the necessary information for Router B to forward packets to the 192.168.1.0/24 network.

7. Forwarding traffic:
   With the route advertisement in place, Router B can now forward traffic destined for the 192.168.1.0/24 network towards Router A. The traffic will traverse AS 200 and AS 100 to reach its destination.

8. Maintaining the BGP session:
   Router A and Router B periodically exchange KEEPALIVE messages to maintain their BGP session. If either router detects a failure in the BGP session or the underlying TCP connection, they will send a NOTIFICATION message to their BGP neighbor and tear down the BGP session.

In this example, the route advertisement process starts with establishing a BGP session, proceeds through exchanging routing information, processing and propagating the advertisement, selecting the best path, and updating the routing table, and finally enables forwarding of traffic to the advertised destination. Throughout this process, the BGP routers maintain their sessions by exchanging KEEPALIVE messages.

### Forwarding process
Here's a detailed, step-by-step explanation of how Router B forwards packets to the 192.168.1.0/24 network after receiving the route advertisement from Router A:

1. Receiving a packet:
   Router B receives a packet from a host or another router within its AS, destined for an IP address within the 192.168.1.0/24 network (e.g., 192.168.1.15).

2. Consulting the routing table:
   Router B consults its routing table to determine the best path to forward the packet to the destination. The routing table contains an entry for the 192.168.1.0/24 network, which was added when Router A advertised the route. The routing table entry includes the NEXT_HOP attribute, which points to Router A's IP address.

3. Determining the outbound interface:
   Router B uses its local interface table to determine the outbound interface that corresponds to the NEXT_HOP attribute. This is the interface connected to the link between Router B and Router A.

4. Encapsulating the packet:
   Router B encapsulates the packet with the appropriate Layer 2 (data link layer) header for the outbound interface. This header includes the source and destination MAC addresses, which correspond to the interface MAC addresses of Router B and Router A, respectively.

5. Transmitting the packet:
   Router B transmits the packet on the outbound interface, sending it over the link towards Router A.

6. Receiving and processing the packet at Router A:
   Router A receives the packet, strips the Layer 2 header, and examines the IP header to determine the destination address (192.168.1.15). Router A then consults its own routing table to identify the best path and the corresponding outbound interface to forward the packet to the destination.

7. Forwarding the packet within AS 100:
   Router A forwards the packet within AS 100, either directly to the destination host (if it is directly connected) or to another router within AS 100. The packet may traverse multiple routers within AS 100 before reaching its final destination.

8. Delivering the packet to the destination host:
   When the packet reaches the final router within AS 100, it is forwarded to the destination host (192.168.1.15) on the 192.168.1.0/24 network.

In summary, Router B forwards packets to the 192.168.1.0/24 network by consulting its routing table, determining the appropriate outbound interface, encapsulating the packet with the correct Layer 2 header, and transmitting the packet towards Router A. Router A and other routers within AS 100 continue to process and forward the packet until it reaches its final destination.

### Why use BGP
Cloud providers and large companies utilize BGP for several reasons. BGP is a crucial component of the Internet's routing infrastructure and offers the necessary features and scalability required by these organizations. Some of the main reasons for using BGP are:

1. Inter-domain routing: BGP is the de facto standard for exchanging routing information between different autonomous systems (ASes) on the Internet. Cloud providers and large companies operate their own ASes and need to exchange routing information with other networks (such as ISPs or other cloud providers) to ensure end-to-end connectivity.

2. Policy-based routing: BGP enables organizations to implement complex routing policies based on various attributes, such as the AS_PATH, local preference, and Multi-Exit Discriminator (MED). This allows network administrators to have fine-grained control over route selection, traffic engineering, and load balancing.

3. Scalability: BGP is designed to handle large numbers of routes and maintain stability in an ever-growing global routing table. Cloud providers and large companies often have thousands or even millions of IP addresses under their management. BGP's ability to handle this scale is essential for their operations.

4. Route aggregation and de-aggregation: BGP allows routers to aggregate or summarize multiple prefixes into a single advertisement, reducing the size of the global routing table. Conversely, de-aggregation allows more specific routes to be advertised when needed. This helps cloud providers and large companies manage their routing information more efficiently and reduce the burden on the Internet's routing system.

5. Multi-homing: BGP enables organizations to establish connections with multiple ISPs or upstream providers for redundancy and improved network performance. This is crucial for cloud providers and large companies, as they need to ensure high availability and resilience for their services.

6. Traffic engineering: BGP's rich set of attributes and policy-based routing capabilities enable cloud providers and large companies to optimize their network performance by directing traffic over preferred paths, balancing load across multiple links, and avoiding congested or unreliable routes.

7. Integration with other technologies: BGP can be used in conjunction with other networking technologies, such as MPLS and SD-WAN, to build more advanced and flexible network architectures. This allows cloud providers and large companies to tailor their networks to meet specific requirements, such as supporting private or hybrid cloud environments.

In summary, cloud providers and large companies rely on BGP because of its ability to handle inter-domain routing, support policy-based routing, scale to large numbers of routes, enable route aggregation and de-aggregation, provide multi-homing capabilities, support traffic engineering, and integrate with other networking technologies. These features are essential for maintaining the stability, performance, and flexibility of their networks.