# EQManager



##  ページ

- top(グループ選択ができる・借りている機材一覧の表示)
- account
- Add(機材の追加、分類の追加、機材を借りる)



## 機能

- ログイン

- アカウント

  - 現在借りている機材一覧

- グループ(ホーム画面)

  - 直近で借りられているもの一覧

  - 機材の状況を閲覧
    - 借りられているか(true: 借りられている)
    - 借りている人
    - 目的
    - 借りた日
    - 返された日
  - 機材の追加
    - 名前
    - 分類
  - 機材を借りる
    - 機材を指定
    - 目的
  - 分類の追加
    - 名前



## DB

- Group 
  - name null:false
- user
  - name null:false
  - mail null:false
  - Password_digest null:false
- Group_user
  - User_id null:false
  - Group_id null:false
- classification
  - name null:false
- equipment
  - name null:false
  - state null:false
  - Group_id null:false
  - Classification_id null:false
- borrow
  - Group_user_id null:false
  - equipment_id null:false
  - Return_day



## Done

- DBの作成
- 