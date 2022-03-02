name: Shellcheck

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  shellcheck:
    name: Shellcheck
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run ShellCheck
      uses: ludeeus/action-shellcheck@master
