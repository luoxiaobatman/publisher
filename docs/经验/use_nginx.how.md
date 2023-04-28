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

### 服务一个静态网站
To deploy a static site using nginx on your Ubuntu server, follow these steps:

1. Make sure your static site files are ready. Create a folder containing your site's files, such as HTML, CSS, and JavaScript files, as well as any images or other resources.

2. Move your site's files to the server. You can use a tool like `scp` or `rsync` to transfer files from your local machine to the server, or use an SFTP client like FileZilla.

3. Create a new nginx server block (also called a virtual host) configuration file. This file will tell nginx how to serve your static site. Open a terminal on your Ubuntu server and run:

```bash
sudo nano /etc/nginx/sites-available/my-static-site
```

Replace `my-static-site` with a name that represents your site.

4. Add the following server block configuration to the file, adjusting the `server_name` and `root` directives to match your domain name and the location of your site's files on the server:

```nginx
server {
    listen 80;
    server_name example.com www.example.com; # Replace with your domain name

    root /var/www/my-static-site; # Replace with the path to your site's files
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Save the file and exit the editor (Ctrl + X, Y, and Enter).

5. Create a symbolic link to the `sites-enabled` directory to enable the configuration:

```bash
sudo ln -s /etc/nginx/sites-available/my-static-site /etc/nginx/sites-enabled/
```

6. Test the nginx configuration for syntax errors:

```bash
sudo nginx -t
```

If there are no errors, you should see a message saying "configuration file /etc/nginx/nginx.conf test is successful."

7. Reload nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

8. Ensure your domain's DNS records are pointing to your server's IP address. You might need to configure an A record with your domain registrar to point to your server's IP.

9. Open a web browser and navigate to your domain name (e.g., http://example.com). Your static site should be served by nginx.

If you encounter any issues, check the nginx error logs located at `/var/log/nginx/error.log` for clues about what went wrong.

### 部署在443端口
To configure nginx to listen on port 443 with an SSL certificate, you can use Certbot, a free and open-source tool that automates the process of obtaining and installing SSL certificates from Let's Encrypt. Since you use Cloudflare, you'll also need to set up the appropriate DNS API credentials for Certbot to use.

Follow these steps to set up SSL with Certbot and Cloudflare:

1. Install Certbot and the Cloudflare DNS plugin on your Ubuntu server:

```bash
sudo apt-get update
sudo apt-get install certbot python3-certbot-dns-cloudflare
```

2. Create a Cloudflare API token:

- Log in to your Cloudflare account.
- Go to the "API Tokens" section under "My Profile."
- Click "Create Token."
- Choose the "Edit zone DNS" template and ensure the "Zone.Zone" and "Zone.DNS" permissions are granted.
- Restrict the token to the specific zone (domain) you want to issue the certificate for.
- Click "Continue to Summary" and then "Create Token."
- Copy the token value, as you'll need it in the next step.

3. Create a Cloudflare credentials file on your server:

```bash
sudo nano /etc/cloudflare.ini
```

Add the following content to the file, replacing `your_cloudflare_api_token` with the actual token value:

```ini
dns_cloudflare_api_token = your_cloudflare_api_token
```

Save the file and exit the editor (Ctrl + X, Y, and Enter).

Secure the credentials file:

```bash
sudo chmod 600 /etc/cloudflare.ini
```

4. Obtain the SSL certificate using Certbot and the Cloudflare DNS plugin:

```bash
sudo certbot certonly --dns-cloudflare --dns-cloudflare-credentials /etc/cloudflare.ini -d example.com -d www.example.com
```

Replace `example.com` and `www.example.com` with your domain name. Certbot will obtain the certificate and store it in `/etc/letsencrypt/live/example.com/`.

5. Update your nginx configuration to listen on port 443 and use the SSL certificate. Open the configuration file you created earlier:

```bash
sudo nano /etc/nginx/sites-available/my-static-site
```

Replace the existing `server` block with the following configuration, adjusting the `server_name`, `root`, and `ssl_certificate`/`ssl_certificate_key` directives as needed:

```nginx
server {
    listen 80;
    server_name example.com www.example.com; # Replace with your domain name
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name example.com www.example.com; # Replace with your domain name

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem; # Replace with your domain's certificate path
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem; # Replace with your domain's private key path

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';

    root /var/www/my-static-site; # Replace with the path to your site's files
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Save the file and exit the editor (Ctrl + X, Y, and Enter).

6. Test the nginx configuration for syntax errors:

```bash
sudo nginx -t
```

If there are no errors, you should see a message saying "configuration file /etc/nginx/nginx.conf test is successful."

7. Reload nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

8. Set up auto-renewal for your SSL certificate by adding a cron job that will run Certbot periodically:

```bash
sudo crontab -e
```

Add the following line at the end of the file:

```cron
0 3 * * * certbot renew --dns-cloudflare --dns-cloudflare-credentials /etc/cloudflare.ini --post-hook "systemctl reload nginx"
```

This will run Certbot every day at 3:00 AM, and reload nginx if a certificate is renewed.

9. Your domain should now be accessible via HTTPS, and nginx should be listening on port 443. Open a web browser and navigate to your domain name (e.g., https://example.com). Your static site should be served by nginx with a valid SSL certificate.

If you encounter any issues, check the nginx error logs located at `/var/log/nginx/error.log` for clues about what went wrong.

### 反向代理
To use nginx as a reverse proxy, you'll need to modify its configuration to forward requests to the backend server(s) hosting your application(s). Here's a basic example of how to configure nginx as a reverse proxy:

1. Identify the backend server's address and port number. This could be another server or an application running on the same server as nginx. For example, let's say your backend server is running on `localhost` (127.0.0.1) and port `3000`.

2. Open or create the nginx server block configuration file for the domain you want to set up the reverse proxy for:

```bash
sudo nano /etc/nginx/sites-available/my-reverse-proxy
```

Replace `my-reverse-proxy` with a name that represents your configuration.

3. Add the following server block configuration to the file, adjusting the `server_name`, `location`, and `proxy_pass` directives as needed:

```nginx
server {
    listen 80;
    server_name example.com; # Replace with your domain name

    location / {
        proxy_pass http://localhost:3000; # Replace with your backend server's address and port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Save the file and exit the editor (Ctrl + X, Y, and Enter).

4. Create a symbolic link to the `sites-enabled` directory to enable the configuration:

```bash
sudo ln -s /etc/nginx/sites-available/my-reverse-proxy /etc/nginx/sites-enabled/
```

5. Test the nginx configuration for syntax errors:

```bash
sudo nginx -t
```

If there are no errors, you should see a message saying "configuration file /etc/nginx/nginx.conf test is successful."

6. Reload nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

7. Ensure your domain's DNS records are pointing to your server's IP address. You might need to configure an A record with your domain registrar to point to your server's IP.

8. Visit your domain (e.g., http://example.com), and nginx should now act as a reverse proxy, forwarding requests to your backend server.

If you have SSL configured, make sure to update the `listen` directive to `listen 443 ssl http2;` and include the appropriate SSL certificate and key paths in the server block for the reverse proxy configuration.

If you encounter any issues, check the nginx error logs located at `/var/log/nginx/error.log` for clues about what went wrong.

### 透明代理
A transparent proxy is a type of proxy server that intercepts and forwards requests without modifying them, in such a way that the client is unaware that it is communicating with a proxy. In other words, the proxy operates "transparently" to the user, who does not have to configure any special settings to use it.

To use nginx as a transparent proxy, you'll need to modify its configuration to intercept and forward requests without modifying them. Here's an example of how to set up nginx as a transparent proxy:

1. Open or create the nginx server block configuration file for the domain you want to set up the transparent proxy for:

```bash
sudo nano /etc/nginx/sites-available/my-transparent-proxy
```

Replace `my-transparent-proxy` with a name that represents your configuration.

2. Add the following server block configuration to the file, adjusting the `server_name`, `location`, and `proxy_pass` directives as needed:

```nginx
server {
    listen 80;
    server_name example.com; # Replace with your domain name

    location / {
        proxy_pass http://$host$request_uri; # Forward the request to the same domain and URI
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off; # Disable the proxy from modifying the response
    }
}
```

The `proxy_pass` directive specifies the backend server to forward the request to. In this case, we use `$host` and `$request_uri` to forward the request to the same domain and URI that was requested by the client.

The `proxy_redirect off` directive disables nginx from modifying the response sent by the backend server.

Save the file and exit the editor (Ctrl + X, Y, and Enter).

3. Create a symbolic link to the `sites-enabled` directory to enable the configuration:

```bash
sudo ln -s /etc/nginx/sites-available/my-transparent-proxy /etc/nginx/sites-enabled/
```

4. Test the nginx configuration for syntax errors:

```bash
sudo nginx -t
```

If there are no errors, you should see a message saying "configuration file /etc/nginx/nginx.conf test is successful."

5. Reload nginx to apply the changes:

```bash
sudo systemctl reload nginx
```

6. Ensure your domain's DNS records are pointing to your server's IP address. You might need to configure an A record with your domain registrar to point to your server's IP.

7. Visit your domain (e.g., http://example.com), and nginx should now act as a transparent proxy, forwarding requests to the backend server without modifying them.

If you have SSL configured, make sure to update the `listen` directive to `listen 443 ssl http2;` and include the appropriate SSL certificate and key paths in the server block for the transparent proxy configuration.

If you encounter any issues, check the nginx error logs located at `/var/log/nginx/error.log` for clues about what went wrong.