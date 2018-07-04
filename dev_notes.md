# Dotfiles dev notes

## Notes

### 6/26/2018

https://github.com/koalaman/shellcheck/issues/417

### 6/24/2018

This should work, if there is a link that points to source managed by us,
then safe to unlink

```
readlink -n ~/test_file_yo
find $PWD -type f -name "test_file_yo"
```