# Personal Linux Web Server

## Project Overview

Set up and configured a personal web server on Ubuntu Linux using Apache HTTP Server. The project includes a custom website, server health monitoring, logging, and automated monitoring using cron.

## Technologies Used

- Ubuntu Linux
- Apache HTTP Server
- HTML
- CSS
- Bash
- curl
- Cron
- Linux networking and file permissions

## Project Features

- Installed and configured Apache Web Server
- Hosted a custom HTML/CSS website
- Configured Apache to serve content from `/var/www/html`
- Verified Apache configuration using `apache2ctl`
- Checked Linux file ownership and permissions
- Analyzed Apache access and error logs
- Tested HTTP responses using `curl`
- Verified Apache listening on port 80
- Created a Bash server monitoring script
- Monitored HTTP status and response time
- Logged server health information
- Tested server UP and DOWN conditions
- Configured cron to run monitoring every 5 minutes

## Monitoring

The monitoring script checks:

- Server availability
- HTTP status code
- Response time

Example:

```text
2026-09-25 13:24:57 | Status: UP | HTTP: 200 | Response: 0.002352s

```

When Apache is stopped:

```text
2026-09-25 13:23:37 | Status: DOWN | HTTP: 000 | Response: 0.011439s
```

## Project Structure

```text
linux-web-server/
├── logs/
│   └── server_monitor.log
├── scripts/
│   └── server_monitor.sh
├── website/
│   └── index.html
└── README.md
```

## Testing

The server was tested using:

```bash
curl -I http://localhost
```

Expected result:

```text
HTTP/1.1 200 OK
```

Apache status was verified using:

```bash
sudo service apache2 status
```

Port 80 was verified using:

```bash
sudo ss -tulpn | grep :80
```

Apache configuration was validated using:

```bash
sudo apache2ctl configtest
```

## Automated Monitoring

Cron was configured to execute the monitoring script every 5 minutes:

```text
*/5 * * * * ~/linux-web-server/scripts/server_monitor.sh
```

## Learning Outcomes

- Linux command-line administration
- Web server installation and configuration
- Linux permissions and ownership
- Apache troubleshooting
- Log analysis
- HTTP troubleshooting
- Bash scripting
- Server monitoring
- Cron job automation
