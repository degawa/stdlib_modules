# stdlib_modules
## system
- module name: `stdlib_system`
- dependent branches: stdlib_version-fpm
- reference: add following to your `fpm.toml`. It is necessary to enable the C preprocessor specifying the compiler flags.

```toml
[dependencies]
stdlib_system = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_system-fpm"}
```
