#
# Author:: Antoni S. Baranski (<antek@roblox.com>)
# Copyright (C) 2016, ROBLOX, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
#
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Cookbook Name:: xcode-tests
# Recipe:: default
#

include_recipe 'xcode'

xcode_versions = data_bag(node['xcode']['databag'])

xcode_versions.each do |version|
  xcode = data_bag_item(node['xcode']['databag'], version)

  xcode_app xcode['id'] do
    url xcode['url']
    checksum xcode['checksum']
    app xcode['app']
    multi_install
    install_root node['xcode']['install_root'] unless node['xcode']['install_root'].nil?
    force xcode['force'] unless xcode['force'].nil?
    action xcode['action']
  end
end

include_recipe 'xcode::license'
