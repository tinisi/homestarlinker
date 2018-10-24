## `~ * $(ln -s .dotfile)`

### Usage

To install things
```
./bin/bootstrap "/path/to/dotfiles/repo"
```

To cleanup/remove things
```
./bin/cleanup "/path/to/dotfiles/repo"
```

### Testing

Install `bats-core` using Homebrew or otherwise get it in your path by [cloning the repo](https://github.com/bats-core/bats-core).

Run the test files using the bats cli
```
bats test/*.bats test/**/*.bats
```

### Linting

Install shellcheck using homebrew or the Linux package manager of your choice.

```
shellcheck --check-sourced --external-sources bin/*
```
