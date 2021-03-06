「プログラミングHaskell」：｛第｝｛だい｝10｛章｝｛しょう｝：｛問題｝｛もんだい｝8
==================================================================================

このファイルは｛文芸的｝｛ぶんげいてき｝プログラミングの｛形式｝｛けいしき｝で
｛書｝｛か｝かれている。このファイルに｛関数｝｛かんすう｝を
｛実装｝｛じっそう｝して、｛含｝｛ふく｝まれているテストで｛確認｝｛かくにん｝
せよ。

この｛問題｝｛もんだい｝の｛目標｝｛もくひょう｝は`Maybe`と`[]`（リスト）の
`Monad`インスタンス｛宣言｝｛せんげん｝を｛完成｝｛さんせい｝させることだ。
しかし｛両方｝｛りょうほう｝の｛型｝｛かた｝とも｛既｝｛すで｝に`Prelude`に
`Monad`のインスタンスが｛定義｝｛ていぎ｝してあるためエラーになり、
｛自分｝｛じぶん｝の｛宣言｝｛せんげん｝をテストするのが｛難｝｛むずか｝しい。
このファイルにテストする｛方法｝｛ほうほう｝を｛用意｝｛ようい｝した。

｛次｝｛つぎ｝のインポートは｛無視｝｛むし｝して｛良｝｛よ｝い。

> -- base
> import Prelude hiding (Monad(..))
>
> -- hunit
> import Test.HUnit

Monadのクラス
-------------

｛自分｝｛じぶん｝のインスタンス｛宣言｝｛せんげん｝をテストするために、
｛本物｝｛ほんもの｝の`Monad`クラスを｛隠｝｛かく｝して、｛代｝｛か｝わりに
｛同等｝｛どうとう｝な｛次｝｛つぎ｝のクラスを｛使｝｛つか｝うことにする。

> class MyMonad m where
>   (>>=) :: m a -> (a -> m b) -> m b
>   (>>) :: m a -> m b -> m b
>   return :: a -> m a
>   p >> q = p >>= \_ -> q

Maybe
-----

｛以下｝｛いか｝のインスタンス｛宣言｝｛せんげん｝を｛完成｝｛かんせい｝
させよ。

> instance MyMonad Maybe where
>   -- return :: a -> Maybe a
>   return = undefined
>   -- (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
>   (>>=) = undefined

テストのコマンド： `runTests maybeTests`

> maybeTests :: [Test]
> maybeTests = map TestCase
>   [ assertEqual "return 1" (Just 1) (return 1)
>   , assertEqual "Nothing >>= (\\v -> return 1)" Nothing
>                 (Nothing >>= (\v -> return 1))
>   , assertEqual "Just 2 >>= (\\v -> return (2 + v))" (Just 4)
>                 (Just 2 >>= (\v -> return (2 + v)))
>   , assertEqual "Just 2 >> return 3" (Just 3) (Just 2 >> return 3)
>   ]

List
----

｛以下｝｛いか｝のインスタンス｛宣言｝｛せんげん｝を｛完成｝｛かんせい｝
させよ。

> instance MyMonad [] where
>   -- return :: a -> [a]
>   return = undefined
>   -- (>>=) :: [a] -> (a -> [b]) [b]
>   (>>=) = undefined

テストのコマンド： `runTests listTests`

> listTests :: [Test]
> listTests = map TestCase
>   [ assertEqual "return 1" [1] (return 1)
>   , assertEqual "[1,2,3] >>= (\\v -> return (2 * v))" [2,4,6]
>                 ([1,2,3] >>= (\v -> return (2 * v)))
>   , assertEqual "[1,2,3] >>= (\\v -> [v, 2 * v])" [1,2,2,4,3,6]
>                 ([1,2,3] >>= (\v -> [v, 2 * v]))
>   , assertEqual "[1,2] >>= (\\x -> [3,4] >>= (\\y -> return (x,y)))"
>                 [(1,3),(1,4),(2,3),(2,4)]
>                 ([1,2] >>= (\x -> [3,4] >>= (\y -> return (x,y))))
>   ]

｛補助｝｛ほじょ｝コード
------------------------

｛次｝｛つぎ｝のものはテストの｛実行｝｛じっこう｝するための｛定義｝｛ていぎ｝
だ。これは｛無視｝｛むし｝して｛良｝｛よ｝い。

> runTests :: [Test] -> IO Counts
> runTests ts = runTestTT $ TestList ts
