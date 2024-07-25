[![Grunt Test](https://github.com/ckng/chosen/actions/workflows/npm-grunt-test.yml/badge.svg)](https://github.com/ckng/chosen/actions/workflows/npm-grunt-test.yml)[![Build and Release](https://github.com/ckng/chosen/actions/workflows/release.yml/badge.svg)](https://github.com/ckng/chosen/actions/workflows/release.yml)[![Deploy static content to Pages](https://github.com/ckng/chosen/actions/workflows/static.yml/badge.svg?branch=master)](https://github.com/ckng/chosen/actions/workflows/static.yml)
# This library is old and abandoned
This repo existed solely as a way to merge incomplete PR's into the most recent (also abandoned) fork of chosenJS
If you are trying to start a new project with this library
- Don't do it
- Accept that this will likely never be updated

## Replace Drupal chosen/chosen_lib module libraries.
Extract the released zip into THEMES/js/chosen, for example, where THEME is your theme name.

In your THEME.libraries.yml:
```
chosen:
  remote: https://github.com/ckng/chosen
  version: 2.2.1
  license:
    name: MIT
    url: https://github.com/ckng/chosen/blob/master/LICENSE.md
    gpl-compatible: true
  js:
    js/chosen/chosen.jquery.min.js: { minified: true }
  dependencies:
    - core/jquery

chosen.css:
  version: 2.2.1
  css:
    component:
      js/chosen/chosen.css: {}
```

In your THEME.info.yml, override fully the default from chosen_lib.
```
libraries-override:
  chosen_lib/chosen: THEME/chosen
  chosen_lib/chosen.css: THEME/chosen.css

```

# Chosen

Chosen is a library for making long, unwieldy select boxes more user friendly.

- jQuery support: 1.7+
- Prototype support: 1.7+

For **documentation**, usage, and examples, see:
https://ckng.github.io/chosen/

For **downloads**, see:
https://github.com/ckng/chosen/releases/

### Package managers
This fork is not available on Package Managers
Please use this repo [harvest/chosen](https://github.com/harvesthq/chosen)

### Contributing to this project

We welcome all to participate in making Chosen the best software it can be. The repository is maintained by only a few people, but has accepted contributions from over 50 authors after reviewing hundreds of pull requests related to thousands of issues. You can help reduce the maintainers' workload (and increase your chance of having an accepted contribution to Chosen) by following the
[guidelines for contributing](contributing.md).

* [Bug reports](contributing.md#bugs)
* [Feature requests](contributing.md#features)
* [Pull requests](contributing.md#pull-requests)

### Chosen Credits

- Concept and development by [Patrick Filler](http://patrickfiller.com) for [Harvest](http://getharvest.com/)
- Forked from [JJJ/chosen](https://github.com/JJJ/chosen)
- Design and CSS by [Matthew Lettini](http://matthewlettini.com/)
- 1.8.x and earlier maintained by [@pfiller](http://github.com/pfiller), [@kenearley](http://github.com/kenearley), [@stof](http://github.com/stof), [@koenpunt](http://github.com/koenpunt), and [@tjschuck](http://github.com/tjschuck)
- 2.0.x and later maintained by [@ckng](http://github.com/ckng) and contributors
- Chosen includes [contributions by many fine folks](https://github.com/harvesthq/chosen/contributors)
