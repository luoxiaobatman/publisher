---
created: 2023-04-28
share: true
category: limbo
title: 犹豫
---

%%
> Difficulties increase the nearer we get to the goal.
> — <cite>Johann Wolfgang von Goethe</cite>
%%


The message header displayed by the `top` command on Linux systems provides a brief summary of the information being displayed in each column. Here's what each column header stands for:

-   PID: process ID
-   USER: username of the process owner
-   PR: priority of the process
-   NI: "nice" value of the process, which affects its priority
-   VIRT: amount of virtual memory used by the process
-   RES: amount of physical memory (RAM) used by the process
-   SHR: amount of shared memory used by the process
-   S: process status (e.g. running, sleeping, stopped)
-   %CPU: percentage of CPU usage by the process
-   %MEM: percentage of physical memory (RAM) used by the process
-   TIME+: total CPU time used by the process, measured in seconds
-   COMMAND: name of the command or program that started the process

These columns provide an overview of the processes running on the system, and their resource usage. By default, `top` sorts the processes based on their CPU usage, with the most CPU-intensive processes at the top of the list.