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
