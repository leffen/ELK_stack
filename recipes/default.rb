#
# Cookbook Name:: ELK_stack
# Recipe:: default
#
# Copyright (C) 2014, Rackspace, US Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Set repos up first so debian based can have its apt caches rebuilt.
case node['platform_family']
when 'rhel'
  include_recipe 'ELK_stack::redhat_repos'
when 'debian'
  include_recipe 'ELK_stack::debian_repos'
end

[
  'ELK_stack::elasticsearch',
  'ELK_stack::logstash',
  'ELK_stack::kibana'
].each do |recipe|
  include_recipe recipe
end
