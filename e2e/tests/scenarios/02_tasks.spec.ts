/**
  Task一覧画面に対するテストを記載する
 */
import { test, expect } from "@playwright/test";
import { TasksPage } from "../po/tasks-page";
import { E2EUtils } from "../utils/e2e-utils";

test.describe("Tasks", () => {
  test.describe("/{project_id}/tasks", () => {
    test.beforeEach(async ({ page }) => {
      const projectId = 1;
      const tasksPage = new TasksPage(page);
      await tasksPage.goto(projectId);
      await tasksPage.isOnPage(projectId);
    });
    test.afterEach(async ({ page }, testInfo) => {
      const screenshot = await page.screenshot();
      await testInfo.attach("screenshot", {
        body: screenshot,
        contentType: "image/png",
      });
    });
    test("タスクプロバイダページに遷移できる", async ({ page }) => {
      await E2EUtils.sleep(1);
      await page.locator("text='Providers'").click();
      await expect(page).toHaveURL(/.*\/[0-9]+\/task_providers/);
    });
  });
});
