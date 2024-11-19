# jesse

![GitHub Actions workflow](https://github.com/shiguredo/jesse/actions/workflows/ci.yml/badge.svg)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

**時雨堂による [for-get/jesse](https://github.com/for-get/jesse) の fork**

Upstream へのマージは想定しておらず、独自で改善をしていくという方針。将来的には最新の JSON Schema に対応していきたい。

## 差分

- jsx と rfc3339 への依存を削除
- jsx 部分を [shiguredo_jsone](https://github.com/shiguredo/jsone) に変更
  - jsone:decode を proplist から map に変更
- OTP 最新版のみに対応
- Rebar3 最新版のみに対応
- elvis.config に切り替え
- JSON Schema draft 6 のみに対応
- CI でテストが通るように修正
- proper を master に切り替え
- [efmt](https://github.com/sile/efmt) を適用
- applications は jsone のみに変更
- Makefile を整理
- edoc 削除
- docker 関連を削除
- オリジナル README は README.original.md に移動
- オリジナル CHANGELOG は CHANGELOG.original.md に移動

## ライセンス

```text
Copyright 2012- Klarna AB
Copyright 2015- AUTHORS
Copyright 2023- Shiguredo Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
