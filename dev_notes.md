# Dotfiles dev notes

## Notes

### 10/5/2018

Questions for Karns:
* What's with ".bash" versus ".sh" extensions, and what do we think about not using a suffix at all?
    * often .sh used for files that will be sourced
    * use none for bin
* Do I have the simplest and idiomatic way to get an absolute path for finding things?
    * seems OK
* I chose to just use "${VARIABLE_NAME}" everywhere, izzat over the top?
* Would it be nifty to introduce a `libexec` folder for the things under unit test that are NOT meant to be called directly? (link_file.sh, run_hook.sh, unlink_file.sh)
    * nah, not gonna do this

```
./bin/bootstrap.sh ./files
```

xdg

ssh Include directive

### 6/26/2018

https://github.com/koalaman/shellcheck/issues/417

### 6/24/2018

This should work, if there is a link that points to source managed by us,
then safe to unlink

```
readlink -n ~/test_file_yo
find $PWD -type f -name "test_file_yo"
```
