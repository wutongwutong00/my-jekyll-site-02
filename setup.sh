#!/bin/sh
# "#################################################"
# "This file is based on a Gist, located here:"
#    "https://gist.github.com/BillRaymond/db761d6b53dc4a237b095819d33c7332#file-post-run-txt"
# "#################################################"

# Allow all permissions for this folder, but skip the git files
# because changing permissions there causes errors.
#
# NOTE: take out the .git folder that comes with this repo
# for this step, and then add it back in afterwards. Changing
# permissions on git files leads to a misleading error that
# makes it seem like the build did not complete when it actually
# is fine.
chmod -R 777 .
chown -R root:root .

# Install dependencies
bundle install

# Create Jekyll site
bundle exec jekyll new . --force --skip-bundle

# NOTE: Jekyll has now overriden the original Gemfile
# needed to do the initial build.

# Configure Jekyll for GitHub Pages
bundle add "github-pages" --group "jekyll_plugins" --version 228

# Add webrick dependency removed by Ruby but needed by Jekyll
bundle add webrick
