---
created: 2023-04-27
category: 虚拟化
share: true
title: KVM (Kernel-based Virtual Machine)
---

Kernel-based Virtual Machine (KVM) is an open-source virtualization technology built into the Linux kernel. It enables a Linux system to act as a hypervisor, allowing it to run multiple, isolated virtual machines (VMs) simultaneously on a single host. KVM leverages hardware virtualization extensions, such as Intel VT-x and AMD-V, to provide efficient and high-performance virtualization.

KVM is capable of the following:

1.  Running multiple VMs: KVM can run multiple VMs concurrently, each with their own operating system (OS) and resources, on a single physical machine. This helps in efficient resource utilization and can save costs associated with running multiple physical servers.
    
2.  Supporting various guest OSes: KVM supports a wide range of guest operating systems, including various Linux distributions, Windows, and other Unix-based systems.
    
3.  Live migration: KVM allows live migration of running VMs between hosts with minimal downtime, which is useful for load balancing and maintenance purposes.
    
4.  Snapshot and cloning: You can create snapshots and clones of VMs for backup, testing, or deployment purposes.
    
5.  Dynamic resource allocation: KVM enables dynamic allocation and reallocation of resources such as CPU, memory, and storage to VMs, based on their needs.
    
6.  Scalability: KVM is highly scalable, supporting thousands of VMs running on large clusters.
    
7.  Security: KVM provides isolation between VMs, ensuring that one VM cannot access the resources or data of another VM. Additionally, KVM supports SELinux, a security feature that provides enhanced access control and security policies.
    
8.  Integration and management: KVM can be managed using various tools and interfaces, such as the command-line interface (CLI), graphical management tools like Virt-Manager, and web-based interfaces like oVirt or OpenStack.
    

KVM is widely used in various scenarios, including server consolidation, cloud computing, software development, and testing environments.

### Related to [[./QEMU.publisher|QEMU.publisher]]
QEMU (Quick Emulator) is an open-source machine emulator and virtualizer that plays a crucial role in the KVM ecosystem. While KVM provides the core virtualization infrastructure and processor-specific optimizations, QEMU provides hardware and device emulation, which allows KVM to support a wide range of guest operating systems and hardware configurations.

In a KVM system, QEMU has the following roles:

1.  Device emulation: QEMU emulates various devices, such as disk drives, network cards, graphics adapters, and input devices, that are required by the guest operating system. This allows the guest OS to run on a virtualized environment using the same drivers as it would on a physical machine.
    
2.  User-space component: QEMU acts as the user-space component of KVM virtualization, providing an interface between the KVM kernel module and the guest operating system. It is responsible for handling the I/O requests from the guest OS and translating them to operations on the host system.
    
3.  Binary translation: In situations where hardware virtualization extensions are not available or are disabled, QEMU can perform binary translation of guest code to run it directly on the host CPU. This approach is slower than hardware-assisted virtualization but enables virtualization on systems without hardware support.
    
4.  Virtual disk formats: QEMU supports various virtual disk formats, such as qcow2, raw, and VMDK, allowing you to choose the best format for your needs and to easily migrate virtual machines between different virtualization platforms.
    
5.  System emulation: Apart from its role in KVM, QEMU can also be used as a standalone emulator for various CPU architectures, such as x86, ARM, MIPS, and PowerPC, allowing you to run guest operating systems on different host platforms.
    

In summary, QEMU works in tandem with KVM to provide a complete virtualization solution. While KVM handles the low-level processor-specific virtualization, QEMU emulates the necessary hardware devices and manages the user-space interactions to create a functional virtual machine.


### Related to VT-x and AMD-V
VT-x and AMD-V are hardware-assisted virtualization technologies developed by Intel and AMD, respectively. These technologies provide extensions to the x86 architecture that improve the performance and efficiency of virtualization. They enable a hypervisor, such as KVM, to run multiple virtual machines (VMs) with better isolation, security, and performance compared to software-based virtualization.

VT-x (Intel Virtualization Technology) and AMD-V (AMD Virtualization) offer similar features, but their implementations are specific to each processor vendor. Some of the key features provided by these technologies include:

1.  Extended Page Tables (EPT) for Intel and Rapid Virtualization Indexing (RVI) for AMD: These features enable efficient handling of memory address translation for virtual machines, reducing the overhead associated with nested page table lookups.
    
2.  Virtual Machine Control Structure (VMCS) for Intel and Virtual Machine Control Block (VMCB) for AMD: These structures provide a way for the hypervisor to manage the state of a virtual machine, such as its CPU registers, memory mappings, and I/O devices.
    
3.  Virtual Machine Extensions (VMX) for Intel and Secure Virtual Machine (SVM) for AMD: These extensions introduce new instructions and control registers that allow the hypervisor to manage VMs efficiently. They include instructions for entering and exiting VMs, managing VM state, and handling VM-specific events, such as interrupts and exceptions.
    
4.  Input/Output Memory Management Unit (IOMMU): Both Intel (VT-d) and AMD (AMD-Vi) provide IOMMU support, which allows direct memory access (DMA) operations to be securely managed and isolated between virtual machines. This improves both performance and security in virtualized environments.
    

To use hardware-assisted virtualization, your processor must support VT-x or AMD-V, and the feature must be enabled in your system's BIOS or UEFI firmware. Most modern processors from Intel and AMD support these technologies, making them an essential component of efficient and high-performance virtualization solutions.

### Related to Hypervizor
A hypervisor, also known as a virtual machine monitor (VMM), is a software, firmware, or hardware component that enables virtualization by creating, running, and managing multiple virtual machines (VMs) on a single physical host. It allows multiple operating systems and their applications to share the host's hardware resources, such as CPU, memory, storage, and network interfaces, while maintaining isolation between the VMs.

There are two main types of hypervisors:

1. Type 1 or Bare-metal hypervisor: This type of hypervisor runs directly on the host's hardware without an underlying operating system. It has direct control over the hardware resources and provides virtualization services to the VMs. Examples of Type 1 hypervisors include VMware ESXi, Microsoft Hyper-V, and Citrix XenServer.

2. Type 2 or Hosted hypervisor: This type of hypervisor runs as a software application on top of an existing operating system (OS). It relies on the host OS to manage hardware resources and provide virtualization services to the VMs. Examples of Type 2 hypervisors include Oracle VirtualBox, VMware Workstation, and Parallels Desktop.

KVM (Kernel-based Virtual Machine) is a Type 1 hypervisor, as it is integrated into the Linux kernel and runs directly on the host's hardware. However, it also leverages some aspects of a Type 2 hypervisor, such as using QEMU for device emulation and working with the host OS for resource management.

Hypervisors are responsible for:

- Managing hardware resources: Hypervisors allocate and manage CPU, memory, storage, and network resources among the VMs running on the host.
- Providing VM isolation: Hypervisors ensure that VMs are isolated from one another, preventing one VM from accessing the resources or data of another VM.
- VM lifecycle management: Hypervisors create, start, stop, and delete VMs, as well as manage their configurations, such as CPU and memory allocations, storage, and network settings.
- Virtual machine migration: Hypervisors can move running VMs between hosts with minimal downtime, which is useful for load balancing, maintenance, and disaster recovery.

Hypervisors play a critical role in virtualization, enabling efficient resource utilization, consolidation of workloads, and the flexibility to run different operating systems and applications on the same physical hardware.

### Related to Virsh
When you use `virsh` to add a new network interface to a running VM, several steps occur behind the scenes to make the guest system aware of the new interface:

1.  Update the VM's configuration: First, the virtual machine's configuration is updated with the new network interface settings. This typically involves adding a new `<interface>` section to the VM's XML configuration file, specifying the type of network interface (e.g., bridge, NAT, or passthrough), the MAC address, and other relevant settings.
    
2.  Hotplug the new interface: The new network interface is then hotplugged into the running VM. Hotplugging refers to the process of adding or removing hardware components without stopping or restarting the system. In the case of KVM, `virsh` communicates with the libvirt library, which in turn interacts with the QEMU process responsible for emulating the VM's hardware. QEMU then emulates the new network interface and connects it to the specified virtual network.
    
3.  Notify the guest OS: The guest operating system is notified of the new hardware through a mechanism called "PCI hotplug" or "virtio hotplug," depending on the type of network interface being used. This triggers the guest OS to detect the new network interface as if it were physically added to a real machine.
    
4.  Initialize the new interface: The guest OS initializes the new network interface by loading the appropriate drivers and assigning it an available device name (e.g., eth1 or ens3). If the guest OS is configured to use DHCP, it will send out a request for an IP address on the new interface. Alternatively, you may need to configure the IP address and other network settings manually within the guest OS.
    
5.  Update guest networking: With the new network interface initialized and configured, the guest OS can now use it for network communication. Depending on the guest OS and its network configuration, you may need to adjust routing tables, firewall rules, or application settings to take advantage of the new interface.
    

To summarize, when you use `virsh` to add a new network interface to a running VM, the VM's configuration is updated, the interface is hotplugged into the VM, and the guest OS is notified to detect, initialize, and configure the new interface for use. This process relies on the cooperation between `virsh`, the libvirt library, QEMU, and the guest operating system to emulate and manage the new network interface dynamically.

`virsh` is a command-line interface (CLI) tool used to manage virtual machines and the underlying virtualization infrastructure, such as KVM and QEMU. It provides a way to interact with the hypervisor and perform various operations on virtual machines, such as creating, starting, stopping, and migrating them. `virsh` is built on top of the libvirt library, which provides a stable and consistent API for managing virtualization technologies across different platforms and hypervisors.

Here's how `virsh` works:

1. Communication with libvirt: When you execute a `virsh` command, it communicates with the libvirt daemon (libvirtd) through a well-defined API. This API abstracts the underlying virtualization technology, allowing you to manage virtual machines without dealing with the specific details of the hypervisor.

2. Hypervisor-specific operations: The libvirt library translates the API calls into hypervisor-specific operations. For example, when using KVM, the libvirt library communicates with the KVM kernel module and QEMU processes to execute the requested operations.

3. Interaction with the host system: `virsh` commands can also interact with the host system, allowing you to manage various aspects of the virtualization environment, such as network configurations, storage pools, and virtual networks.

Common operations you can perform with `virsh` include:

- Listing all virtual machines: `virsh list --all`
- Starting a virtual machine: `virsh start <vm_name>`
- Stopping a virtual machine: `virsh shutdown <vm_name>`
- Suspending a virtual machine: `virsh suspend <vm_name>`
- Resuming a suspended virtual machine: `virsh resume <vm_name>`
- Creating a new virtual machine from an XML configuration file: `virsh create <config_file>`
- Editing the configuration of a virtual machine: `virsh edit <vm_name>`
- Migrating a virtual machine to another host: `virsh migrate <vm_name> qemu+ssh://<destination_host>/system`
- Managing storage pools, volumes, and networks: `virsh pool-*`, `virsh vol-*`, and `virsh net-*` commands

`virsh` provides a powerful and flexible way to manage virtual machines and their underlying infrastructure. You can use it in combination with other tools and utilities, such as Virt-Manager or oVirt, to create a comprehensive virtualization management solution.