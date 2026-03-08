# AgentSee

Currently a holding page. Hosted on the shared OpenClaw server.

## URLs & Access

- **Live:** https://agentsee.uk
- **Repo:** git@github.com:timfouracre/agentsee.git
- **Local:** `~/Sites/openclaw/agentsee/`

## Server Paths

- **Web root:** `/var/www/agentsee.uk/`
- **Nginx config:** `/etc/nginx/sites-available/agentsee.uk`
- **SSL:** Let's Encrypt (auto-renew)

## Deploy

```bash
cd ~/Sites/openclaw/agentsee
./deploy.sh
```

Copies `index.html` to nginx web root via SCP.
