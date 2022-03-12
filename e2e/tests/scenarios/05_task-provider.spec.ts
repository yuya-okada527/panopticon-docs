/**
  タスクプロバイダ画面に対するテストを記載する
 */
import { test, expect } from "@playwright/test";
import { E2EUtils } from "../utils/e2e-utils";

test.describe("Task Provider", () => {
  E2EUtils.addCommonHooks(test);
  test.skip("新規タスクプロバイダが作成できる", async ({ page }) => {
    // TODO implements
  });
  test.skip("タスクプロバイダと同期できる", async ({ page }) => {
    // TODO implements
  });
  test.skip("タスクプロバイダを削除できる", async ({ page }) => {
    // TODO implements
  });
});
