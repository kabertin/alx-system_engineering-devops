
postmortem: MERCATO Platform Outage

Issue Summary
Duration of Outage:

Start: August 14, 2024, 10:30 AM GMT+2
End: August 14, 2024, 12:15 PM GMT+2
Impact:

The MERCATO platform experienced an outage, affecting marketplace and dashboard services for 1 hour and 45 minutes.
Users were unable to load product listings, place orders, or access their accounts.
Approximately 70% of the user base was impacted.
Root Cause:

A server misconfiguration caused by a failed update to the Nginx configuration file, preventing the web server from routing requests to the backend application.
Timeline
10:30 AM: Issue detected by an automated monitoring alert signaling a spike in 502 Bad Gateway errors.
10:32 AM: Engineers confirmed the issue by checking Nginx logs, which indicated a misconfiguration.
10:40 AM: Investigation into load balancer and backend server performance, assuming the issue was due to high traffic.
11:00 AM: Incident escalated to the DevOps team after ruling out load balancer issues.
11:10 AM: Misleading investigation into database connectivity, which was found to be normal.
11:30 AM: Root cause identified in the Nginx configuration, specifically a syntax error in the latest update.
11:45 AM: Configuration rollback initiated and server restarted.
12:15 PM: Services fully restored and monitored for stability.
Root Cause and Resolution
Root Cause:

A syntax error in the Nginx configuration file during a routine update. A missing semicolon caused Nginx to fail in loading the configuration, resulting in 502 errors.
Resolution:

The previous stable version of the Nginx configuration was restored, and the server was restarted, resolving the issue. The faulty configuration was reviewed and corrected in a controlled environment before redeployment.
Corrective and Preventative Measures
Improvements and Fixes:

Automated syntax checks for configuration files before deployment.
Refined rollback procedures for faster recovery in future incidents.
Enhanced monitoring for Nginx configuration issues.
Tasks:

Implement CI/CD pipeline steps for configuration syntax checks.
Develop a runbook for quick identification and rollback of failed configurations.
Update monitoring systems to include Nginx-specific alerts and dashboards.
Train the engineering team on configuration management best practices.
This README file provides a detailed overview of the outage, its causes, and the steps taken to resolve and prevent future issues.
