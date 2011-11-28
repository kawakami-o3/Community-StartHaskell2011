「プログラミングHaskell」：第8章：問題1
=======================================

このファイルは文芸的プログラミングの形式で書かれている。このファイルに関数を
実装して、含まれているテストで確認せよ。

次のモジュール定義とインポートは無視して良い。

> module Main (main) where
>
> -- hunit
> import Test.HUnit
>
> -- local
> import Parsing

以下に答えを定義せよ。

> myInt :: Parser Int
> myInt = undefined

テストのコマンド： `runTests myIntTests`

> myIntTests :: [Test]
> myIntTests = map TestCase
>   [ assertEqual "parse myInt \"1\"" [(1,"")] (parse myInt "1")
>   , assertEqual "parse myInt \"123\"" [(123,"")] (parse myInt "123")
>   , assertEqual "parse myInt \"-1\"" [(-1,"")] (parse myInt "-1")
>   , assertEqual "parse myInt \"-123\"" [(-123,"")] (parse myInt "-123")
>   , assertEqual "parse myInt \"123a\"" [(123,"a")] (parse myInt "123a")
>   , assertEqual "parse myInt \"-123a\"" [(-123,"a")] (parse myInt "-123a")
>   , assertEqual "parse myInt \"a1\"" [] (parse myInt "a1")
>   , assertEqual "parse myInt \"--1\"" [] (parse myInt "--1")
>   ]

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts

> main :: IO Counts
> main = runTests myIntTests
