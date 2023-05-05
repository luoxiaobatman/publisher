---
created: 2023-04-28
share: true
category: 操作系统
title: 进程
---

%%
> Keep your face always toward the sunshine - and shadows will fall behind you.
> — <cite>Walt Whitman</cite>
%%


### 进程状态
In Linux, process states describe the current condition of a process during its lifetime. Here's an explanation of the process states you've mentioned:

1. Zombie: A zombie process is one that has completed execution but is still present in the process table because its parent process has not yet collected its exit status. It consumes minimal system resources and does not perform any operations. Once the parent process acknowledges the exit status, the zombie process is removed from the process table.

2. Running: A running process is actively executing instructions on the CPU or waiting for CPU time to execute. It is either currently running on the CPU or in the queue of processes waiting for CPU time.

3. Stuck (Uninterruptible Sleep): A process in uninterruptible sleep is waiting for a specific event, usually related to I/O operations (e.g., reading from or writing to a disk). It cannot be interrupted by signals, and the process will continue to wait until the event is completed.

4. Sleeping: A sleeping process is one that is waiting for a specific condition to be met, such as waiting for data from a user or another process. While in this state, the process is not using CPU time and is waiting for an event or a signal to wake it up.

5. Idle: The idle state is not a process state but rather a system state. When the system has no tasks to perform, the CPU enters the idle state, which is a low-power mode that conserves energy until there's a task to execute.

6. Stopped: A stopped process is one that has been paused, usually due to receiving a signal such as SIGSTOP or SIGTSTP. The process remains in the process table but does not consume CPU time. It can be resumed later by receiving a signal like SIGCONT.

7. Halted: The halted state is not a process state but rather a system state. It indicates that the system has been shut down or is in a low-power state, waiting for an event (such as a hardware interrupt) to wake it up. 

8. Unknown: An unknown process state usually means that the process state cannot be determined or is not recognized by the monitoring tool or the operating system. It might indicate an issue with the process, the tool, or the kernel itself.

Note that some of these states are not standard Linux process states, such as "idle," "halted," and "unknown." The standard Linux process states are "running," "sleeping," "stopped," and "zombie."

### 从开始到结束
Here's a step-by-step explanation of how a Linux system executes a `hello world` C program compiled to a binary:

1. Compilation: First, you write the C program and save it in a file, say `hello.c`. Then you compile the program using a compiler like GCC with the command `gcc hello.c -o hello`. The compiler generates an executable binary file named `hello`.

2. Loading the binary: When you execute the binary by typing `./hello` in the terminal, the shell invokes the `execve()` system call, which tells the kernel to load the binary file into memory.

3. Reading the ELF header: The binary file is in the ELF (Executable and Linkable Format). The kernel reads the ELF header to determine how to load the file's segments into memory, such as the code segment, data segment, and the dynamic linking information.

4. Allocating memory: The kernel allocates memory for the process's address space, including the stack, heap, and various segments. It maps the code and data segments into the process's address space.

5. Dynamic linking: If the program uses shared libraries, the dynamic linker (usually `ld.so` or `ld-linux.so`) is loaded, which resolves and loads the required shared libraries into the process's address space.

6. Initializing process control block (PCB): The kernel initializes a process control block for the new process, which contains information about the process's state, priority, file descriptors, and other metadata.

7. Creating a new process: The kernel creates a new process by performing a fork operation, which results in a new process with its own process ID (PID). The new process starts executing the `_start` function from the C runtime (usually provided by `crt0.o` or `crt1.o`).

8. Calling `main`: The `_start` function is responsible for setting up the program's environment, such as initializing the stack and the heap. It then calls the `main` function, which contains the code for your `hello world` program.

9. Executing the program: The `main` function executes, and your program writes "hello world" to the standard output (stdout) using the `printf` function. The `printf` function internally calls the `write()` system call to output the text.

10. Program termination: Once the `main` function finishes execution, it returns a value (usually 0 for successful execution). The `_start` function receives the return value and calls the `exit()` system call to terminate the process and return the exit status to the parent process (in this case, the shell).

11. Releasing resources: The kernel releases the resources associated with the process, such as memory, file descriptors, and the process control block. The parent process (shell) collects the exit status of the terminated process using the `wait()` or `waitpid()` system call.

12. Returning to the shell: The shell receives the exit status and continues its execution, waiting for the next command or script to execute.

#### PCB
Yes, the Process Control Block (PCB) is a data structure that resides in the kernel space. It contains essential information about each process, which the operating system needs to manage and schedule processes efficiently.

The PCB typically includes information such as:

1.  Process ID (PID): A unique identifier assigned to each process.
2.  Process state: The current state of the process, such as running, waiting, or stopped.
3.  Program Counter (PC): The address of the next instruction to be executed by the process.
4.  CPU registers: A snapshot of the CPU registers for the process when it is not running, which is required for context-switching.
5.  Memory management information: Details about the process's memory allocations, such as the base and limit registers, page tables, and segment tables.
6.  I/O status information: Information about open files, sockets, and other I/O resources used by the process.
7.  Scheduling and priority information: Data related to the process's priority, scheduling class, and other scheduling-related attributes.
8.  Parent process ID (PPID): The process ID of the parent process that created this process.
9.  Process group ID (PGID): The identifier for the process group, which is a group of related processes.
10.  Signal information: Information about signals received or pending for the process.
11.  User ID (UID) and Group ID (GID): The identifiers for the user and group that own the process.

The kernel uses the PCB to keep track of each process and to manage resources, scheduling, and other operations efficiently. The PCB is created when a new process is spawned and is deallocated when the process terminates.

#### process group
A process group is a collection of related processes in a Unix-like operating system. Each process group is identified by a unique Process Group ID (PGID). Process groups are primarily used for organizing and managing processes in the context of job control and signal distribution.

Here are some of the main uses for process groups:

1. Job control: Process groups are particularly useful in the context of job control in a shell. When you run a pipeline of commands or execute commands in the background, the shell creates a new process group for the related processes. This allows the shell to manage and control the processes as a single unit. For example, the shell can suspend, resume, or terminate all processes in a process group together.

2. Signal distribution: Process groups simplify the distribution of signals to a group of related processes. When you send a signal to a process group, the operating system delivers the signal to all processes in that group. For example, if you press Ctrl+C in a terminal, the interrupt signal (SIGINT) is sent to the foreground process group, causing all processes in that group to terminate.

3. Terminal management: In Unix-like systems, processes are associated with a controlling terminal. When a process group becomes the foreground process group of the terminal, it can read from and write to the terminal. Other process groups are in the background and are not allowed to read from the terminal. This mechanism helps manage access to the terminal and prevent conflicts between processes.

Overall, process groups provide a convenient way to manage and control related processes in a Unix-like operating system. They enable efficient job control and signal distribution, making it easier for users and system administrators to work with groups of processes.