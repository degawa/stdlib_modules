# stdlib_modules
## hash
- module name: `stdlib_hash_32bit`, `stdlib_hash_64bit`
- dependent branches: stdlib_version-fpm, stdlib_kinds-fpm
- reference: add following to your `fpm.toml`.

```toml
[dependencies]
stdlib_hash = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_hash-fpm"}
```
