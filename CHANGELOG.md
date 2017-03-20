# locale Cookbook CHANGELOG

This file is used to list changes made in each version of the locale cookbook.

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
