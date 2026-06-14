# orbstack-gsd-vm

OrbStack Ubuntu VM provisioned with Git, Docker, Claude Code, and GSD Pi.

## Usage

```bash
./up.sh
```

Creates (or starts) a `gsd` VM and installs all tools. Prints version info on completion. Exports a snapshot on first successful run.

The VM is created with `--isolated`, which disables default OrbStack file sharing and host integration. To mount specific host directories, create a `mounts.txt` file before running `up.sh`:

```bash
# mounts.txt — one mount per line, SOURCE[:DEST]
# Lines starting with # and blank lines are ignored.
/Users/me/projects:/home/user/projects
/Users/me/.ssh:/home/user/.ssh
```

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
