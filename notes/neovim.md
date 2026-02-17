# Neovim Shortcuts Cheat Sheet

## Core Navigation

### Basic Movement
| Key | Action |
|-----|--------|
| `h` `j` `k` `l` | Left, down, up, right |
| `w` / `b` | Next/previous word |
| `0` / `$` | Start/end of line |
| `gg` / `G` | Top/bottom of file |
| `Ctrl+d` / `Ctrl+u` | Half page down/up |
| `Ctrl+f` / `Ctrl+b` | Full page down/up |

### Search & Jump
| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` / `N` | Next/previous match |
| `*` / `#` | Search word under cursor |
| `gd` | Go to definition (LSP) |
| `Ctrl+o` / `Ctrl+i` | Jump back/forward in history |

## Editing

| Key | Action |
|-----|--------|
| `i` / `a` | Insert before/after cursor |
| `I` / `A` | Insert start/end of line |
| `o` / `O` | New line below/above |
| `.` | Repeat last command |
| `u` / `Ctrl+r` | Undo/redo |
| `yy` / `dd` | Yank(copy)/delete line |
| `p` / `P` | Paste after/before |
| `ciw` | Change inner word |
| `vi"` | Select inside quotes |

## Multiple Files

### Buffers (files in memory)
| Key | Action |
|-----|--------|
| `:e filename` | Open/edit file |
| `:ls` or `:buffers` | List all open buffers |
| `:bn` / `:bp` | Next/previous buffer |
| `Tab` / `Shift+Tab` | Next/previous buffer (custom) |
| `:b3` | Jump to buffer 3 |
| `:bd` | Close current buffer |
| `Ctrl+6` or `Ctrl+^` | Toggle between last 2 files |

### Tabs
| Key | Action |
|-----|--------|
| `:tabnew file` | Open file in new tab |
| `gt` / `gT` | Next/previous tab |
| `:tabclose` | Close current tab |

### Splits
| Key | Action |
|-----|--------|
| `:split file` or `:sp` | Horizontal split |
| `:vsplit file` or `:vs` | Vertical split |
| `Ctrl+w h/j/k/l` | Move between splits |
| `Ctrl+w w` | Cycle through splits |
| `Ctrl+w =` | Equalize split sizes |
| `Ctrl+w q` | Close current split |

### Split Navigation (Custom Mappings)
| Key | Action |
|-----|--------|
| `Ctrl+h` | Move to left split |
| `Ctrl+j` | Move to bottom split |
| `Ctrl+k` | Move to top split |
| `Ctrl+l` | Move to right split |

### Swap/Rearrange Splits
| Key | Action |
|-----|--------|
| `Ctrl+w r` | Rotate splits clockwise |
| `Ctrl+w R` | Rotate splits counter-clockwise |
| `Ctrl+w x` | Exchange current split with next |
| `Ctrl+w H` | Move split to far left (vertical) |
| `Ctrl+w L` | Move split to far right (vertical) |
| `Ctrl+w J` | Move split to bottom (horizontal) |
| `Ctrl+w K` | Move split to top (horizontal) |

### File Explorer
| Key | Action |
|-----|--------|
| `:Ex` or `:Explore` | Open file browser |
| `:Sex` | Split horizontal + explorer |
| `:Vex` | Split vertical + explorer |

## Telescope (Fuzzy Finder)

### Prerequisites
```bash
sudo dnf install ripgrep  # Required for live_grep
```

### Telescope Commands
| Key | Action |
|-----|--------|
| `Space ff` | Find files |
| `Space fg` | Search text (live grep) |
| `Space fb` | List open buffers |
| `Space fh` | Search help tags |

## Remote SSH (remote-sshfs.nvim)

### Prerequisites
```bash
sudo dnf install fuse-sshfs  # Fedora
brew install macfuse sshfs # Mac

```

### SSH Config Setup
Edit `~/.ssh/config` with your servers:
```ssh-config
Host myserver
  HostName 192.168.1.100
  User youruser
  Port 22
  IdentityFile ~/.ssh/id_rsa
```

### Remote SSH Commands
| Key | Action |
|-----|--------|
| `Space rc` | Connect to remote SSH server |
| `Space re` | Edit remote files (fuzzy finder) |
| `Space rd` | Disconnect from remote server |
| `:RemoteSSHFSConnect` | Connect to SSH host (command) |
| `:RemoteSSHFSEdit` | Open remote file picker (command) |
| `:RemoteSSHFSDisconnect` | Disconnect from host (command) |
| `:RemoteSSHFSInfo` | Show connection info |

### Workflow
1. `Space rc` - Select server from SSH config
2. Enter remote path (e.g., `/home/user/project`)
3. `Space ff` or `Space re` - Browse/edit remote files
4. Edit and save normally (`:w` saves to remote)
5. `Space rd` - Disconnect when done

## Terminal

| Key | Action |
|-----|--------|
| `:terminal` or `:term` | Open terminal |
| `Ctrl+\` then `Ctrl+n` | Exit terminal mode (default) |
| `Esc` | Exit terminal mode (custom mapping) |

## Custom Python Shortcuts

| Key | Action |
|-----|--------|
| `Space p` | Run current Python file |
| `Space P` | Run test.py |
| `Space T` | Run test.py in split terminal |

## Modes

| Mode | How to Enter | How to Exit |
|------|--------------|-------------|
| Normal | `Esc` | n/a (default mode) |
| Insert | `i`, `a`, `o`, etc. | `Esc` |
| Visual | `v` (char), `V` (line), `Ctrl+v` (block) | `Esc` |
| Command | `:` | `Esc` or `Enter` |
| Terminal | `:term` | `Esc` or `Ctrl+\ Ctrl+n` |

## Tips

- **Leader key**: Default is `\`, but commonly remapped to `Space`
- **Leader sequences**: Tap leader, then tap next key (don't hold)
- **Example**: `Space ff` means tap Space, release, then tap `f` twice
- Press `:checkhealth` to diagnose issues
- Press `:Lazy` to manage plugins
- Press `:help <topic>` to learn more about any command
