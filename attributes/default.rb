#
# Cookbook Name:: kitchen-ohai
# Attributes:: default
# Author:: Baptiste Courtois (<b.courtois@criteo.com>)
#
# Copyright (C) 2016, Criteo.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Set default values for kitchen-ohai attributes
default['kitchen_ohai']['dependencies'] = []
default['kitchen_ohai']['values'] = {}

# Load attributes files declared as dependencies
node['kitchen_ohai']['dependencies'].each do |dependency|
  include_attribute dependency
end

# Override ohai!
node['kitchen_ohai']['values'].each do |ohai, value|
  automatic_attrs[ohai] = value
end
