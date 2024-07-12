# Sublayer TDD Agent

## Description

Pair with an LLM that continuously watches a test file and an implementation file for changes.
If any changes are detected, it runs the tests. If they fail it tries to
generate a new version of the implementation file and runs the tests again until
they pass.

Usage:
`bundle install`

`./exe/testing_agent pair_on <implementation_file_path> <test_file_path>`

Example:
`./exe/testing_agent pair_on santa.rb santa_spec.rb`
