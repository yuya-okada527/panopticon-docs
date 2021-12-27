# GitHub 連携の部分の詳細設計

## GitHub API で Issue 情報を取得

https://api.github.com/repos/microsoft/playwright/issues?per_page=30&page=16

````json
[
{
"url": "https://api.github.com/repos/microsoft/playwright/issues/1090",
"repository_url": "https://api.github.com/repos/microsoft/playwright",
"labels_url": "https://api.github.com/repos/microsoft/playwright/issues/1090/labels{/name}",
"comments_url": "https://api.github.com/repos/microsoft/playwright/issues/1090/comments",
"events_url": "https://api.github.com/repos/microsoft/playwright/issues/1090/events",
"html_url": "https://github.com/microsoft/playwright/issues/1090",
"id": 570117009,
"node_id": "MDU6SXNzdWU1NzAxMTcwMDk=",
"number": 1090,
"title": "[Feature] support route aka request interception for service workers",
"user":{"login": "Francois-Esquire", "id": 12474067, "node_id": "MDQ6VXNlcjEyNDc0MDY3", "avatar_url": "https://avatars.githubusercontent.com/u/12474067?v=4",…},
"labels":[
{"id": 3507599373, "node_id": "LA_kwDODTssw87REbgN", "url": "https://api.github.com/repos/microsoft/playwright/labels/v1.18",…}
],
"state": "open",
"locked": false,
"assignee":{"login": "pavelfeldman", "id": 883973, "node_id": "MDQ6VXNlcjg4Mzk3Mw==", "avatar_url": "https://avatars.githubusercontent.com/u/883973?v=4",…},
"assignees":[
{"login": "pavelfeldman", "id": 883973, "node_id": "MDQ6VXNlcjg4Mzk3Mw==", "avatar_url": "https://avatars.githubusercontent.com/u/883973?v=4",…}
],
"milestone": null,
"comments": 10,
"created_at": "2020-02-24T20:12:29Z",
"updated_at": "2021-12-15T15:15:11Z",
"closed_at": null,
"author_association": "CONTRIBUTOR",
"active_lock_reason": null,
"body": "Hi,\r\n\r\nI'd like to be able to include markup directly instead of using `page.goto` to a remote address. I currently have a small example here of what I've tried out but it appears that `'serviceWorker' in navigator` is returning false and registering a service worker fails.\r\n\r\nI've tried `page.setContent` as well and I had the same results.\r\n\r\nCan anyone tell me what I'm missing? The example I am running:\r\n\r\n```js\r\nconst { chromium } = require('playwright');\r\n\r\nconst msg = 'hi';\r\n\r\nconst serviceWorkerPath = '/sw.js';\r\nconst serviceWorkerScope = '/';\r\nconst serviceWorker = `console.log(\"${msg}\");`;\r\n\r\nconst html = `<!doctype html>\r\n<html>\r\n  <head>\r\n    <title>One Service Worker</title>\r\n  </head>\r\n\r\n  <body>\r\n    <script type=\"text/javascript\">\r\n      console.log('serviceWorker' in navigator);\r\n\r\n      try {\r\n        navigator.serviceWorker.register('${serviceWorkerPath}', {\r\n          scope: '${serviceWorkerScope}'\r\n        });\r\n      } catch (e) {\r\n        console.error(e);\r\n      }\r\n    </script>\r\n  </body>\r\n</html>\r\n`.trim();\r\n\r\n(async () => {\r\n  const browser = await chromium.launch();\r\n  const page = await browser.newPage();\r\n\r\n  await page.route('**/*.html', async request =>\r\n    request.fulfill({\r\n      status: 200,\r\n      contentType: 'text/html',\r\n      body: html,\r\n    }),\r\n  );\r\n\r\n  await page.route(serviceWorkerPath, request =>\r\n    request.fulfill({\r\n      status: 200,\r\n      contentType: 'text/javascript',\r\n      body: serviceWorker,\r\n    }),\r\n  );\r\n\r\n  await page.goto('http://example.com/index.html', {\r\n    waitUntil: 'load',\r\n  });\r\n\r\n  const sw = await page.evaluate(`window.navigator.serviceWorker`);\r\n  \r\n  console.log(sw);\r\n\r\n  if (sw) {\r\n    const swTarget = await browser.waitForTarget(target => target.type() === 'service_worker');\r\n    const worker = await browser.serviceWorker(swTarget);\r\n    // use worker target/handle\r\n  }\r\n\r\n  await browser.close();\r\n})();\r\n```",
"reactions":{"url": "https://api.github.com/repos/microsoft/playwright/issues/1090/reactions", "total_count": 29,…},
"timeline_url": "https://api.github.com/repos/microsoft/playwright/issues/1090/timeline",
"performed_via_github_app": null
}
]
````

## ヘッダーの指定方法

```
Authorization: token $TOKEN
```

## Not Todo

- 実行を非同期化する
- オンラインとオフラインの両方で実行できるようにする
