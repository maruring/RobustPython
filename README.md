# RobustPython

Pythonクリーンで保守しやすいコードを書くために勉強する
[ロバストpython](https://www.oreilly.co.jp/books/9784814400171/)

# 1章 ロバストpython入門

コードの意図を未来に伝える

コレクション型でも様々な型がある

- リスト
- 文字列
- ジェネレーター
- タプル
- 集合

なぜ関数では**なぜリストが使用されているか**を使っているかを未来の開発者にコードを通して伝えていかなくてはいけない

# 3章 型アノテーション

## 型アノテーションとは何か

- 型アノテーションは型ヒントとして機能する

- コードの読み手にヒントを提供するが実行時にpythonが使用する情報ではない

- 型ヒントに逆らってもエラーは起きない

## 型アノテーションの利点

- 型アノテーションを入れればpython対応のエディタの多くは自動補完で、その変数が可能な操作を指し示す
- 静的解析ツールを使用することでアノテーションをチェックして、不適切な個所を指摘することができる
- テストやコードレビューの前に早い段階でバグを発見でき、時間とコストを削減できる
- Pythonの動的型付けを保ったまま、静的型付けのメリットを与える
- 型アノテーションは簡単に付け加えることができるが、つけすぎると逆にコストの方が大きくなる

### クラスの型チェッカはどのような場合に使うべきか

- 他のモジュールや利用者が呼び出すとき(公開API, ライブラリのエントリポイントなど)
- 型が複雑で、わかりにくい場合
- mypyがデータ型を指定すように指示する場所(一般に空のコレクションへの代入をするところ)

# 4章 制約型
