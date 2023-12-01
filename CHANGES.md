# CHANGES

## shiguredo

## 2023.2.0

- [ADD] rebar3_hex プラグインを追加
  - @voluntas
- [CHANGE] JSON Schema draft 6 以外は削除
  - @voluntas
- [CHANGE] proper を master に切り替えて profile test 時のみ利用する用に変更
  - @voluntas
- [CHANGE] docker 関連を削除
  - @voluntas
- [CHANGE] edoc 関連を削除
  - @voluntas
- [CHANGE] jsone を追加
  - @voluntas
- [CHANGE] jsx を依存から削除
  - @voluntas
- [CHANGE] rfc3339 を依存から削除
  - @voluntas
- [CHANGE] ci.yml を書き換え
  - @voluntas
- [CHANGE] make ci を追加
  - @voluntas
- [CHANGE] rebar.config を書き換え
  - @voluntas
- [CHANGE] rebar3 3.22.1 を追加
  - @voluntas
- [CHANGE] OTP 26.1 以上のみの対応に書き換え
  - @voluntas
- [CHANGE] 不要なファイル削除
  - @voluntas

## 2023.1.1

- [FIX] efmt 用に入れていた `-ifdef` の使い方が間違っていたのを修正する
  - @sile

## 2023.1.0

- [CHANGE] hex のパッケージ名を shiguredo_jesse に変更する
  - @sile
- [UPDATE] efmt を適用する
  - @sile
- [FIX] OTP の master ブランチでコンパイル可能にする
  - 0.0 にパターンマッチする箇所で警告が出ていたので `==` での比較に置換した
  - @sile
