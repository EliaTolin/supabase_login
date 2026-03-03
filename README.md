<div align="center">

<img src="image.png" alt="supawho" width="200" />

Switch between multiple Supabase accounts in seconds.<br>
Tokens are stored securely in **macOS Keychain**.

[![Supabase](https://img.shields.io/badge/Supabase-3FCF8E?logo=supabase&logoColor=fff)](#)
[![macOS](https://img.shields.io/badge/macOS-000000?logo=apple&logoColor=fff)](#)
[![Homebrew](https://img.shields.io/badge/Homebrew-FBB040?logo=homebrew&logoColor=fff)](#installation)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

---

## Installation

### Homebrew (recommended)

```bash
brew install EliaTolin/tap/supawho
```

### Manual

```bash
git clone git@github.com:EliaTolin/supawho.git
chmod +x supawho/supawho
```

Add to your shell config (`~/.zshrc` or `~/.bashrc`):

```bash
echo 'alias supawho="/path/to/supawho/supawho"' >> ~/.zshrc
source ~/.zshrc
```

---

## Getting your Supabase Access Token

Before using supawho, you need to generate an access token from the Supabase dashboard:

1. Go to [supabase.com/dashboard](https://supabase.com/dashboard) and click on your **profile icon** (top right)
2. Select **Account preferences**
3. Navigate to **Access Tokens** in the left sidebar
4. Click **Generate new token**, give it a name, and copy the token

> **Tip:** The token starts with `sbp_` and is shown only once — make sure to copy it!

Then save it with:

```bash
supawho add <name> <token>
```

---

## Usage

### Add an account

```bash
supawho add myproject sbp_xxxxxxxxxxxxx
```

### Switch account (interactive)

Run without arguments to select interactively:

```bash
supawho
```

```
   ___  _   _ ___  ___  _    _ _  _  ___
  / __|| | | | _ \/ _ \| |  | | || |/ _ \
  \__ \| |_| |  _/ (_) | |/\| | __ | (_)
  |___/ \___/|_|  \__\_\__/\__|_||_|\___/

     🔍 Who are you today?

Select an account:

  1) myproject
  2) another-project

Enter number (1-2):
```

### Switch account (direct)

```bash
supawho use myproject
```

### List saved accounts

```bash
supawho list
```

### Remove an account

```bash
supawho remove myproject
```

---

## How it works

| Step | What happens |
|------|-------------|
| `supawho add` | Saves the token in **macOS Keychain** |
| `supawho use` | Reads the token from Keychain and runs `supabase login --token` |
| `supawho remove` | Deletes the token from Keychain |

Your tokens never touch the filesystem — they live in the encrypted Keychain only.

---

## Requirements

- **macOS** (uses the `security` command for Keychain access)
- [**Supabase CLI**](https://supabase.com/docs/guides/cli) installed

---

## License

[MIT](LICENSE) — Made by [Elia Tolin](https://github.com/EliaTolin)
