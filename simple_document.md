# 簡易仕様書

### 作者
村田 光

### アプリ名
TodoReminder

## 動作対象端末・OS
### 動作対象OS
macOS Big Sur 11.6.4
### 動作対象ブラウザ
Google Chrome 98.0.4758.109

## 開発環境
### 開発環境
- RubyMine 2021.2.2
- docker 3.5.1.7

### 開発言語
Ruby 3.0.1

## アプリケーション機能

### 機能一覧

- タスク
    - タスクの管理：ユーザーに紐づくタスクの作成・更新・削除・完了処理を行う。
    - タスクをbotで通知：期限が当日のタスクを毎朝9時通知。
- ユーザー
    - ログイン：emailとpasswordでログインできる。
    - ログアウト：ログアウトすることによってシステムの一部が利用できなくなる。
    - lineと連携：botの友達追加時に送信されるUIDを、システムのユーザー情報に設定することによって期限当日の課題を通知してくれる。
    - ユーザーの管理：管理者権限があればユーザーの作成・更新・削除が可能。
    - 自身の情報の変更：ログイン中のユーザーは自身の情報を変更できる。

### フレームワーク
- Ruby on Rails 6.1.4
- admin-lte 3.2.0

## テーブル設計
### users テーブル
| | column type |
| ---- | ---- |
| PK | id int |
| | name string |
| | email string |
| | uid string |
| | password string |
| | password_confirmation string |
| | is_admin boolean |
| | created_at datetime |
| | updated_at datetime |

### tasks テーブル
|  | column type |
| ---- | ---- |
| PK | id int |
| FK | user_id |
| | name string |
|  | deadline datetime | 
| | is_finished boolean |
| | created_at datetime |
| | updated_at datetime |

#### コンセプト
タスクの遂行や課題の提出し忘れがなくなる

#### こだわったポイント
LINE Messaging APIを使って、タスクの期限が当日になるとlineボットが通知してくれるようにした。

#### デザイン面でこだわったポイント
- タスクを表形式ではなくカード型にし、重要な情報はサイズを大きくして見やすくした。
- 完了済みのタスク一覧のタスクの背景を灰色にすることによって、未完了のタスク一覧との区別がつきやすいようにした。

#### 自己評価
LINE Messaging APIを使用してlineにタスクを通知してくれる機能を実装できたので機能的には便利であるが、UI/UXの改善の余地があると感じている。
ウェブブラウザからログインしてタスクを登録しなければならないのは手間がかかるのでLINE側からタスクを登録できるように改善したり、機能の動線がわかりにくいところがあるので、
「ここをクリックしたらこのページに飛ぶ」というような情報をユーザーが一目見て分かるようなUIに改善していきたい。


### 公開したアプリの URL
[https://mysterious-dusk-64390.herokuapp.com](https://mysterious-dusk-64390.herokuapp.com)

### 該当プロジェクトのリポジトリ URL
[https://github.com/muratahikaru/todo_reminder](https://github.com/muratahikaru/todo_reminder)
