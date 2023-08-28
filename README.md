# 音楽SNSサイト musica
​
## サイト概要

**トップ画面**
<img width="1438" alt="スクリーンショット 2023-08-28 17 02 11" src="https://github.com/syakuyamariko/musica.ver4/assets/135488694/4b6ceed1-d86e-4af5-9e10-6a51a5038f81">

**DM画面**
<img width="1437" alt="スクリーンショット 2023-08-28 16 55 33" src="https://github.com/syakuyamariko/musica.ver4/assets/135488694/075e2248-cde6-456f-9ae5-3123c0155f75">

**Favorite Artist投稿画面**
<img width="1440" alt="スクリーンショット 2023-08-28 16 58 43" src="https://github.com/syakuyamariko/musica.ver4/assets/135488694/08b9e47b-9146-4c54-af8a-30cec138316a">

### サイトテーマ
お気に入りの音楽を紹介したり、音楽の幅を開拓できるSNSサイト

### テーマを選んだ理由
音楽が好きで趣味の音楽の知り合いを気軽に作りたいと思った時に、音楽に特化したSNSサイトが少なく</br>
多様な音楽情報が集まるSNSがあれば音楽の幅が広がったり、趣味の仲間を作れる機会が増えるのではないかと思いました。</br>
好きな音楽を紹介したり、コミュニティの中で交流を深めたり、音楽活動の仲間を募ったりするなど多様な使い方ができるサイトがあれば</br>
従来のSNSで音楽の趣味を形成していくよりも、気軽に入りやすいプラットフォームとなると感じました。</br>

### ターゲットユーザ
- 音楽が好きで、趣味の人達と気軽に繋がりたいと思っている人
- 新しい音楽を開拓したい人
​
### 主な利用シーン
- 同じ趣味の音楽仲間が欲しい時
- 音楽活動の仲間を募集したい時
- イベント情報の周知

### 画像投稿時の注意
- アーティストやアルバムの画像など著作権に由来する画像の投稿することは禁止されています。
- 他の利用者の個人情報を、明確な同意や許可なく公開または投稿することは禁止されています。
​
## 設計書

- ER図

<img width="774" alt="スクリーンショット 2023-08-28 17 06 29" src="https://github.com/syakuyamariko/musica.ver4/assets/135488694/c62cbf70-b31c-4c00-9420-f66923b95722">

- 画面遷移図

**管理者側**

<img width="826" alt="スクリーンショット 2023-08-28 17 38 17" src="https://github.com/syakuyamariko/musica.ver4/assets/135488694/88f765da-aefc-4b71-acd2-d3a1dd075b0c">

**管理者側**

<img width="494" alt="スクリーンショット 2023-08-28 17 39 22" src="https://github.com/syakuyamariko/musica.ver4/assets/135488694/79a30f08-52da-4b82-bb22-1c27290d49bb">

- テーブル定義書

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
**使用したGem**
- Bootstrap(デザイン)
- devise(登録/退会/ログイン/ログアウト)
- kaminari(ページネーション)
​