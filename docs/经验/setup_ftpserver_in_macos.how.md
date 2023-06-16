---
created: 2023-05-06
share: true
category: 经验
title: 在mac上搭建一个ftp服务器
---

### 快速开始
Setting up an FTP server on macOS involves using the built-in FTP server or installing a third-party FTP server. In this guide, I will explain both methods. Keep in mind that FTP is an older, less secure protocol, and it is recommended to use SFTP (Secure File Transfer Protocol) instead, which is built-in on macOS.

Method 1: Using the built-in FTP server (deprecated, not recommended)

Since macOS High Sierra (10.13), Apple has deprecated the built-in FTP server. However, if you are running an older version of macOS, you can enable it using the Terminal:

1. Launch Terminal (found in Applications > Utilities).
2. Type the following command to enable the FTP server and press Enter:

```
sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist
```

3. To disable the FTP server, type the following command and press Enter:

```
sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist
```

Method 2: Installing and using a third-party FTP server (recommended)

In this method, we will use a popular third-party FTP server called 'Pure-FTPd'.

1. Install Homebrew if you haven't already by following the instructions on their website: https://brew.sh

2. Open Terminal and install Pure-FTPd using the following command:

```
brew install pure-ftpd
```

3. Configure Pure-FTPd by creating a configuration file. In Terminal, type:

```
sudo nano /usr/local/etc/pure-ftpd.conf
```

4. Add the following lines to the configuration file:

```
# Set the IP address of your server (replace x.x.x.x with your actual IP address)
ForcePassiveIP               x.x.x.x

# Set the passive port range (recommended: 30000 50000)
PassivePortRange            30000 50000

# Enable the use of TLS (recommended)
TLSEngine                   on
TLSRequired                 on

# Set the location of the TLS certificate and key (replace path/to/cert.pem and path/to/key.pem with your actual paths)
TLSCertificateFile          path/to/cert.pem
TLSPrivateKeyFile           path/to/key.pem
```

5. Save the file by pressing `Ctrl + X`, then `Y`, and finally `Enter`.

6. Create a new user for the FTP server. In Terminal, type:

```Bash
# -u 是uid -g是 gid
sudo pure-pw useradd username -u ftpuser -g ftpgroup -d /path/to/ftp/folder
```

Replace 'username' with your desired username and '/path/to/ftp/folder' with the path to the folder you want to share via FTP.

7. Set a password for the new user by following the prompts.

8. Create a PureDB database file with the user information:

```
sudo pure-pw mkdb
```

9. Start the Pure-FTPd server using the following command:

```Bash
# 用sudo brew services restart pure-ftpd  非sudo无法登陆, 问题等待解决
sudo pure-ftpd -l puredb:/usr/local/etc/pureftpd.pdb -8 UTF-8 -A -j -E -Y 2 -P x.x.x.x -p 30000:50000 -U 133:022
```

Replace 'x.x.x.x' with your server's IP address.

10. To stop the Pure-FTPd server, use the following command:

```
sudo brew services top pure-ftpd
```

Now you have a functional FTP server on your macOS system. To access the server, use an FTP client and enter the IP address, username, and password you created earlier.

备注: The FTP client in High Sierra has been removed by Apple


