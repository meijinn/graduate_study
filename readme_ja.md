# 遠隔運転システム (ラジコン実装)

## 必要物品

###  ソフトウェア

日本語化などは各自で．ソフトウェアインストール方法は各種ホームページをチェック．

- [Arduino IDE ](https://www.arduino.cc/en/software)
- [XCTU](https://www.digi.com/products/embedded-systems/digi-xbee/digi-xbee-tools/xctu)
- [Processing](https;//processing.org) ← Processingの拡張機能をいくつかインストールする必要がある．**Processingのチュートリアル**で説明
- [Python 3.7 (32-bit)](https://www.python.org/downloads/release/python-2718/) 32bitはバグが少ないらしい．
- [gopropy-api ](https://github.com/KonradIT/gopro-py-api)(Python用のAPI )

### ハードウェア

- Arduino x1
- XBee S2C x2 ←↑この辺は自力で調べて
- [XBee USB アダプター](https://www.mouser.jp/ProductDetail/SparkFun/WRL-11697?qs=WyAARYrbSnatN4p%252Buf7q5Q%3D%3D&mgh=1&gclid=Cj0KCQjwjPaCBhDkARIsAISZN7RgkhTV2KPWdjqOc8W712Q7deEnABnMUstrd_iMTcyhVm4Lho3-fo0aAqJDEALw_wcB) x1 色々ある．私が使用したものは入手困難．
- [Wireless Proto shield](https://www.switch-science.com/catalog/786/) x1 同じく入手困難なので，[こちら](https://www.sengoku.co.jp/mod/sgk_cart/detail.php?code=EEHD-4LKE)をおすすめ．
- [タミヤのラジコン](https://www.tamiya.com/japan/products/57851/index.html)(ESC(Electric Speed Controller)が付属していたら他機種でも可)
- ハンコン，ゲームパッド，有線USB接続のコントローラが確実．僕はLogicoolのgt force proを使用．ハンコンは安くて1万円ぐらいからあるかな～．ただし，ハンコンは，安価品だとペダルがオンオフのディジタルでしか入力できないものがある．gt force pro かdriving force gt が，コスパ良いのとアナログ入力ができて確実．
- gopro max，goproはスマホアプリ(無料)から初期設定する．ネット上にたくさん情報があるので，各自で調べて下さい．最終的にgoproカメラとPCをWifiで接続できるようになっているはずです．
- Micro SD 用途に合わせて容量をチョイスしてください．
- ジャンパワイヤ多数 6本以上は必要


## チュートリアル

上記ソフトウェアを一通りインストールしたこと前提

### 有線で
1. [Arduinoのチュートリアル](arduino.cc/en/Tutorial/HomePage)(必要であれば) 5000円以内でArduinoのスターターキットを購入してプロトタイピングを始めるのがおすすめです．

2. [Processingのチュートリアル](https://processing.org/tutorials/)

3. 上2つをそこそこ出来たら，[Processing，Arduino連携のチュートリアル](https://www.makeuseof.com/tag/arduino-robot-game-controller/)ができるかどうかチェック．ただし，configは動作しない可能性がある．(xbsでキーコンフィグを割り当てるやり方)
有線でArduinoを扱うためのライブラリを読み込んで行う，次の無線化からは，そのライブラリが無くてもシリアル通信ができる．

### 無線化
1. [XCTUのコーディネータ(親機)，ルータ(子機)の設定](https://qiita.com/s_fujii/items/9804eaf3599139164aa3) 前者は送信機(PC側接続)，後者は受信機(ラジコン側Arduinoへ接続)になる．
2. [XBee のテストコード](https://re-shikajiro.hatenadiary.org/entry/20120511/1336724096)を試す． ← mac シリアルポートの設定方法がwindows と若干違うかもしれないが，ポートが設定できていればコードは動く

## 実装

1. ラジコン側受信機に3本で1組の端子が2つ接続されている．片方の端子がステアリングサーボ，他方がDCモータの制御用端子となっている．それぞれを下図のようにArduinoへと配線する．

- **注意** 3.3 V 電圧線と，接地線は，別途9 V電池を用意して接続する方がよい．5 V 電圧線は，Arduino の Vin 端子に変更した方が良い
- ESC(Electric Speed Controller)がブラックボックスなので，扱いに注意(Arduino損傷の可能性あり)

 ![システム構成](https://user-images.githubusercontent.com/27892408/112577757-562c7900-8e38-11eb-85ce-e89b88f152a2.jpg)  ![DSC_0612](https://user-images.githubusercontent.com/27892408/112704620-96463700-8ede-11eb-9560-e229737d38ea.JPG)
  ![DSC_0613](https://user-images.githubusercontent.com/27892408/112704625-9c3c1800-8ede-11eb-8d8e-d33e70d628db.JPG)
  ![DSC_0615](https://user-images.githubusercontent.com/27892408/112704631-a100cc00-8ede-11eb-84b4-2e761d7df910.JPG)
  ![DSC_0755](https://user-images.githubusercontent.com/27892408/112704636-a65e1680-8ede-11eb-95b6-126f35d32f90.JPG)

2. gamecontrolplusライブラリを使ってゲームパッドのコンフィグを確認する．
3. xbee_rc.pde，dualshock3.pde と上のコンフィグを参考に，processingのコードを改良して下さい．
4. xbee_rc.inoを改良して，Arduinoに書き込んでください．(ソースコードを書き込むときはXBee用モジュールを外すか，モジュールを付けたままにする場合は，usb・microの切り替えスイッチをusbに切り替えて下さい．)

5. PCからgoproカメラのWifiに接続して下さい．
6. ffmpegless-preview.py を実行して下さい．すると，gopro カメラとPCが接続され，リアルタイムの映像がディスプレイ上にプレビューされます．

## 今後

- このままだと，ラジコンの速度が速いので，リダクションギアを設置する．
- カメラ映像が400 ms程度遅延しているので，opencvのカメラキャプチャに用いるバッファのサイズを調整し，低遅延化する．