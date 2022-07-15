## 1.1 Rubyの実行方法

rubyコマンド
irb

## 1.2 プログラムの解説

オブジェクト...文字列、数値、時刻など
メソッド

## 1.3 文字列
### 改行文字と「\」
\n 改行

"" 文字の終わりと始まりを表す

\ 特殊な文字を埋め込みたいときに使用

```ruby
print("Hello, \"Ruby\".\n")

Hello, "Ruby".
=> nil

print("Hello, \\Ruby!")

# 出力される「\」は1つ
Hello, \Ruby!=> nil
```

### 「''」と「""」
'' 特殊文字の解釈を行わない

```ruby
print('Hello,\nRuby\n!\n')

Hello,\nRuby\n!\n=> nil
```

## 1.4 メソッドの呼び出し
## 1.5 putsメソッド
表示する文字の最後で改行
```
puts "Hello, Ruby."

Hello, Ruby.
=> nil

puts "Hello, ", "Ruby!"
```

## 1.6 pメソッド
文字列と数値を区別する
文字コードを表示する場合は""で囲んだ値を出力する

```ruby
puts "100"
100
=> nil

puts 100
100
=> nil

p "100"
"100"
=> "100"  

p 100
100
=> 100   
```

## 1.7 日本語の表示
文字コードに注意

文字コードの指定
```
#   encoding: 文字コード
```

## 1.8 数値の表示と計算
数値の表示
1 → Integer
3.14 → Float

四則演算
数学関数

1.9 変数

変数名 = オブジェクト

- printメソッドと変数

```
area = 100
print "表面積", area, "\n"
3つの引数を順に出力
```


