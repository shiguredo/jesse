# jesse

**時雨堂による [for-get/jesse](https://github.com/for-get/jesse) の fork**

Upstream へのマージは想定しておらず、独自で改善をしていくという方針。将来的には最新の JSON Schema に対応していきたい。

## Upstream との差分

- jsx と rfc3339 への依存を削除
- jsx 部分を [jsone](https://github.com/sile/jsone) に変更
- OTP 最新版のみに対応
- Rebar3 最新版のみに対応
- JSON Schema draft 6 のみに対応
- CI でテストが通るように修正
- proper を master に切り替え
- [efmt](https://github.com/sile/efmt) を適用
- applications は jsone のみに変更
- Makefile を整理
- edoc 削除

## 方針

- コードの変更は積極的に行う
- Upstream へのマージは想定しない
