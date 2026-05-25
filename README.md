# orbstack-gsd-vm

OrbStack Ubuntu VM provisioned with Git, Docker, Claude Code, and GSD Pi.

## Usage

```bash
./up.sh
```

Creates (or starts) a `gsd` VM and installs all tools. Prints version info on completion. Exports a snapshot on first successful run.

### Restore from snapshot

```bash
./restore.sh
```

Imports the snapshot, replacing the existing VM. Prompts for confirmation before deleting.

## Tools Installed

- Git
- Docker
- Node.js (LTS)
- [GSD Pi](https://github.com/open-gsd/gsd-pi)
- [Claude Code](https://claude.ai/claude-code)

## Shell Access

```bash
orb -m gsd
```
