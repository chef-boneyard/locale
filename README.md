# locale cookbook

[![Build Status](https://travis-ci.org/chef-cookbooks/locale.svg?branch=master)](http://travis-ci.org/chef-cookbooks/locale) [![Cookbook Version](https://img.shields.io/cookbook/v/locale.svg)](https://supermarket.chef.io/cookbooks/locale)

Sets the default system locale for this system. You can see which locales are available by running `locale -a`.

On Debian based systems, this recipe sets the locale by running `update-locale` and on Fedora, it uses `localectl`.

On RHEL based systems, the recipe operates on the /etc/sysconfig/i18n file directly because there is no standard command line tool to change the system locale settings.

## Requirements

### Platforms

- Debian / Ubuntu derivatives
- openSUSE / SUSE Linux Enterprises
- RHEL/CentOS/Scientific/Amazon/Oracle
- Fedora

### Chef

- Chef 12.7+

### Cookbooks

- none

## Attributes

- `node['locale']['lang']` -- the value for "LANG": defaults to "en_US.utf8"
- `node['locale']['lc_all']` -- the value for "LC_ALL": defaults to "en_US.utf8"

Note that you cannot set "LC_ALL" on Fedora. It is a documented limitation; see "man 5 locale.conf". So this recipe simply ignores LC_ALL for Fedora.

## Usage

Include the default recipe in your run list.

## Maintainers

This cookbook is maintained by Chef's Community Cookbook Engineering team. Our goal is to improve cookbook quality and to aid the community in contributing to cookbooks. To learn more about our team, process, and design goals see our [team documentation](https://github.com/chef-cookbooks/community_cookbook_documentation/blob/master/COOKBOOK_TEAM.MD). To learn more about contributing to cookbooks like this see our [contributing documentation](https://github.com/chef-cookbooks/community_cookbook_documentation/blob/master/CONTRIBUTING.MD), or if you have general questions about this cookbook come chat with us in #cookbok-engineering on the [Chef Community Slack](http://community-slack.chef.io/)

## License

**Copyright:** 2016-2018, Chef Software, Inc.

```
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
