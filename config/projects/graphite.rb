#
# Copyright 2015 Mike Clarke
#
# All Rights Reserved.
#

name "graphite"
maintainer "The Graphite Project"
homepage "http://graphite.readthedocs.org/en/latest/install.html"

# Defaults to C:/graphite on Windows
# and /opt/graphite on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# graphite dependencies/components
dependency "graphite"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
