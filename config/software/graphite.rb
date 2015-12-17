#
# Copyright:: Copyright (c) 2012 Opscode, Inc.
# License:: Apache License, Version 2.0
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

name "graphite"
default_version "0.9.15"

dependency "python"
dependency "pip"
dependency "python-django"
dependency "python-django-tagging"
dependency "python-cairo"
dependency "python-sqlite"

build do
  command "#{install_dir}/embedded/bin/pip install --build #{project_dir} \
           --install-option=\"--prefix=#{install_dir}/embedded\" \
           whisper==#{version}"
  command "#{install_dir}/embedded/bin/pip install --build #{project_dir} \
           --install-option=\"--prefix=#{install_dir}/embedded\" \
           --install-option=\"--install-lib=#{install_dir}/embedded/lib/python2.7/site-packages\" \
           --install-option=\"--install-data=#{install_dir}/embedded/service/#{name}\" \
           carbon==#{version}"
  command "#{install_dir}/embedded/bin/pip install --build #{project_dir} \
           --install-option=\"--prefix=#{install_dir}/embedded\" \
           --install-option=\"--install-lib=#{install_dir}/embedded/service/#{name}/webapp\" \
           --install-option=\"--install-data=#{install_dir}/embedded/service/#{name}\" \
           graphite-web==#{version}"
end

