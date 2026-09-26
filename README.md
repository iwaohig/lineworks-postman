# lineworks-postman

> **Unofficial.** This is a personal repository and not an official resource of LINE WORKS.
> 個人の立場で作成したもので、LINE WORKS の公式な情報ではありません。

Postman API Network で公開されている LINE WORKS API のコレクションを、User Account 認証 (OAuth 2.0) で試すための補助ファイルと、Qiita 記事の画像を置いています。

- Qiita 記事: [Postman で LINE WORKS API を試す (公式コレクションを Fork して users/me を呼ぶまで)](https://qiita.com/iwaohig/private/394f4378222268e7bd2a) (限定共有)

## 内容

| パス | 内容 |
|---|---|
| `postman/lineworks.postman_environment.json` | Postman の環境 (Environment) の雛形。変数 `clientId` / `clientSecret` / `userId` / `botId` を定義しています |
| `docs/images/postman/` | Qiita 記事で使っている画像 |

## 環境の雛形の使い方

1. Postman で **Import** を選び、`postman/lineworks.postman_environment.json` を読み込みます
2. 環境「LINE WORKS API (User Account)」を開き、`clientId` と `clientSecret` に Developer Console のアプリの値を入れます。`botId` は Bot を使うときに入れます
3. 画面右上の環境の選択で「LINE WORKS API (User Account)」を選びます

`userId` の既定値は `me` (認証されたユーザー自身) です。`me` は一部の API でだけ使えます ([LINE WORKS API 共通仕様の「me キーワード」](https://developers.worksmobile.com/jp/docs/api-call#me-keyword))。使えない API では、ドキュメントの `userId` の説明に従ってユーザー ID かログイン ID を指定してください。

雛形に入っている値 (`userId` の `me`) は、インポートすると共有値 (Postman のクラウドに同期される値) として登録されます。`clientId` / `clientSecret` は空のまま配っているので、Client ID や Client Secret を雛形に書き足してから共有しないでください。

コレクションへの認証の設定 (OAuth 2.0) は、Qiita 記事の手順を参照してください。

## License

MIT
