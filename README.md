# AstroNvim Template

**NOTE:** This is for AstroNvim v5+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/bvicenzo/astro_nvim ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

#### Updating repo with template

#### Configuring

```shell
git remote add template https://github.com/AstroNvim/template.git
```

#### Updating

```shell
git fetch --all
git merge template/main --allow-unrelated-histories
```

### Customize


### User Options

See https://github.com/bvicenzo/astro_nvim/blob/master/lua/user/options.lua.

## User Mappings

See https://github.com/bvicenzo/astro_nvim/blob/master/lua/plugins/mappings.lua.

## Plugins

Add a lua module at [plugins](https://github.com/bvicenzo/astro_nvim/tree/master/lua/plugins) folder.
