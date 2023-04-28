---
created: 2023-04-28
share: true
category: 经验
title: 使用nginx
---

%%
> When you have got an elephant by the hind legs and he is trying to run away, it's best to let him run.
> — <cite>Abraham Lincoln</cite>
%%

### 服务一个静态文件
To deploy an Nginx server that serves a static PDF file when users visit `luoxiao.me` with TLS, follow these steps:

1. **Install Nginx:**

First, update your package list and install Nginx:

```
sudo apt update
sudo apt install nginx
```

2. **Create a directory to store the static PDF file:**

```
sudo mkdir -p /var/www/luoxiao.me
```

3. **Upload the static PDF file:**

Upload your PDF file to the newly created directory, `/var/www/luoxiao.me`. You can use tools like `scp` or `rsync` to transfer the file to your server. For example:

```
scp /path/to/your/local/pdf your_username@your_server_ip:/var/www/luoxiao.me
```

Replace `/path/to/your/local/pdf` with the path to your local PDF file, `your_username` with your server's username, and `your_server_ip` with your server's IP address.

4. **Create an Nginx configuration file for your domain:**

Create a new Nginx configuration file for `luoxiao.me`:

```
sudo nano /etc/nginx/sites-available/luoxiao.me
```

Add the following content to the file:

```
server {
    listen 80;
    server_name luoxiao.me www.luoxiao.me;
    root /var/www/luoxiao.me;
    
    location / {
        try_files $uri /your_pdf_filename.pdf;
    }
}
```

Replace `your_pdf_filename.pdf` with the name of your PDF file.

Save and exit the editor.

5. **Enable the Nginx configuration:**

Create a symbolic link to enable the configuration:

```
sudo ln -s /etc/nginx/sites-available/luoxiao.me /etc/nginx/sites-enabled/
```

6. **Configure DNS:**

In your Cloudflare account, create an A record that points `luoxiao.me` and a CNAME record that points `www.luoxiao.me` to your server's IP address.

7. **Set up TLS with Certbot:**

Install Certbot and the Nginx plugin:

```
sudo apt install certbot python3-certbot-nginx
```

Run Certbot to obtain and configure an SSL certificate:

```
sudo certbot --nginx -d luoxiao.me -d www.luoxiao.me
```

Follow the on-screen prompts to complete the process. Certbot will automatically update the Nginx configuration to enable HTTPS.

8. **Restart Nginx:**

Restart Nginx to apply the changes:

```
sudo systemctl restart nginx
```

Now, when users visit `luoxiao.me` or `www.luoxiao.me`, they should be able to download your static PDF file over a secure HTTPS connection.
