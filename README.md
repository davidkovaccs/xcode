Apple Xcode Cookbook
==============

Installs Apple Xcode OS X Lion, Mountain Lion, Mavericks, Yosemite, El Capitan and Sierra. Xcode command
line tools are installed through the [build-essential](https://supermarket.chef.io/cookbooks/build-essential).

limitations
-----------

The cookbook does not yet support installation of Xcode > 8 which comes as a XIP archive, this is being worked on.
Requirements
------------

#### Platforms

* `mac_os_x`

#### Cookbooks

* `dmg`

The DMGs are not accessible from Apple directly without logging into the developer center,
you must place the DMGs on your own fileserver and list them in a data bag on your Chef server.

#### LWRP

With the 2.0.0 release this cookbook no longer installs Xcode directly from the default recipe.
Instead the cookbook now provides a LWRP to install Xcode with the options (default) to install multiple versions,
side by side. This side-by-side installation is especially useful for those that run build farms and need to
support multiple Xcode versions.

Attributes
----------

default['xcode']['databag'] = 'xcode_versions'
default['xcode']['install_root'] = nil

| Key                            | Type   | Description                             | Default                  |
|--------------------------------|--------|-----------------------------------------|--------------------------|
| `['xcode']['databag']`         | String | URL to the data bag on the Server that  | `xcode_verions`          |
|                                |        | contains the Xcode versions to install  |                          |
| `['xcode']['install_root']`    | String | Checksum of the Xcode DMG               | `nil`                    |


Usage
-----

Just include `xcode` in your node's `run_list` this will ensure that the `dmg` cookbook is included and then you
can access the `xcode_app` resource.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[xcode]"
  ]
}
```

Bugs
----

Supports Mac OS X 10.7 and higher. Pull requests are welcome!

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Submit a Pull Request using Github

License and Authors
-------------------

* Author: Julian C. Dunn (<jdunn@aquezada.com>)
* Contributor: Antoni S. Baranski (<antek@roblox.com>)
* License: Apache 2.0
