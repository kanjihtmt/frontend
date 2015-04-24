# Haml/Sass/Coffeeの自動化(Gruntfile)

## 出来ること

 * Haml -> HTML に変換
 * Sass -> cssに変換
 * CoffeeScript -> Javascriptに変換
 * MochaでCoffeescriptをテスト
 * CoffeelintでCoffeescriptをLintする

## Install

```shell
$ npm install
```

## 使い方

Watchするとき

```shell
$ grunt
```

Haml -> HTMLに変換

```shell
$ grunt haml
```

Sass(scss) -> CSSに変換

```shell
$ grunt sass
```

Coffeescript -> Javascriptに変換

```
$ grunt coffee
```

TODO: minify
