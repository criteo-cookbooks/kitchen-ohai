kitchen-ohai Cookbook
=====================
[![Cookbook Version][cookbook_version]][cookbook]
[![Build Status][build_status]][build_status]

Overrides ohai attributes in your kitchen-tests. **This should not be used in a production environment.**

Usage
-----
This cookbook allows you to override ohai attributes in a test-kitchen context:

1. Include `kitchen-ohai` in your suite runlist.
2. Declare the ohai values in the `kitchen_ohai.values` attributes in your suite.

Here is an example of `.kitchen.yml` file overriding os and platform ohai with insane values:

```yaml
---
driver:
  name: vagrant

platforms:
- name: centos-7.2

suites:
- name: default
  run_list:
  - recipe[kitchen-ohai]
  - recipe[my_cookbook::my_recipe]
  attributes:
    kitchen_ohai:
      values:
        platform: linux
        platform_version: 42
        os: windows
```

In some cases, you might want to include some attributes files _before_ overriding Ohai attributes.
You just need to declare these attributes files as dependencies:

```yaml
---
driver:
  name: vagrant

platforms:
- name: windows2012r2

suites:
- name: default
  run_list:
  - recipe[kitchen-ohai]
  - recipe[my_cookbook::my_recipe]
  attributes:
    kitchen_ohai:
      dependencies:
      - my_cookbook::my_attribute_file
      values:
        my_ohai: overriden_value
```


Attributes
----------
This cookbooks exposes 2 attributes:

* `kitchen_ohai.dependencies` - List of attributes file that must be included before overriding ohai - default `[]`.
* `kitchen_ohai.values` - Map of ohais attribute to override - default `{}`.

Recipes
-------

### kitchen-ohai::default
Convenient recipe to allow you to include this cookbook in your kitchen runlist.

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: [Baptiste Courtois][annih] (<b.courtois@criteo.com>)

```text
Copyright 2016, Criteo.

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

[annih]:                    https://github.com/Annih
[repository]:               https://github.com/criteo-cookbooks/kitchen-ohai
[build_status]:             https://api.travis-ci.org/criteo-cookbooks/kitchen-ohai.svg?branch=master
[cookbook_version]:         https://img.shields.io/cookbook/v/kitchen-ohai.svg
[cookbook]:                 https://supermarket.chef.io/cookbooks/kitchen-ohai
