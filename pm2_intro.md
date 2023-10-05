## What is PM2?
PM2, or Process Manager 2, is a process management tool for Node.js applications and other processes. It is especially useful for managing and deploying Node.js applications in production environments.

## Why is PM2 Useful?
PM2 offers several benefits:
- **Process Management**: Efficiently start, stop, restart, and monitor Node.js applications.
- **Load Balancing**: Distribute incoming traffic to different application instances.
- **Logging and Monitoring**: Built-in logging and monitoring features.
- **Graceful Reloads**: Update applications without downtime.
- **Environment Management**: Easily manage different environments (e.g., development, production).

## Common PM2 Commands

1. **Start an Application**: Start a Node.js application.
   ```bash
   pm2 start app.js
   ```

2. **List Running Processes**: List all running processes managed by PM2.
   ```bash
   pm2 list
   ```

3. **Stop a Process**: Stop a specific process by name or ID.
   ```bash
   pm2 stop <app_name_or_id>
   ```

4. **Restart a Process**: Restart a specific process.
   ```bash
   pm2 restart <app_name_or_id>
   ```

5. **View Logs**: View logs for a specific process.
   ```bash
   pm2 logs <app_name_or_id>
   ```

6. **Monitor Resources**: Monitor CPU and memory usage of all processes.
   ```bash
   pm2 monit
   ```

7. **Delete a Process**: Remove a process from PM2's management.
   ```bash
   pm2 delete <app_name_or_id>
   ```

8. **Save Current Process List**: Save the current list of managed processes.
   ```bash
   pm2 save
   ```

9. **Startup Script**: Generate a startup script to auto-start PM2 processes on system boot.
   ```bash
   pm2 startup
   ```
