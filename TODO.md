# TODO

## Install script
- Param to Self-pin Chocolatey?
- Better method to check if it is pinned

#Package
- Fill in description

# Script runner
- check $env:CHOCOLATEY_VERSION?
- check that Chocolatey itself is pinned (.chocolatey ?)?
- Magic package parameter to skip running hooks

# Extension
- function for install of .chook packages

## Release
- Use MyGet as feed? Other software?

## Document?
- Can check id with `$env:chocolateyPackageName`
- Version with $env:chocolateyPackageVersion
- Should be able to use Get-PackageParameters
- Can see install script with $packageScript
- .chook how it works
- Note that old/removed hooks s are not removed upon upgrade unless a chocolateybeforemodify is included