# locale Cookbook CHANGELOG

This file is used to list changes made in each version of the locale cookbook.

## 2.1.0 (2018-08-10)

- Add a new locale resource, which is now the preferred way to use this resource. The recipe will continue to work, but in the future this resource will be included in chef-client and the cookbook will be deprecated. Thanks @damacus for this work.
- Attempt to reload i18n content properly 
- Convert testing to Inspec
- Require chef 12.7 or later
- Don't check for LC_ALL on systemd based hosts
- Avoid trying to set locale every time on systemd hosts

## 2.0.1 (2017-03-20)

- Fix the version badge in the readme
- Testing updates to check for Chef 13 compat
- Test with Local Delivery and not Rake
- Add a basic chefspec testing

## 2.0.0 (2016-09-09)

- Require Chef 12.1
- Add linting, unit and integration testing in Travis CI
- Add contributing and testing docs
- Add license file
- Add maintainers files
- Add oracle to the metadata
- Update the readme with an expanded requirements section and license information
- Don't both installing locales since the cookbook will never to to the package resource if locales isn't already installed
