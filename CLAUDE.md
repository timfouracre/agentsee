# AgentSee

This file is the canonical instruction file for this repository.

Keep it up to date with the core site rules, deployment details, and any product constraints that materially affect implementation.

## Project Purpose

AgentSee is a London-first decision-support platform for property owners choosing representation when selling or letting a property.

Core product principles:

- Do not rank agents as "best" or "top"
- Do not recommend agents
- Do not allow paid placement to affect visibility
- Keep contact vendor-initiated
- Avoid review-marketplace patterns
- Prefer structured, explainable data over opinion-led copy

## Current Build

The site is currently a static build deployed from a git checkout whose deploy artifact is `index.html`.

## URLs & Access

- **Live:** https://agentsee.uk
- **Repo:** git@github.com:timfouracre/agentsee.git
- **Local:** `~/Sites/agentsee/` (http://agentsee.test)

## Server Paths

- **Server host:** `ubuntu@51.68.235.101`
- **App dir / web root:** `/var/www/agentsee.uk/`
- **Web root:** `/var/www/agentsee.uk/`
- **Nginx config:** `/etc/nginx/sites-available/agentsee.uk`
- **SSL:** Let's Encrypt (auto-renew)
- **Service:** Nginx static site, no app process restart required

## Git Deploy Contract

- **Deploy branch:** `main`
- **Server git remote:** `git@github-agentsee:timfouracre/agentsee.git`
- **Server deploy key path:** `/home/ubuntu/.ssh/id_ed25519_agentsee`
- **Server deploy key fingerprint:** `SHA256:Pa9hkozCwGBm7hKhYmXwz0PEWHgi7/xn5s8lnXCijQk`
- **GitHub deploy-key access:** configured as a read-only deploy key on the `timfouracre/agentsee` repo
- **Server git pull policy:** `pull.ff only`
- **Migration backup path:** `/home/ubuntu/agentsee.uk-pre-git-20260311175730/`

Keep this section up to date with the exact live deploy arrangement.

## Deploy

```bash
cd ~/Sites/agentsee
./deploy.sh
```

Deploy rules:

- deploy only from local `main`
- refuse deploy if local `HEAD` is not already pushed to `origin/main`
- SSH to the server and run `git fetch` + `git pull --ff-only`
- no SCP copy-based deploys

## Implementation Notes

- Prioritise SEO-friendly semantic HTML
- Keep important page copy server-readable in the initial HTML
- Favour calm, trust-led language over marketplace language
- Treat `index.html` as the primary deploy artifact unless the deployment process changes
