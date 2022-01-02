# stdlib_modules
## io
- module name: `stdlib_io`, `stdlib_io_npy`
- dependent branches: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm, stdlib_ascii, stdlib_error, stdlib_string_type
- reference: add following to your `fpm.toml`.

```toml
[dependencies]
stdlib_io = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_io-fpm"}
```
