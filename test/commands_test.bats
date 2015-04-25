#!/usr/bin/env bats

load test_helper

setup() {
  dokku apps:create testapp
}

teardown() {
  rm -rf "$DOKKU_ROOT"
}

@test "prebuild requires an app name" {
  run dokku prebuild
  assert_exit_status 1
  assert_output "(verify_app_name) APP must not be null"
}

@test "prebuild:set creates script" {
  run bash -c "dokku prebuild:set testapp < test/testscript.sh"
  assert_success
  assert_exists "$SCRIPT_PATH"
  assert_output "-----> Setting prebuild script for testapp"
  run dokku prebuild testapp
  assert_contains "$output" "abc"
}

@test "prebuild:delete deletes script" {
  run bash -c "dokku prebuild:set testapp < test/testscript.sh"
  assert_success
  assert_exists "$SCRIPT_PATH"
  run dokku prebuild:delete testapp
  assert_success
  assert_output "-----> Deleting prebuild script for testapp"
  assert_not_exists "$SCRIPT_PATH"
}
