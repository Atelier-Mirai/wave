# 動画 の埋め込み

Webサイトに動画を掲載するにはどのようにしたら良いでしょうか？
動画共用サイトとして有名なところでは、YouTubeやVimeoがあります。

## YouTube を埋め込む

こちらが YouTubeを埋め込んだ例です。
![猫](images/youtube0.jpg)

YouTubeの公式サイトには、埋め込み方法として次のように書かれています。

### 動画と再生リストを埋め込む
ウェブサイトやブログに YouTube の動画や再生リストを埋め込んで追加できます。
* パソコンで、埋め込みたい YouTube 動画に移動します。
* 動画の下にある [共有] 共有 をクリックします。
* [埋め込む] をクリックします。
* ボックスに表示されている HTML コードをコピーします。
* ブログやウェブサイトの HTML にコードを貼り付けます。
<br>
[https://support.google.com/youtube/answer/171780?hl=ja](https://support.google.com/youtube/answer/171780?hl=ja)

順に説明していきます。

## 準備
``` index.html ``` と ``` style.css ``` を次のように用意します。

###### index.html
```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <h1>案内地図</h1>
  <div class="video">
    <div class="inner">
      <iframe
        src="https://www.youtube.com/embed/
             OAo1GBrdvzg
             ?rel=0&showinfo=0"
             frameborder="0"
             allowfullscreen >
      </iframe>
    </div>
  </div>
</body>
</html>
```

###### style.css
```css
.video {
  box-sizing: border-box;
  width: 100%;
}

.video .inner {
  overflow: hidden;
  position: relative;
  padding-top: calc(100% * 9 / 16);
}

.video .inner iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```

## YouTube埋め込み方法
ここでは可愛い猫の動画がありますので、それを埋め込むことにしましょう。

1. 埋め込みたい YouTube 動画に移動します。

1. 動画の下にある 「共有」をクリックします。
  ![猫1](images/youtube1.jpg)

1. 「埋め込む」 をクリックします。
  ![猫2](images/youtube2.jpg)

1. ボックスに表示されている HTML コードをコピーします。
  ![猫3](images/youtube3.jpg)

1. ブログやウェブサイトの HTML にコードを貼り付けます。
```html
  <iframe width="560" height="315"
          src="https://www.youtube.com/
               embed/OAo1GBrdvzg"
          frameborder="0"
          allow="accelerometer;
                 autoplay;
                 encrypted-media;
                 gyroscope;
                 picture-in-picture"
          allowfullscreen>
  </iframe>
```

<ol start="6"><li>不要な部分もあるので、必要な部分だけを残します。</li></ol>
  ##### 必要な部分だけを残したHTML
  ```html
  <iframe src="https://www.youtube.com/
               embed/OAo1GBrdvzg
               ?rel=0&showinfo=0"
          frameborder="0"
          allowfullscreen>
  </iframe>
  ```

```allow="accelerometer;(略)``` を削除しています。
```?rel=0&showinfo=0" ```と付けることで、
* 動画再生した後に関連動画が表示されなくなります。
* 動画再生中の表題が非表示になり、すっきりします

### 参考
YouTube 埋め込みプレーヤーとプレーヤーのパラメータ
<br>
https://developers.google.com/youtube/player_parameters?hl=ja#Manual_IFrame_Embeds


## Vimeoの埋め込み
動画共用サイトとして Vimeo も有名です。
高画質で芸術的な作品が多く載せられています。

埋め込んだ例はこのような感じになります。
  ![伊勢湾1](images/vimeo0.jpg)


埋め込み方法について、公式サイトには次のように記されています。
> https://vimeo.zendesk.com/hc/ja/articles/224969968-動画の埋め込みについて
<br>
> 動画の埋め込みコードを取得するには、
> その動画ページに移動し「共有」ボタンをクリックしてください。
> 埋め込みコード欄の上に表示される「+オプション表示」のリンクをクリックし、
> 基本のカスタムオプションで埋め込み動画のプレビューを表示します。
> 調整が終わったら、埋め込みコードをコピーし 動画 を埋め込みたい場所に貼り付けます。

順に説明していきます。

1. その動画ページに移動し「共有」ボタンをクリックしてください。
  今回は、知多市で行われている伊勢湾カップの動画を掲載してみましょう。
  https://vimeo.com/354152854
  に移動して、「共有」ボタンをクリックします。
  ![伊勢湾](images/vimeo1.jpg)

1. 埋め込みコード欄の上に表示される「+オプション表示」のリンクをクリックし、
  ![伊勢湾](images/vimeo2.jpg)
1. 基本のカスタムオプションで埋め込み動画のプレビューを表示します。
  ![伊勢湾](images/vimeo3.jpg)
1. いろいろな調整を行います。
  * サイズを、Responsive にします。
  * イントロの、プロフィール画像、タイトル、投稿者のチェックを外します。
  * スペシャルアイテムで、動画の下に説明を表示のチェックを外します。
  ![伊勢湾](images/vimeo4.jpg)

3. 調整が終わったら、埋め込みコードをコピーし
埋め込み欄をクリックします。
<br>
```Command + C``` で、コードをコピーします。
  ![伊勢湾](images/vimeo5.jpg)

4. 動画 を埋め込みたい場所に貼り付けます。
```html
  <!DOCTYPE html>
  <html>
  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
  </head>
  <body>
    <h1>Vimeo動画</h1>
    <div style="padding:56.25% 0 0 0;position:relative;">
      <iframe src="https://player.vimeo.com/video/
                   354152854?title=0&byline=0&portrait=0"
              style="position:absolute;top:0;left:0;width:100%;height:100%;"
              frameborder="0"
              allow="autoplay; fullscreen"
              allowfullscreen>
      </iframe>
    </div>
    <script src="https://player.vimeo.com/api/player.js"></script>
  </body>
  </html>
```

これで、完成です。
YouTubeではレスポンシブ対応するために、
<br>
```<div class="video"><div class="inner">```や、
<br>
```style.css```が必要でしたが、今回は不要です。
<br>
```<script src="https://player.vimeo.com/api/player.js"></script>```
<br>
は、JavaScriptを使っていろいろ制御したいときには必要ですが、
<br>
簡素に動画を掲載するだけですので、削除してもよいでしょう。
