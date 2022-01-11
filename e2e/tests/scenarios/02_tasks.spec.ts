/**
  Task一覧画面に対するテストを記載する
 */
import { test, expect } from "@playwright/test";
import { E2EUtils } from "../utils/e2e-utils";

test.describe("Tasks", () => {
  test.describe("/{project_id}/tasks", () => {
    test.beforeEach(async ({ page }) => {
      // TODO  PageObjectパターンにリファクタリングする
      await page.goto("/");
      await page.locator("text='Local Project'").click();
      await expect(page).toHaveURL(/.*\/[0-9]+\/tasks/);
    });
    test("タスクプロバイダページに遷移できる", async ({ page }) => {
      await E2EUtils.sleep(1);
      await page.locator("text='Providers'").click();
      await expect(page).toHaveURL(/.*\/[0-9]+\/task_providers/);
    });
  });
});
