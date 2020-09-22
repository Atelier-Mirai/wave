# 写真の紹介

Webサイトに写真を掲載することはよくあります。

「画面上にある小さな写真」
![popup](images/popup0.jpg)

「クリックすると大きく表示される。」
![popup](images/popup1.jpg)

先人の方が様々な有益なライブラリを提供してくださっています。
ここでは、** Magnific Popup ** をご紹介します。
公式サイトはこちらです。
https://dimsemenov.com/plugins/magnific-popup/
> Magnific Popup は、パフォーマンスに焦点を当て、
> あらゆるデバイスでユーザーに最高の体験を提供することを目的とした、
> 応答性の高いライトボックス＆ダイアログスクリプトです。
と紹介されています。(Magnific とは、「壮大な」という意味)

使い方の紹介など詳しくは、公式サイトを見ていただければと思いますが、
以下に簡単に記します。

## HTML

###### index.html
```html
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>アトリヱ未來</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- Magnific Popup -->
<link rel="stylesheet" href="lib/magnific-popup.css">
<script src="lib/jquery.magnific-popup.min.js"></script>

<!-- Magnific Popup の為の設定 -->
<link rel="stylesheet" href="magnific-popup-custom.css">
<script src="magnific-popup-custom.js"></script>
</head>

<body>
<h1>Magnific Popup</h1>

<h2>写真展</h2>
<div class="gallery">
  <a href="images/tora.jpg" title="The Cleaner">
    <img src="images/tora_s.jpg">
  </a>
  <a href="images/tsuru.jpg" title="Winter Dance">
    <img src="images/tsuru_s.jpg">
  </a>
  <a href="images/zou.jpg" title="The Uninvited Guest">
    <img src="images/zou_s.jpg">
  </a>
  <a href="images/saru.jpg" title="Oh no, not again!" width="75" height="75">
    <img src="images/saru_s.jpg">
  </a>
  <a href="images/hakucho.jpg" title="Swan Lake">
    <img src="images/hakucho_s.jpg">
  </a>
  <a href="images/araiguma.jpg" title="The Shake">
    <img src="images/araiguma_s.jpg">
  </a>
  <a href="images/kuma.jpg" title="Who's that, mommy?">
    <img src="images/kuma_s.jpg">
  </a>
</div>

</body>
</html>
```

jQueryを使うので、読み込んでいます。
<br>
また、libディレクトリに、Magnific Popup 用の CSS と JavaScript を置いています。
<br>
公式サイトよりダウンロードできますので、置いておきましょう。

```html
<div class="gallery">
  <a href="images/tora.jpg" title="The Cleaner">
    <img src="images/tora_s.jpg">
  </a>
  (略)
</div>
```
写真ギャラリー用の画像を、imageディレクトリに入れておきます。
サムネイル画像も準備しておきます。

## CSS
Magnific Popup の為の設定

###### magnific-popup-custom.css
```css
/* 画像の大きさを指定 */
.gallery img {
  width: 75px;
  height: 75px;
}
/* a タグの title 属性が表示されないように */
.gallery a {
  color: transparent; /* 透明色 */
}

/* 写真をクリックしたときに、ズームアップする為の設定 */
.mfp-with-zoom .mfp-container,
.mfp-with-zoom.mfp-bg {
  opacity: 0;
  -webkit-backface-visibility: hidden;
  transition: all 0.3s ease-out;
}
.mfp-with-zoom.mfp-ready .mfp-container {
    opacity: 1;
}
.mfp-with-zoom.mfp-ready.mfp-bg {
    opacity: 0.8;
}
.mfp-with-zoom.mfp-removing .mfp-container,
.mfp-with-zoom.mfp-removing.mfp-bg {
  opacity: 0;
}
```

## JavaScript
Magnific Popup の為の設定

###### magnific-popup-custom.js
```javascript
$(function() {
  $('.gallery').each(function(){
    $(this).magnificPopup({
      /* 基本設定いろいろ */
      delegate: 'a',
      type: 'image',
      tLoading: 'Loading image #%curr%...',
      mainClass: 'mfp-img-mobile',
      gallery: {
        enabled: true,
        navigateByImgClick: true,
        preload: [0,1],
        arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',
        tPrev: 'Previous (Left arrow key)',
        tNext: 'Next (Right arrow key)',
        tCounter: '<span class="mfp-counter">%curr% of %total%</span>'
      },
      image: {
        tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
        titleSrc: function(item) {
          return item.el.attr('title') + '<small>by Marsel Van Oosten</small>';
        }
      },
      /* クリックしたときにズームアップするための設定 */
      mainClass: 'mfp-with-zoom',
      zoom: {
        enabled: true,
        duration: 300,
        easing: 'ease-in-out',
        opener: function(openerElement) {
          return openerElement.is('img') ? openerElement : openerElement.find('img');
        }
      }
    });
  });
});
```

## 動画の表示
YouTube や Vimeo、Google Map の表示もできます。

```html
<div class="html-code">
  <a class="popup-youtube"
     href="http://www.youtube.com/watch?v=0O2aH4XLbto">
     Open YouTube video
  </a>
  <br>
  <a class="popup-vimeo"
     href="https://vimeo.com/45830194">
     Open Vimeo video
  </a>
  <br>
  <a class="popup-gmaps"
     href="https://www.google.com/maps/embed?
           pb=!1m18!1m12!1m3!1d3264.098
           229592375!2d136.949090952232
           27!3d35.10425798023631!2m3!1
           f0!2f0!3f0!3m2!1i1024!2i768!
           4f13.1!3m3!1m2!1s0x60037b0d5
           843e2af%3A0x282e3c573e3f00d8
           !2z44Kz44Oh44OA54-I55CyIOmHj
           uS4puW6lw!5e0!3m2!1sja!2sjp!
           4v1592795030975!5m2!1sja!2sjp">
     Open Google Map
  </a>
</div>
```

![地図](images/popup2.jpg)
