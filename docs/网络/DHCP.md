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

