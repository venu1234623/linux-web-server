# Personal Linux Web Server

## Project Preview

![Personal Linux Web Server](images/web-server.png)

## Project Overview

Set up and configured a personal web server on Ubuntu Linux using Apache HTTP Server. The project demonstrates Linux system administration, web server configuration, monitoring, log analysis, automation, troubleshooting, and Git version control.

## Technologies Used

- Ubuntu Linux
- Apache HTTP Server
- HTML
- CSS
- Bash
- curl
- Cron
- Git & GitHub
- Linux networking
- Linux file permissions

## Project Features

- Installed and configured Apache Web Server
- Hosted a custom HTML/CSS website
- Configured Apache to serve content from `/var/www/html`
- Verified Apache configuration using `apache2ctl`
- Checked Linux file ownership and permissions
- Verified Apache listening on port 80
- Monitored web server availability
- Monitored HTTP status and response time
- Monitored CPU, memory, and disk usage
- Implemented resource threshold alerts
- Automated monitoring using Cron
- Analyzed Apache access logs
- Analyzed HTTP status codes
- Analyzed Apache error logs
- Tested server UP and DOWN conditions
- Performed controlled Apache configuration troubleshooting
- Used Git for version control
- Published the project on GitHub

## Web Server Monitoring

The `server_monitor.sh` script checks:

- Server availability
- HTTP status code
- Response time
- Timestamp

Example:

```text
2026-09-25 13:24:57 | Status: UP | HTTP: 200 | Response: 0.002352s
