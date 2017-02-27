#!/usr/bin/env bash
repo_dir="$(dirname $0)/.."
# repo_dir=$(git rev-parse --show-toplevel)
. "${repo_dir}/bin/functions"

echo_subtitle "Running ${repo_dir}/bin/papply.sh --hiera_config=bin/hiera5.yaml"
"${repo_dir}/bin/papply.sh" --hiera_config="${repo_dir}/bin/hiera5.yaml" $*
