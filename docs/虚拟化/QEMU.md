---
created: 2023-04-27
share: true
category: 虚拟化
title: QEMU
---

%%
> Better be ignorant of a matter than half know it.
> — <cite>Publilius Syrus</cite>
%%


QEMU (Quick Emulator) is an open-source software that performs hardware virtualization. It is a hosted virtual machine monitor (VMM) that emulates various processors and their associated hardware components. QEMU can be used to run operating systems and programs written for one machine (e.g., an ARM-based processor) on a different machine (e.g., an x86-based processor) by converting instructions from one architecture to another.

QEMU has two operating modes:

1.  User mode emulation: In this mode, QEMU can run single Linux or Windows programs compiled for a different CPU architecture. This is useful for testing and debugging software on various platforms without the need for actual hardware.
    
2.  System mode emulation (full system emulation): In this mode, QEMU emulates an entire computer system, including the CPU, memory, storage, and peripherals. This allows users to run an entire operating system, such as Linux or Windows, designed for a different architecture on the host machine.
    

QEMU is often used in conjunction with other virtualization tools, like KVM (Kernel-based Virtual Machine), which allows it to take advantage of hardware-assisted virtualization features on modern CPUs to improve performance.

### Boot from ISO
QEMU can be used in various ways depending on your requirements. Here's a simple example of using QEMU to run a Linux distribution (e.g., Ubuntu) on an x86-64 architecture:

1. First, download the desired Linux distribution's ISO file, such as Ubuntu:

```
wget https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso
```

2. Next, create a virtual hard disk image (QEMU supports various formats like qcow2, raw, vmdk, etc.). Here, we'll create a qcow2 format image with a size of 20 GB:

```
qemu-img create -f qcow2 ubuntu-vm.qcow2 20G
```

3. Now, you can use QEMU to boot the downloaded ISO image and install the Linux distribution on the virtual hard disk image. This command will boot the ISO and attach the qcow2 image as the virtual hard drive:

```
qemu-system-x86_64 -hda ubuntu-vm.qcow2 -boot d -cdrom ubuntu-20.04.3-live-server-amd64.iso -m 2048 -smp 2 -enable-kvm -net nic -net user,hostfwd=tcp::2222-:22
```

Explanation of the command-line options:

- `qemu-system-x86_64`: Execute QEMU as an x86-64 emulator.
- `-hda ubuntu-vm.qcow2`: Specify the virtual hard disk image to use.
- `-boot d`: Set the boot device to the CD-ROM drive.
- `-cdrom ubuntu-20.04.3-live-server-amd64.iso`: Specify the ISO file to use as the CD-ROM.
- `-m 2048`: Allocate 2 GB of RAM to the virtual machine.
- `-smp 2`: Assign 2 virtual CPUs to the virtual machine.
- `-enable-kvm`: Enable KVM for hardware acceleration (optional, requires KVM support on the host).
- `-net nic`: Create a virtual network interface card.
- `-net user,hostfwd=tcp::2222-:22`: Configure user-mode networking and forward the host's port 2222 to the guest's port 22 (for SSH access).

4. Once the installation is complete, shut down the virtual machine and restart it without the `-boot d -cdrom` options:

```
qemu-system-x86_64 -hda ubuntu-vm.qcow2 -m 2048 -smp 2 -enable-kvm -net nic -net user,hostfwd=tcp::2222-:22
```

Now, you can access the virtual machine via SSH using the forwarded port:

```
ssh -p 2222 user@localhost
```

Remember to replace "user" with the username you configured during the installation process.

These examples demonstrate basic usage of QEMU for x86-64 systems. QEMU supports many other architectures and configurations. You can find more options and examples in the QEMU documentation: https://www.qemu.org/docs/master/index.html



#### Boot with virsh and ISO

`virsh` is a command-line utility used to manage virtual machines and their resources using the libvirt library. It provides an interface to interact with various hypervisors, including QEMU and KVM. To boot a system from an ISO file using virsh, you need to follow these steps:

1. Install the required packages:

For Ubuntu/Debian:

```
sudo apt-get update
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
```

For CentOS/RHEL/Fedora:

```
sudo yum install qemu-kvm libvirt libvirt-daemon-kvm bridge-utils
```

2. Start and enable the libvirtd service:

For Ubuntu/Debian:

```
sudo systemctl enable --now libvirtd
```

For CentOS/RHEL/Fedora:

```
sudo systemctl enable --now libvirtd
```

3. Create a virtual hard disk image:

```
qemu-img create -f qcow2 /var/lib/libvirt/images/ubuntu-vm.qcow2 20G
```

4. Create a virtual machine XML configuration file, for example, `ubuntu-vm.xml`:

```xml
<domain type='kvm'>
  <name>ubuntu-vm</name>
  <memory unit='KiB'>2097152</memory>
  <vcpu placement='static'>2</vcpu>
  <os>
    <type arch='x86_64' machine='pc-i440fx-2.9'>hvm</type>
    <boot dev='hd'/>
    <boot dev='cdrom'/>
  </os>
  <devices>
    <disk type='file' device='disk'>
      <driver name='qemu' type='qcow2'/>
      <source file='/var/lib/libvirt/images/ubuntu-vm.qcow2'/>
      <target dev='vda' bus='virtio'/>
    </disk>
    <disk type='file' device='cdrom'>
      <driver name='qemu' type='raw'/>
      <source file='/path/to/your/ubuntu-20.04.3-live-server-amd64.iso'/>
      <target dev='sda' bus='sata'/>
      <readonly/>
    </disk>
    <interface type='network'>
      <source network='default'/>
      <model type='virtio'/>
    </interface>
    <graphics type='spice'>
      <listen type='address'/>
      <image compression='off'/>
    </graphics>
    <video>
      <model type='qxl' ram='65536' vram='65536' vgamem='16384' heads='1'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x0'/>
    </video>
  </devices>
</domain>
```

Customize the XML file to match your desired configuration, such as adjusting the memory, vCPUs, or file paths.

5. Define and start the virtual machine:

```
virsh define ubuntu-vm.xml
virsh start ubuntu-vm
```

6. Connect to the virtual machine's console:

```
virsh console ubuntu-vm
```

You should now see the Ubuntu installation process. Complete the installation and reboot the virtual machine.

7. After installation, edit the virtual machine configuration to remove the ISO file:

```
virsh edit ubuntu-vm
```

Remove the following lines from the XML configuration:

```xml
<boot dev='cdrom'/>
```

and

```xml
<disk type='file' device='cdrom'>
  <driver name='qemu' type='raw'/>
```
After removing the ISO file from the virtual machine's configuration, save and exit the editor. Now you need to restart the virtual machine for the changes to take effect.

8. Shut down the virtual machine:

```
virsh shutdown ubuntu-vm
```

9. Start the virtual machine again:

```
virsh start ubuntu-vm
```

Now, the virtual machine should boot from the virtual hard disk image instead of the ISO file. You can access the virtual machine using the console or by setting up remote access through SSH or other remote desktop tools, depending on the guest operating system configuration.

To connect to the virtual machine's console again, use:

```
virsh console ubuntu-vm
```

If you want to manage the virtual machine further, you can use other `virsh` commands like `shutdown`, `reboot`, `suspend`, `resume`, `undefine`, etc. You can find a complete list of commands in the virsh documentation: https://libvirt.org/sources/virshcmdref/html/index.html

### Related to ISO file
An ISO file, also known as an ISO image, is a single file that contains a complete copy of the contents of a CD, DVD, or Blu-ray disc. It is named after the ISO 9660 file system used for optical discs, but the term has become a general term for disc image files. ISO files are often used to distribute software, operating systems, and other large programs or data collections, as they can easily be shared, stored, and burned onto physical media.

To use an ISO file, you can either burn it to a physical disc (like a CD or DVD) or mount it as a virtual drive on your computer. Many operating systems, including Windows, macOS, and Linux, have built-in tools for mounting and burning ISO files. Additionally, there are third-party applications that can manage these tasks. When an ISO file is mounted or burned, it acts as if the original disc was inserted into your computer, allowing you to access its contents and install or run the software as needed.

### Related to virsh configuration xml file
`virsh` is a command-line utility used to manage virtual machines and hypervisors in a Linux environment, typically with KVM (Kernel-based Virtual Machine) or QEMU as the underlying hypervisor.

Below is an example of a virtual machine configuration file in XML format that can be used by `virsh`. This example defines a virtual machine with one virtual CPU, 1024 MB of RAM, and a 10 GB virtual disk. You can customize this example to suit your needs:

```xml
<domain type='kvm'>
  <name>my_virtual_machine</name>
  <uuid>YOUR-UNIQUE-UUID-HERE</uuid>
  <memory unit='KiB'>1048576</memory>
  <currentMemory unit='KiB'>1048576</currentMemory>
  <vcpu placement='static'>1</vcpu>
  <os>
    <type arch='x86_64' machine='pc-i440fx-2.9'>hvm</type>
    <boot dev='hd'/>
  </os>
  <devices>
    <disk type='file' device='disk'>
      <driver name='qemu' type='qcow2'/>
      <source file='/path/to/your/disk-image.qcow2'/>
      <target dev='vda' bus='virtio'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x0'/>
    </disk>
    <interface type='network'>
      <mac address='52:54:00:XX:YY:ZZ'/>
      <source network='default'/>
      <model type='virtio'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
    </interface>
    <input type='tablet' bus='usb'/>
    <input type='keyboard' bus='ps2'/>
    <graphics type='vnc' port='-1' autoport='yes'/>
  </devices>
  <features>
    <acpi/>
    <apic/>
    <vmport state='off'/>
  </features>
  <cpu mode='host-model'>
    <model fallback='allow'/>
  </cpu>
</domain>
```

Make sure to replace `YOUR-UNIQUE-UUID-HERE` with a unique UUID and `/path/to/your/disk-image.qcow2` with the path to the virtual disk image you want to use. Also, adjust the `<mac address>` to a unique value within your network.

Save this XML file and use the `virsh` command to create, define, or manage your virtual machine. For example, to define a new virtual machine with this configuration, you can run:

```bash
virsh define /path/to/your/vm-config.xml
```


### Create an qcow2 file from ISO
To create a qcow2 file from an ISO file, you can use the `qemu-img` command-line tool, which is part of the QEMU package. The qcow2 format is a flexible, efficient, and widely-used format for virtual machine disk images. Here's how you can create a qcow2 file from an ISO file:

1. Install QEMU, if not already installed, on your system. For example, on Ubuntu or Debian-based systems, you can use the following command:

```bash
sudo apt-get install qemu-kvm qemu-utils
```

On CentOS or Fedora, use:

```bash
sudo yum install qemu-kvm qemu-img
```

2. Determine the size you want for your qcow2 image. This size should be larger than the ISO file, as it needs to hold both the ISO contents and any additional data the virtual machine will use. For example, you might choose a size of 10 GB.

3. Create an empty qcow2 file with the specified size using the `qemu-img` command:

```bash
qemu-img create -f qcow2 my_disk_image.qcow2 10G
```

Replace `my_disk_image.qcow2` with the desired name for your disk image, and `10G` with the desired size.

4. Boot a virtual machine using the qcow2 file as its disk and the ISO file as a virtual CD-ROM. This will allow you to install the contents of the ISO file onto the qcow2 image. You can do this with the `qemu-system` command:

```bash
qemu-system-x86_64 -cdrom /path/to/your/iso-file.iso -boot d -m 1024 -hda my_disk_image.qcow2 -enable-kvm
```

Replace `/path/to/your/iso-file.iso` with the path to the ISO file you want to use. This command will boot the virtual machine with 1 GB of RAM (`-m 1024`) and the qcow2 file as its primary disk (`-hda my_disk_image.qcow2`).

5. Install the contents of the ISO file onto the qcow2 image. The installation process will vary depending on the operating system or software contained in the ISO file. Follow the installation instructions as if you were installing on a physical machine.

Once the installation is complete, you can use the qcow2 file as a virtual disk for your virtual machines.

### Configuration xml file detail
These lines in the XML configuration file define the operating system and boot settings for the virtual machine:

```xml
  <os>
    <type arch='x86_64' machine='pc-i440fx-2.9'>hvm</type>
    <boot dev='hd'/>
  </os>
```

Let's break it down:

- `<os>`: This tag specifies the operating system settings for the virtual machine.
    - `<type arch='x86_64' machine='pc-i440fx-2.9'>hvm</type>`: This tag defines the virtualization type, architecture, and machine type for the virtual machine.
        - `arch='x86_64'`: This attribute specifies the architecture of the virtual machine, in this case, it's set to x86_64 (64-bit Intel/AMD architecture).
        - `machine='pc-i440fx-2.9'`: This attribute defines the machine type, which is a specific hardware configuration emulated by the hypervisor. In this case, it's set to 'pc-i440fx-2.9', which represents an emulated i440FX chipset-based machine.
        - `hvm`: This text within the `<type>` tag specifies the virtualization type. 'hvm' stands for Hardware-assisted Virtual Machine, meaning it uses hardware virtualization extensions like Intel VT-x or AMD-V for efficient virtualization.
    - `<boot dev='hd'/>`: This tag sets the boot device for the virtual machine.
        - `dev='hd'`: This attribute specifies the boot device. In this case, it's set to 'hd', which means the virtual machine will attempt to boot from its hard drive (the virtual disk specified in the `<disk>` section).

These settings define the virtual machine as a hardware-assisted x86_64 system with an emulated i440FX chipset-based machine that boots from its virtual hard drive.

This part of the XML configuration file defines the virtual disk for the virtual machine:

```xml
<disk type='file' device='disk'>
  <driver name='qemu' type='qcow2'/>
  <source file='/path/to/your/disk-image.qcow2'/>
  <target dev='vda' bus='virtio'/>
  <address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x0'/>
</disk>
```

Let's break down each part of this configuration:

- `<disk type='file' device='disk'>`: This tag specifies that the virtual disk is a file-backed disk.
    - `type='file'`: The `type` attribute indicates that the virtual disk is backed by a file on the host system.
    - `device='disk'`: The `device` attribute indicates that this device is a disk (as opposed to a CD-ROM or floppy disk, for example).

- `<driver name='qemu' type='qcow2'/>`: This tag defines the driver and format of the virtual disk.
    - `name='qemu'`: The `name` attribute specifies the driver used to manage the virtual disk, in this case, QEMU.
    - `type='qcow2'`: The `type` attribute specifies the format of the virtual disk file, in this case, the qcow2 format.

- `<source file='/path/to/your/disk-image.qcow2'/>`: This tag specifies the source file for the virtual disk.
    - `file='/path/to/your/disk-image.qcow2'`: The `file` attribute provides the path to the virtual disk file on the host system.

- `<target dev='vda' bus='virtio'/>`: This tag defines the target device and bus for the virtual disk within the guest virtual machine.
    - `dev='vda'`: The `dev` attribute sets the device name for the virtual disk as seen by the guest operating system (e.g., /dev/vda in a Linux guest).
    - `bus='virtio'`: The `bus` attribute specifies the bus type for the virtual disk. In this case, it's set to 'virtio', which is a high-performance, paravirtualized I/O bus designed for virtual machines.

- `<address type='pci' domain='0x0000' bus='0x00' slot='0x04' function='0x0'/>`: This tag specifies the PCI address of the virtual disk device on the virtual machine's emulated PCI bus.
    - `type='pci'`: The `type` attribute indicates that the address is for a PCI device.
    - `domain='0x0000'`, `bus='0x00'`, `slot='0x04'`, and `function='0x0'`: These attributes define the PCI address of the device. In this case, the virtual disk is assigned to domain 0x0000, bus 0x00, slot 0x04, and function 0x0.

This configuration defines a qcow2-format virtual disk backed by a file on the host system, using the virtio bus for high-performance I/O within the guest virtual machine.

不能让它继续胡说八道xml了, 细节直接去查文档 https://libvirt.org/formatdomain.html
