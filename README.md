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

高度なアノテーションを使用することでデータ型に制約を加えて、データ型が表現できるものをさらに制限できる

最初から間違ったコードが書かれないように、システム内で矛盾するデータ型や無効なデータ型を物理的に作りこめないようにする

型アノテーションを適切に使用出来れば時間とコストを削減できる

## Optional型

コードベース内のNone参照を置き換える

以下のようなメリットがある

- Noneが返却される可能性を開発者に伝えることができる
- Noneが返却された場合は処理しなければいけないエラーが発生したことを開発者に伝えることができる
- Optional型を使用していない場合は、Noneが返却されていはいけないことを開発者に伝えることができる

## Union型

複数の型が同じ変数で使用されていることを示すデータ型

以下のようなメリットがある

- 引数に基づいて異なるデータ型のオブジェクトを返却することを開発者に伝えることができる
- Optionalと同じようにエラーを表す型を開発者に伝えることができる

### データ型の積と和

4つのメンバ変数を持つクラスが存在する場合、そのメンバ変数の組み合わせは以下のように積になる

A x B x C x D

成功系と失敗系でプロパティを分けることで組み合わせの数を少なくすることができる

(A x B) + (C x D)

## Literal型

データ型の状態の数を強制的に制限できる

変数の状態を制限できる場合に使用できる

python3.8以上で導入されている

## Annotated型

Literal型の進化したやつ

一定サイズ以上の文字列や正規表現にマッチする文字列だけに有効な値を制限できる

python3.9以上で導入されている

## NewType型

よく理解できないので、後で学習する

## Final型

変数の値が変更できないようする

定数として使用するような感じ

グローバル変数などスコープが広い変数で利用すると効果が得られやすい

# 5章 コレクション型

4章では単一(int, float, str)のアノテーション方法を学んだ

今回は辞書、リストやセットなどの複数の型が集合するコレクション型のアノテーションを学ぶ

## 同種コレクションと異種コレクション

同種コレクション → 収められた型がすべて同じ Ex. [5,6,7,8,9]

異種コレクション → 収められた型が異なる Ex. [5,"hoge", 6.247]

- 何をもって同種とするのかを意識する 単純にintだけがコレクションに入っていれば同種というわけではない
- Union型にアノテーションしたい型を詰め込みすぎるとコードが複雑になる
- Any型はすべてのデータが型が入ることをできるが、型アノテーションの目的が失われる

## TypeDict

Python3.8で導入された辞書に異種データを格納しなければならない場合のために作られた

## ジェネリックス

よく分からないので飛ばす

## 既存のデータ型の変更

辞書を継承してメソッドをオーバライドしても、そのメソッドが辞書のその他のメソッドから呼び出されるという保証はない

collections.UserDict, UserString, UserListを使うとよい

## ABC

collections.absのABCは、すべてのカスタムコレクション型の作成を目的とする

よく分からないので飛ばす

## まとめ

- 組み込みメソッドをオーバーライドしようとするとPythonが予期しない振る舞いをするので注意が必要
- リスト、辞書、文字列の一部を変更したい場合はcollections.UsrList, collections.UsrDict, collections.Stringを使用する
- 他のコレクション型と同じインターフェースでより複雑な振る舞いをするクラスを書く必要があるなら、collections.abcを使用する

## 6章 型チェッカのカスタマイズ

型チェッカ(mypyやPyreなど)は適切な使い方ができれば強固なツールとしてしようできるが

**厳密度**を調整しないとアノテーションの量が増えすぎたり逆にアノテーションの意味を成さなくなることもある

型チェッカには厳密度を調整できるオプションが存在するため、そこで厳密度の調整をする必要がある

型チェッカには以下のようなライブラリが存在する

- mypy
- Pyre
- Pysa
- Pyright

## 7章 実践的な型チェッカ導入

型アノテーションにはコストがかかる。コストがかかった分メリットもあるが、コストがメリットより大きくなっては意味がない

どれだけ早くコストとメリットと損益分岐点に到達できるかが重要である

コードのどの部分に対してアノテーションを実行するかの戦略は以下の例があげられる

- 新規コード
- 共通部分のコード
- ビジネスロジックのコード
- 書き換え頻度が高いコード
- 複雑なコード


[MonkeyType](https://yiskw713.hatenablog.com/entry/2022/05/21/170000)を使用すればある程度自動でアノテーションを追加できる

MonkeyTypeは実行時に観測できたコードにしかアノテーションができないため、デットコードにはアノテーションができない問題点がある

[Google](https://zenn.dev/seratch/articles/21d80ab3bf8c07c39c52)が開発したPytypeは静的解析によって型アノテーションを追加できる

また、Pytypeは本格的なリンターとしても使用できる

型チェックツールを導入してアノテーションのコストを削減することも重要である

## 列挙型
### ユーザー定義型
開発者が独自で作るデータ型  
独自のデータ型にはドメインの知識が格納されており、非常に重要な役割を果たす  

### 列挙型
python3.4から導入されたEunm型 → 複数の選択肢から1つを選択して欲しい場合に使用する  
アノテーションとしてEnum型とすることによって、開発者はEnum型のどれかかの値が必要であることが分かる  
選択肢が静的である場合はEnum型は強力なツールとなるが、選択肢が動的である場合は**辞書型**がよい  

#### 列挙型の高度な使い方 auto()
メンバの値について特別な指定が必要ない時に使用する
python3.8からLiteralが導入されたため、単純な制限だけであるならLiteralを試した方が良さそう

#### 列挙型の高度な使い方 Flag()
複数の状態を持たせたい場合に使用する