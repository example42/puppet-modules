#!/usr/bin/env bash
repo_dir=$(git rev-parse --show-toplevel)
# repo_dir="$(dirname $0)/.."
. "${repo_dir}/bin/functions"

RUBY=$(which ruby)
mods=${1:-site}
role=${2:-none}

global_exit=0

if [ ! -z ${RUBY} ] ; then
  echo_title "Running bundle install"
  /opt/puppetlabs/puppet/bin/bundle install --with=integration --path=vendor
  echo_title "Running beaker"
  /opt/puppetlabs/puppet/bin/rake beaker_roles:psick
  if [ $? == 0 ]; then
    echo_success "OK"
  else
    echo_failure "ERROR"
    echo $err
    global_exit=1
  fi
else
  echo_warning "rake not found."
fi

exit $global_exit