---
created: 2023-04-27
category: 虚拟化
share: true
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

### Related to [[../../QEMU.publisher|QEMU.publisher]]
QEMU (Quick Emulator) is an open-source machine emulator and virtualizer that plays a crucial role in the KVM ecosystem. While KVM provides the core virtualization infrastructure and processor-specific optimizations, QEMU provides hardware and device emulation, which allows KVM to support a wide range of guest operating systems and hardware configurations.

In a KVM system, QEMU has the following roles:

1.  Device emulation: QEMU emulates various devices, such as disk drives, network cards, graphics adapters, and input devices, that are required by the guest operating system. This allows the guest OS to run on a virtualized environment using the same drivers as it would on a physical machine.
    
2.  User-space component: QEMU acts as the user-space component of KVM virtualization, providing an interface between the KVM kernel module and the guest operating system. It is responsible for handling the I/O requests from the guest OS and translating them to operations on the host system.
    
3.  Binary translation: In situations where hardware virtualization extensions are not available or are disabled, QEMU can perform binary translation of guest code to run it directly on the host CPU. This approach is slower than hardware-assisted virtualization but enables virtualization on systems without hardware support.
    
4.  Virtual disk formats: QEMU supports various virtual disk formats, such as qcow2, raw, and VMDK, allowing you to choose the best format for your needs and to easily migrate virtual machines between different virtualization platforms.
    
5.  System emulation: Apart from its role in KVM, QEMU can also be used as a standalone emulator for various CPU architectures, such as x86, ARM, MIPS, and PowerPC, allowing you to run guest operating systems on different host platforms.
    

In summary, QEMU works in tandem with KVM to provide a complete virtualization solution. While KVM handles the low-level processor-specific virtualization, QEMU emulates the necessary hardware devices and manages the user-space interactions to create a functional virtual machine.