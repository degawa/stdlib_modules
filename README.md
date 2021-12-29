# stdlib_modules

## 動機
このリポジトリでは，Fortran stdlibの各モジュールを，独立したfpmプロジェクトとして提供することを目的としています．
fpmプロジェクトの依存プロジェクトにstdlibを追加した場合，プロジェクトの規模が小さくても，stdlibのビルドに起因して，プロジェクト全体のビルド時間が長くなります．このような，非常に個人的な不満を解決する一つの方法として，stdlibの各モジュールを，独立したfpmプロジェクトとして切り出してみることにしました．

fpmは，Fortranにとって革新的なソフトウェアです．単体アプリケーションのプロジェクト管理にfpmを使うだけでも便利ですが，他のfpmプロジェクトと連携をする場合にその真価を発揮します．また，Fortran stdlibもFortranに足りなかった多くの機能を提供しており，Fortranの利便性を大幅に改善します．
fpmを用いると，設定を一行追加するだけで，依存プロジェクトをgithubなどオンラインのgitリポジトリから取得できるようになります．私は，この簡便さに甘え，stdlibは常にGitHubから取得しています．しかし，規模は小さいがビルド（たとえば異なるコンパイラでのビルド，コンパイラオプションの指定）に試行錯誤を要するプロジェクトを作成した際に，stdlibのビルドに起因して，プロジェクト全体のビルド時間が長くなることに不満を持つようになりました．

当然，stdlibをローカルにインストールして，インストールされたライブラリを参照することは可能です．しかしながら，他人に使ってもらうことを想定すると，ライブラリのインストールを要求するよりも，オンラインから取得するようにした方が楽であることは，多くの人が賛同してくれると思います．
また，stdlibは古いコンパイラでのビルドをサポートしていません．これは，一部のモジュールに使われている機能が原因であり，全てのモジュールが古いコンパイラでビルドできないわけではありません．日本の製造業では，バージョンを指定して古いコンパイラを使い続けている事例があります．stdlibの一部のモジュールだけを使いたいが，使わない機能が原因でビルドできないという事態に対して，このリポジトリは解決策を導いてくれるかもしれません．

## 注意
- このリポジトリは，fortran-langの公式とは関係ありません．
- ブランチに個別のモジュールを含むfpmプロジェクトを作成しており，masterリポジトリの内容に特に意味はありません．
- このリポジトリは試行目的で作成しており，stdlibのバージョンアップに追従するとは限りません．

## 内容
stdlibの各モジュールを個別に含むfpmプロジェクトを作成し，対応するブランチに置いている．

### array
- モジュール: `stdlib_array`
- ブランチ: stdlib_array-fpm
- 依存ブランチ: stdlib_version-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_array = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_array-fpm"}
```

### ascii
- モジュール: `stdlib_ascii`
- ブランチ: stdlib_ascii-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_ascii = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_ascii-fpm"}
```

### bitsets
- モジュール: `stdlib_bitsets`
- ブランチ: stdlib_bitsets-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_bitsets = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_bitsets-fpm"}
```

### error
- モジュール: `stdlib_error`
- ブランチ: stdlib_error-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_optval-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_error = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_error-fpm"}
```

### hash
- モジュール: `stdlib_hash_32bit`, `stdlib_hash_64bit`
- ブランチ: stdlib_hash-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_hash = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_hash-fpm"}
```

### io
- モジュール: `stdlib_io`, `stdlib_io_npy`
- ブランチ: stdlib_io-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm, stdlib_ascii, stdlib_error, stdlib_string_type
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_io = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_io-fpm"}
```

### kinds
- モジュール: `stdlib_kinds`
- ブランチ: stdlib_kinds-fpm
- 依存ブランチ: stdlib_version-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_kinds = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_kinds-fpm"}
```

### linalg
- モジュール: `stdlib_linalg`
- ブランチ: stdlib_linalg-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_linalg = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_linalg-fpm"}
```

### logger
- モジュール: `stdlib_logger`
- ブランチ: stdlib_logger-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_ascii-fpm, stdlib_optval-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_logger = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_logger-fpm"}
```

### math
- モジュール: `stdlib_math`
- ブランチ: stdlib_math-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_math = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_math-fpm"}
```

### optval
- モジュール: `stdlib_optval`
- ブランチ: stdlib_optval-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_optval = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_optval-fpm"}
```

### quadrature
- モジュール: `stdlib_quadrature`
- ブランチ: stdlib_quadrature-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_specialfunctions-fpm, stdlib_error-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_quadrature = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_quadrature-fpm"}
```

### random
- モジュール: `stdlib_random`
- ブランチ: stdlib_random-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm, stdlib_error-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_random = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_random-fpm"}
```

### selection
- モジュール: `stdlib_selection`
- ブランチ: stdlib_selection-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_selection = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_selection-fpm"}
```

### sorting
- モジュール: `stdlib_sorting`
- ブランチ: stdlib_sorting-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm, stdlib_string_type-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_sorting = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_sorting-fpm"}
```

### specialfunctions
- モジュール: `stdlib_specialfunctions`
- ブランチ: stdlib_specialfunctions-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_specialfunctions = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_specialfunctions-fpm"}
```

### stats
- モジュール: `stdlib_stats`
- ブランチ: stdlib_stats-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm, stdlib_error-fpm, stdlib_linalg-fpm, stdlib_selection-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_stats = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_stats-fpm"}
```

### stats_distribution_normal
- モジュール: `stdlib_stats_distribution_normal`
- ブランチ: stdlib_stats_distribution_normal-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_error-fpm, stdlib_random-fpm, stdlib_stats_distribution_uniform-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_stats_distribution_normal = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_stats_distribution_normal-fpm"}
```

### stats_distribution_uniform
- モジュール: `stdlib_stats_distribution_uniform`
- ブランチ: stdlib_stats_distribution_uniform-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_error-fpm, stdlib_random-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_stats_distribution_uniform = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_stats_distribution_uniform-fpm"}
```

### string_type
- モジュール: `stdlib_string_type`
- ブランチ: stdlib_string_type-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm, stdlib_ascii-fpm, stdlib_strings-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_string_type = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_string_type-fpm"}
```

### stringlist_type
- モジュール: `stdlib_stringlist_type`
- ブランチ: stdlib_stringlist_type-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_math-fpm, stdlib_string_type-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_stringlist_type = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_stringlist_type-fpm"}
```

### strings
- モジュール: `stdlib_strings`
- ブランチ: stdlib_strings-fpm
- 依存ブランチ: stdlib_version-fpm, stdlib_kinds-fpm, stdlib_optval-fpm, stdlib_ascii-fpm, stdlib_string_type-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_strings = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_strings-fpm"}
```

### system
- モジュール: `stdlib_system`
- ブランチ: stdlib_system-fpm
- 依存ブランチ: stdlib_version-fpm
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_system = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_system-fpm"}
```

### version
- モジュール: `stdlib_version`
- ブランチ: stdlib_version-fpm
- 依存ブランチ:
- 参照方法: `fpm.toml`に下記を追記する．

```toml
[dependencies]
stdlib_version = {git = "https://github.com/degawa/stdlib_modules", branch="stdlib_version-fpm"}
```
