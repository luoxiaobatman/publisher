---
created: 2023-05-08
share: true
category: 经验
title: 操作系统日常使用
---

### -rwsrwsrwx@

The `ll` command is an alias for `ls -l` on many systems, which displays detailed information about files and directories, including their permissions. In the file permission output `-rwsrwsrwx@`, the last `@` symbol indicates that the file has extended attributes associated with it.

Extended attributes are metadata that can be attached to a file or directory on certain file systems. They consist of a name-value pair and can be used to store additional information about a file, such as access control lists (ACLs) or other system-related data.

To view the extended attributes of a file, you can use the `xattr` command on macOS or the `getfattr` command on Linux. To manage extended attributes, you can use the `setfattr` command on Linux.

#### com.apple.quarantine
`com.apple.quarantine` is an extended attribute on macOS that indicates a file has been downloaded from the internet or received from another potentially untrusted source. This attribute is automatically added by macOS when you download a file using certain applications, such as web browsers or email clients. 

When a file has the `com.apple.quarantine` attribute, macOS may display a warning when you try to open it, asking if you are sure you want to open the file because it comes from an unidentified developer or an unknown source. This is a security feature designed to protect your system from potentially harmful files.

If you trust the source of the file and want to remove the quarantine attribute, you can use the `xattr` command with the `-d` option, followed by the attribute name and the file name:

```
xattr -d com.apple.quarantine filename
```

This will remove the `com.apple.quarantine` attribute from the file, and macOS will no longer display a warning when you open it. Be cautious when removing the quarantine attribute, as doing so may expose your system to potential security risks if the file is indeed harmful.
