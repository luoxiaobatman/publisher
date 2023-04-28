---
created: 2023-04-27
share: true
category: 网络
title: DHCP协议
---


### Related to dhclient
When you run `dhclient` on a guest machine with a statically configured IP address, the behavior depends on the guest operating system's network configuration and the DHCP server settings on the virtual network.

In general, when you run `dhclient`, the network interface will send out a DHCP request to the connected virtual network. If a DHCP server is available on the virtual network, it will respond with an IP address lease and other network configuration details, such as the subnet mask, default gateway, and DNS servers. The guest operating system will then update the network interface settings according to the received DHCP lease.

There are a few possible outcomes in this scenario:

1. If the DHCP server is configured to provide the same static IP address that you initially assigned to the network interface (based on the MAC address or a client identifier), the IP address will not change after running `dhclient`.

2. If the DHCP server is configured to assign IP addresses dynamically, and the static IP address you initially configured is not reserved in the DHCP server, then running `dhclient` may result in the network interface receiving a different IP address from the DHCP server.

3. If no DHCP server is available on the virtual network or if it does not provide a lease for the network interface, the guest operating system may retain the statically configured IP address, or it may revert to an APIPA address (169.254.x.x) or another fallback address, depending on the guest OS's configuration.

In conclusion, after running `dhclient` on the guest machine, the network interface's IP address will depend on the DHCP server settings and the guest OS's network configuration. It might remain the same as the statically configured IP, receive a new IP address from the DHCP server, or fall back to a default address if no lease is obtained.

### 静态ip配置
I assume you are referring to a static network configuration file for a CentOS or RHEL-based system, as they use the `/etc/sysconfig/network-scripts/` directory for network interface configuration. Please note that the interface name might differ on your system (e.g., `ifcfg-eth0`, `ifcfg-ens3`). Here's a sample static configuration file for `/etc/sysconfig/network-scripts/ifcfg-en0`:

```
DEVICE=en0
TYPE=Ethernet
ONBOOT=yes
BOOTPROTO=static
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4
```

Here's a brief explanation of the parameters:

- `DEVICE`: The name of the network interface (e.g., en0, eth0, ens3).
- `TYPE`: The type of network interface (e.g., Ethernet, Wireless, etc.).
- `ONBOOT`: Whether to bring the interface up automatically at boot time. Set to "yes" to enable or "no" to disable.
- `BOOTPROTO`: The method used to obtain IP addressing information. Set to "static" for a static IP address configuration, "dhcp" for DHCP, or "none" to disable.
- `IPADDR`: The static IP address assigned to the network interface.
- `NETMASK`: The subnet mask associated with the IP address.
- `GATEWAY`: The default gateway or router IP address for the network interface.
- `DNS1` and `DNS2`: The primary and secondary DNS server addresses for the network interface.

After creating or modifying the configuration file, you need to restart the network service or bring down and up the interface for the changes to take effect. You can do this by running the following commands:

```
sudo systemctl restart network
```

Or:

```
sudo ifdown en0 && sudo ifup en0
```

Replace "en0" with the actual interface name on your system if necessary.


### 头部
Here is a simple ASCII art representation of the DHCP header structure:

```
 0                   1                   2                   3   
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
| Message Type | Hardware Type | Hw Addr Len |       Hops       |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                        Transaction ID                         |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|          Seconds           |              Flags               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                         Client IP Addr                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                          Your IP Addr                         |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                         Server IP Addr                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                        Gateway IP Addr                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                                                               +
|                                                               |
+                       Client Hardware Addr                    +
|                                                               |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                                                               +
|                                                               |
+                           Server Hostname                     +
|                                                               |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                                                               +
|                                                               |
+                            Boot Filename                      +
|                                                               |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
+                                                               +
|                                                               |
+                             Options                           +
|                                                               |
+                                                               +
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

If you want to present the DHCP header structure to your students, using a table or diagram can be an effective way to illustrate the fields and their sizes. Here's a simple table format you can use:

| Field                      | Size (bytes) | Description                                          |
|----------------------------|--------------|------------------------------------------------------|
| Message Type               | 1            | DHCP request or response                             |
| Hardware Type              | 1            | Hardware type (e.g., Ethernet)                       |
| Hardware Address Length    | 1            | Length of hardware address                           |
| Hops                       | 1            | Hops count for DHCP relay agents                     |
| Transaction Identifier     | 4            | Random number for matching requests and responses    |
| Seconds                    | 2            | Elapsed time since address acquisition began         |
| Flags                      | 2            | Flags for DHCP message (e.g., Broadcast flag)        |
| Client IP Address          | 4            | Client's IP address if known, otherwise 0           |
| Your IP Address            | 4            | IP address assigned to the client                    |
| Server IP Address          | 4            | IP address of the DHCP server                        |
| Gateway IP Address         | 4            | IP address of a gateway or relay agent, if applicable|
| Client Hardware Address    | 16           | Client's hardware (MAC) address                      |
| Server Hostname            | 64           | Optional server hostname                             |
| Boot Filename              | 128          | Optional boot file name                              |
| Options                    | Variable     | DHCP options with option-value pairs                 |


### Related to operating system
Various operating systems integrate with DHCP to obtain IP addresses and network configuration information automatically. The DHCP client software is typically built into the operating system or can be installed as an additional component. Here's an overview of how DHCP is used in some common operating systems:

1. Windows:
Windows operating systems, from Windows XP to Windows 11, have a built-in DHCP client. The client is enabled by default for network interfaces when you set the IP address configuration to "Obtain an IP address automatically" and "Obtain DNS server address automatically" in the network adapter settings. To access these settings:
   - Open Control Panel > Network and Sharing Center > Change adapter settings
   - Right-click on the network adapter, and select "Properties"
   - Double-click "Internet Protocol Version 4 (TCP/IPv4)" or "Internet Protocol Version 6 (TCP/IPv6)"
   - Choose the "Obtain an IP address automatically" and "Obtain DNS server address automatically" options

2. macOS:
macOS also has a built-in DHCP client. To enable DHCP for a network interface:
   - Open System Preferences > Network
   - Select the network interface (e.g., Ethernet or Wi-Fi) from the list on the left
   - In the "Configure IPv4" dropdown menu, select "Using DHCP" (or "Using DHCP with manual address" to set a static IP while still receiving other configuration information from DHCP)
   - Click "Apply" to save the changes

3. Linux:
Most Linux distributions use a DHCP client like dhclient, dhcpcd, or NetworkManager to handle DHCP. The process for enabling DHCP may vary depending on the distribution and the network management tool being used. For example, in Ubuntu with NetworkManager:
   - Open Settings > Network
   - Select the network interface (e.g., Ethernet or Wi-Fi)
   - Click the gear icon to open the settings for the selected interface
   - In the "IPv4" or "IPv6" tab, select "Automatic (DHCP)" as the method
   - Click "Apply" to save the changes

4. Android:
Android operating systems have a built-in DHCP client, which is enabled by default when connecting to Wi-Fi networks. To verify or change the settings:
   - Open Settings > Wi-Fi (or Connections > Wi-Fi, depending on the version)
   - Long press the connected network, and select "Modify network" or "Manage network settings"
   - Expand the "Advanced options" section
   - Make sure that "DHCP" is selected for the IP settings

5. iOS:
iOS devices have a built-in DHCP client that is enabled by default for Wi-Fi connections. To check or change the settings:
   - Open Settings > Wi-Fi
   - Tap the blue "i" icon next to the connected network
   - Ensure that "Automatic" (for iOS 10 and later) or "DHCP" (for earlier versions) is selected for the "Configure IP" option

In all these operating systems, the DHCP client is responsible for sending DHCP discovery messages, receiving offers from DHCP servers, and configuring the network interface with the assigned IP address and other network parameters. The integration with DHCP is usually seamless, and users typically do not need to worry about the underlying DHCP process once it is configured correctly.

### High Level Overview
Here's an ASCII art representation of a use case where a client obtains an IP address from a DHCP server through a switch and a router:

```
+-----------+     +------+     +--------+     +------+     +--------+
|  DHCP     |-----|Switch|-----| Router |-----|Switch|-----| Client |
|  Server   |     +------+     +--------+     +------+     +--------+
+-----------+                           ↑                     ↑
          DHCP Offer, Ack          DHCP Request           DHCP Discover
                                     (Relayed)               (Broadcast)
```

In this use case, the following steps occur:

1. The client (e.g., a computer) connects to the network and wants to obtain an IP address.
2. The client broadcasts a DHCP Discover message to the local network, which is received by the switch it is connected to.
3. The switch forwards the DHCP Discover message to all connected devices, including the router.
4. The router, acting as a DHCP relay agent, forwards the DHCP Discover message to the DHCP server on a different network segment.
5. The DHCP server receives the DHCP Discover message and checks its IP address pool for an available IP address.
6. The DHCP server sends a DHCP Offer message back to the router, offering an IP address and additional network configuration information to the client.
7. The router forwards the DHCP Offer message to the switch connected to the client.
8. The switch forwards the DHCP Offer message to the client.
9. The client receives the DHCP Offer and sends a DHCP Request message to the router, requesting the offered IP address and configuration information.
10. The router forwards the DHCP Request message to the DHCP server.
11. The DHCP server receives the DHCP Request and sends a DHCP Ack message back to the router, acknowledging the client's request and confirming the IP address assignment.
12. The router forwards the DHCP Ack message to the switch connected to the client.
13. The switch forwards the DHCP Ack message to the client.
14. The client receives the DHCP Ack message, configures its network interface with the assigned IP address and network parameters, and is now connected to the network.

Please note that this ASCII art diagram is a simplification of the DHCP process and is intended to provide a high-level understanding of the steps involved. For more detailed explanations, consider using text descriptions or creating a flowchart to illustrate the process.