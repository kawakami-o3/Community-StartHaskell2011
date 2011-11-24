｛抵抗｝｛ていこう｝の｛回路｝｛かいろ｝
========================================

このファイルは｛文芸的｝｛ぶんげいてき｝プログラミングの｛形式｝｛けいしき｝で
｛書｝｛か｝いている。このファイルの｛中｝｛なか｝に｛関数｝｛かんすう｝を
｛定義｝｛ていぎ｝せよ。

> -- hunit
> import Test.HUnit

｛型｝｛かた｝｛宣言｝｛せんげん｝
----------------------------------

`Network`という｛抵抗器｝｛ていこうき｝の｛回路｝｛かいろ｝を
｛扱｝｛あつか｝う｛型｝｛かた｝を｛宣言｝｛せんげん｝せよ。
｛抵抗器｝｛ていこうき｝｛又｝｛また｝は｛回路｝｛かいろ｝の｛部分｝｛ぶぶん｝
はそれぞれ｛互｝｛たが｝いに｛直列｝｛ちょくれつ｝か｛並列｝｛へいれつ｝で
ある。｛図｝｛ず｝（`RNetwork.png`）に｛例｝｛れい｝がある。

> data Network = Undefined

テストの｛回路｝｛かいろ｝
--------------------------

｛各｝｛かく｝｛図｝｛ず｝にある｛例｝｛れい｝の｛回路｝｛かいろ｝を
｛定義｝｛ていぎ｝せよ。

｛抵抗｝｛ていこう｝
--------------------

`Network`の｛抵抗｝｛ていこう｝を｛計算｝｛けいさん｝する｛関数｝｛かんすう｝
`resistance`を｛定義｝｛ていぎ｝して、テストも｛完成｝｛かんせい｝せよ。
｛図｝｛ず｝に｛各｝｛かく｝｛回路｝｛かいろ｝の｛抵抗｝｛ていこう｝は
｛赤｝｛あか｝｛文字｝｛もじ｝で｛書｝｛か｝いてある。（テスト
｛駆動｝｛くどう｝｛開発｝｛かいはつ｝の｛好｝｛す｝きな｛方｝｛かた｝は
テストを｛先｝｛さき｝に｛作｝｛つく｝っても｛良｝｛よ｝い。）

｛抵抗｝｛ていこう｝`A`の｛抵抗器｝｛ていこうき｝か｛回路｝｛かいろ｝の
｛部分｝｛ぶぶん｝が｛抵抗｝｛ていこう｝`B`の｛抵抗器｝｛ていこうき｝か
｛回路｝｛かいろ｝の｛部分｝｛ぶぶん｝と｛直列｝｛ちょくれつ｝であったら
｛合計｝｛ごうけい｝の｛抵抗｝｛ていこう｝が`A + B`だ。｛抵抗｝｛ていこう｝
`A`の｛抵抗器｝｛ていこうき｝か｛回路｝｛かいろ｝の｛部分｝｛ぶぶん｝が
｛抵抗｝｛ていこう｝`B`の｛抵抗器｝｛ていこうき｝か｛回路｝｛かいろ｝の
｛部分｝｛ぶぶん｝と｛並列｝｛へいれつ｝であったら｛合計｝｛ごうけい｝の
｛抵抗｝｛ていこう｝が`1/(1/A + 1/B) == AB/(A + B)`だ。『ワイヤー』の
｛抵抗｝｛ていこう｝はわずかな｛量｝｛りょう｝であることを｛仮定｝｛かてい｝
せよ。

> resistance :: Network -> Float
> resistance = undefined

テストのコマンド： `runTests resistanceTests`

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts

> resistanceTests :: [Test]
> resistanceTests = map TestCase
>   [
>   ]
