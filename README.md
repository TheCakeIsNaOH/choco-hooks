# Choco Hooks

## Disclaimer

This project is not associated with Chocolatey Software, Inc.

Installing the `choco-hooks.extension` package will modify a file in your install of choco. 
Therefore, please DO NOT contact Chocolatey support with any issues if this is installed. 
Report them to the issue tracker here instead.

## What is this

This is a modification to choco that allows you to run PowerShell scripts before and after the scripts in Chocolatey package run.

The hook scripts can be run for all packages, or for a specific package id. They can be run for only install/uninstall/modify, or they can be run for all.

It is an implementation of [this choco feature request](https://github.com/chocolatey/choco/issues/1185).

## Installation

#### Prerequisites:
1. Make sure you are running choco `0.10.15` or `0.10.16-beta-20200806`. 
2. Run `choco pin add -n chocolatey`, which prevents choco from upgrading until you are ready.

#### Install from git
1. Clone or otherwise acquire this repository 
2. Run `choco pack` in the `choco-hooks.extension` directory
3. Run `choco install choco-hooks.extension -s .` in the `choco-hooks.extension` directory

#### Install from <TODO>

**TODO** Add instructions for install for repository

## Uninstallation

1. Uninstall any `.chook` packages you have installed.
2. `choco uninstall choco-hooks.extension`
3. `choco pin remove -n chocolatey`
4. Remove `$env:ChocolateyInstall\choco-hooks\`


## Skip running hooks

Hook scripts can be skipped by adding the `/SKIPHOOKS` package parameter, like `--params="'/SKIPHOOKS'"`

## How to add hook scripts

### About hook scripts

Name in the format: `time_type_id.ps1`. 

- Time is either `pre` or `post`, to run before or after the package script. 
- Type is `install`, `uninstall`, `modify` or `any`, which will run for `chocolateyInstall.ps1`, `chocolateyUninstall.ps1`, `chocolateyBeforeModify.ps1` and any of those, respectively.
- ID is the id of the package you want it to run for. Alternatively `all` can be used used to run for all packages.

So `pre_install_all.ps1` would run before `chocolateyInstall.ps1` for all packages. Or `post_uninstall_firefox.ps1` would run after `chocolateyUninstall.ps1` 

Feel free to add other `.ps1` files with other names that contain common functions or similar. Script that do not match the naming will be ignored.

The script should have access to all the functions and environment variables a package script has. See [here for a reference](https://docs.chocolatey.org/en-us/create/functions/) for the ones built in to choco.

### Manual

Create a folder under `$env:ChocolateyInstall\choco-hooks\` and place your `.ps1` scripts in it. 
I would suggest naming starting with an underscore (`_`), to make sure that it does not get overwritten by a `.chook` package.

### Via a .chook package

- Create a package with an ID ending in `.chook` or `.chook.extension`. 
- Add a folder in the top level of the package called `hook`
- Put your hook scripts in the hook dir
- Pack and install the package. 

**NOTE:** Make sure you keep the `chocolateyInstall.ps1` and `chocolateyUninstall.ps1` scripts in the package, otherwise the hooks will not be copied/removed. They can be empty, but they need to exist in the package.

## Limitations

The main limitation of this is that hook scripts will not be triggered if a package does not have scripts.

## What not implement this directly in choco

In the [choco feature request](https://github.com/chocolatey/choco/issues/1185), it is unclear if hooks are a feature that would go in open source Choco, or in the licensed extension. 
There has been no clarification on that point, even after asking. 

From what I can tell from [public statements](https://web.archive.org/web/20210323165032/https://github.com/chocolatey/choco/issues/2139#issuecomment-713112049), it is the current policy that pull requests which implement features from the licensed version of Chocolatey are automatically closed, and will not be accepted.
Therefore, until there is clarification on where hooks would end up in choco, it is pointless to work on implementing this in upstream choco.

Secondarily, since choco 0.10.15 released in early 2019, there has been not very much work done on FOSS choco, as Chocolatey committers are working on things for licensed editions instead. 
From what I can tell from public statements, the next major activity on FOSS choco might start at the end of 2021. I want hooks before that.

