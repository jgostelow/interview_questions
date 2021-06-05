# Yaml to JSON API

This challenge is designed to evaluate a candidate's testing skills. The provided code implements a Yaml to JSON API in Ruby and Sinatra with a custom `to_json` implementation. The candidate should be prompted to add tests and improve the quality of the code.

## Scoring

Points for:

- Demonstrating how to write unit tests in Ruby for the custom to_json implementation
- Refactoring to_json code to make each data type testable (e.g. a test for “converts arrays to json”)
- Identifying a bug / missed edge case (provided code doesn’t handle floats and nils)
- Identifying a bug we weren’t aware of (there may be more)
- Fixing the identified bugs
- Adding an integration test for the API endpoint
- Being able to articulate when to use integration tests vs unit tests