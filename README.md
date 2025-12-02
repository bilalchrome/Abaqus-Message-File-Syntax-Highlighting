# ABAQUS Message File Syntax Highlighting for Vim and Neovim

## Introduction

This repository provides a Vim/Neovim **syntax file for ABAQUS message (`.msg`) files**, focused on the increment / iteration region where you actually debug convergence and contact issues.

It highlights, among other things:

- Step / increment headers and time increment summaries  
- Solver blocks (symmetric / unsymmetric hybrid direct sparse solver)  
- Convergence checks (equilibrium and severe discontinuity iterations)  
- Average and time-averaged forces/moments/fluxes  
- Largest residuals, increments and corrections  
- Contact penetration / force errors and constraint status  
- Warnings, errors, negative eigenvalues, “displacement increment too big”,  
  “strain increment has exceeded fifty times…”, “convergence judged unlikely…”, etc.  
- Final analysis and job time summaries  

The goal is to make it much easier to visually scan where and why a step or increment is failing.

---

## Installation

### 1. Put the syntax file in the right place

Assume the file in this repo is named `messagefile.vim`.

**Linux – Vim**

```bash
mkdir -p ~/.vim/syntax
cp messagefile.vim ~/.vim/syntax/
````

**Windows – Vim**

Copy `messagefile.vim` to:

```text
C:\Users\<Username>\vimfiles\syntax\
```

**Neovim (Linux / macOS)**

```bash
mkdir -p ~/.config/nvim/syntax
cp messagefile.vim ~/.config/nvim/syntax/
```

---

### 2. Tell Vim/Neovim to use this syntax for `.msg` files

#### Option A – Simple autocmd in your config

**Vim (`~/.vimrc` or `_vimrc`):**

```vim
augroup abaqus_msg
  autocmd!
  autocmd BufRead,BufNewFile *.msg set filetype=messagefile
augroup END
```

**Neovim (classic `init.vim`):**

```vim
augroup abaqus_msg
  autocmd!
  autocmd BufRead,BufNewFile *.msg set filetype=messagefile
augroup END
```

**Neovim (Lua `init.lua`):**

```lua
vim.api.nvim_create_augroup("abaqus_msg", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = "abaqus_msg",
  pattern = "*.msg",
  callback = function()
    vim.bo.filetype = "messagefile"
  end,
})
```

#### Option B – Use an `ftdetect` file (cleaner)

Create a directory and file:

```bash
mkdir -p ~/.vim/ftdetect         # or ~/.config/nvim/ftdetect for Neovim
echo 'au BufRead,BufNewFile *.msg set filetype=messagefile' \
  > ~/.vim/ftdetect/messagefile.vim
```

Now Vim/Neovim will automatically set `filetype=messagefile` for all `.msg` files.

---

## Usage

Once installed and filetype detection is set:

* Open any `*.msg` ABAQUS message file.
* Vim/Neovim will set `filetype=messagefile`, which loads `syntax/messagefile.vim`.
* You’ll see:

  * Increment blocks and convergence status highlighted as “headers” or “statements”.
  * Residuals / increments / corrections and “AT NODE … DOF …” lines highlighted as identifiers.
  * Warnings, negative eigenvalues, “displacement increment too big”, strain-increment warnings, etc. in warning colors.
  * Errors and runtime exceptions in error colors.

If syntax doesn’t load, check:

```vim
:set filetype?
:scriptnames | grep messagefile.vim
```

---

## Customization

The syntax file mostly uses `hi def link` to map its groups onto standard Vim highlight groups like `WarningMsg`, `ErrorMsg`, `Statement`, `Identifier`, etc.

You **don’t have to edit the syntax file** to tweak colors; instead, override the highlight groups in your colorscheme or after it’s loaded.

### Example: make warnings bold and more visible

Put this in your `~/.vimrc`, `init.vim`, or a colorscheme after-load hook:

```vim
" Make ABAQUS warnings louder
highlight abaqusWarning           ctermfg=Yellow ctermbg=NONE cterm=bold gui=bold
highlight abaqusNegEigenWarning   ctermfg=Red    ctermbg=NONE cterm=bold gui=bold
highlight abaqusDispIncTooBig     ctermfg=Red    ctermbg=NONE cterm=bold gui=bold
highlight abaqusConvUnlikely      ctermfg=Red    ctermbg=NONE cterm=bold gui=bold
highlight abaqusError             ctermfg=White  ctermbg=DarkRed cterm=bold gui=bold
```

You can run `:highlight` inside Vim to see all groups and adjust as you like.

---

## Contribution

Contributions are welcome:

* New patterns for message variants not currently covered.
* Better default linking to standard highlight groups.
* Examples of useful per-user customizations.

Please open an issue or pull request with:

* A short description of the change.
* A small sample of `.msg` text that demonstrates the pattern.

---

## License

This project is licensed under the **GNU General Public License v3.0**.
For more details, see the [GPL-3.0 License](https://www.gnu.org/licenses/gpl-3.0.en.html).
