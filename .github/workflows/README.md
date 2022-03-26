# GitHub Actions

## 利用 Actions

- actions/github-script
  - https://github.com/actions/github-script
  - https://octokit.github.io/rest.js/v18
- Jira 用
  - https://github.com/atlassian/gajira

## Tips

- ベストプラクティス
  - https://zenn.dev/snowcait/scraps/9d9c47dc4d0414
- デバッグログの追加
  - https://docs.github.com/ja/actions/monitoring-and-troubleshooting-workflows/enabling-debug-logging
  - 以下の変数を secrets にセットすると色々デバッグログが出る
    - ACTIONS_RUNNER_DEBUG: true
    - ACTIONS_STEP_DEBUG: true
- GitHub のペイロードを出力する
  ```
  run: cat $GITHUB_EVENT_PATH
  ```
