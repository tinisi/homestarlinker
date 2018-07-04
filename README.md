## `~ * $(ln -s .dotfile)`

### Usage

To install things
```
./bin/bootstrap.sh
```

To cleanup/remove things
```
./bin/cleanup.sh
```

### Testing

Install `bats-core` using Homebrew or otherwise get it in your path by [cloning the repo](https://github.com/bats-core/bats-core).

Run the test files using the bats cli
```
bats test/test_test.bats
bats test/bin/test_link_file.bats
```

### Linting

Install shellcheck using homebrew or the Linux package manager of your choice.

```
shellcheck -ax bin/bootstrap.sh
```
