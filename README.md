dokku-prebuild [![Build Status](https://travis-ci.org/krisrang/dokku-prebuild.svg?branch=master)](https://travis-ci.org/krisrang/dokku-prebuild)
================

dokku-prebuild is a plugin for [dokku][dokku] that allows you to run allows you to run external scripts before build during deploy.

This version is tested against dokku 0.3.17.

## Installation

```
git clone https://github.com/krisrang/dokku-prebuild /var/lib/dokku/plugins/prebuild
```


## Commands
```
$ dokku help
    prebuild            <app>                       Show contents of prebuild script for <app>
    prebuild:set        <app> < <filename>          Set script to run before build for <app>
    prebuild:delete     <app>                       Delete prebuild script for <app>
```

## Usage

### Set prebuild script:
```
$ dokku prebuild:set testapp < example.sh             # Server side
$ ssh dokku@server prebuild:set testapp < example.sh  # Client side
```

### Remove prebuild script:
```
$ dokku prebuild:delete testapp             # Server side
$ ssh dokku@server prebuild:delete testapp  # Client side
```

### Show prebuild script:
```
$ dokku prebuild testapp            # Server side
$ ssh dokku@server prebuild testapp # Client side
```

## License

This plugin is released under the MIT license. See the file [LICENSE](LICENSE).

[dokku]: https://github.com/progrium/dokku
