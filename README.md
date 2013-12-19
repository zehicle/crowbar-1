# OpenCrowbar Documentation README

_This is not the documentation you are looking for, it is a pointer to the real documentation_

## Looking for Crowbar Resources?

[The Crowbar website](http://crowbar.github.io) has links to all information and is our recommended starting place.

## Specific Crowbar Documentation 

We track Crowbar documentation with the code so that we can track versions of documentation with the code.  It is located in the /doc directory.

## Background
Crowbar documentation is distributed into multiple places under the /doc directory of each Crowbar module (aka "barclamps").  When the modules are installed, Crowbar combines all the /doc directories into a master documentation set.  These directories are structured into subdirectories for general topics.  This structure is common across all barclamps in the [Crowbar project](https://github.com/crowbar/)

> Please, do NOT add documentation in locations besides /doc!  If necessary, expand this README to include pointers to important /doc information.

## Short Term notes for OpenCrowbar Development Environment

1. use the Crowbar ./dev tests setup to position gems
1. cd crowbar/rails
1. bundle install --verbose --path /tmp/crowbar-dev-test/gems
1. script/rails generate delayed_job:active_record
1. rake db:create db:migrate
1. script/delayed_job --queue=NodeRoleRunner -n 2 start
1. rails s Puma development
1. script/delayed_job stop
