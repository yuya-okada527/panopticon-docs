/**
  タスク作成画面に対するテストを記載する
 */
import { test, expect } from "@playwright/test";
import { E2EUtils } from "../utils/e2e-utils";

test.describe("New Task", () => {
  E2EUtils.addCommonHooks(test);
  test.skip("新規タスクが作成できる", async ({ page }) => {
    // TODO implements
    // 新規タスクが作成できる
    // createdで作成されること
  });
});
