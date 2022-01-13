/**
  Project一覧画面に対するテストを記載する
 */
import { test, expect } from "@playwright/test";
import { ProjectsPage } from "../po/projects-page";
import { E2EUtils } from "../utils/e2e-utils";

test.describe("Projects", () => {
  test.describe(ProjectsPage.PATH, () => {
    test.beforeEach(async ({ page }) => {
      const projectsPage = new ProjectsPage(page);
      await projectsPage.goto();
    });
    test("プロジェクトTOPに遷移できること", async ({ page }) => {
      await page.locator("text='Local Project'").click();
      await expect(page).toHaveURL(/.*\/[0-9]+\/tasks/);
    });
    test("プロジェクトを追加できること", async ({ page }) => {
      await E2EUtils.sleep(2);
      await page.locator("input[type=text]").fill("E2E Project");
      await E2EUtils.sleep(2);
      await page.locator("text=Add").click();
      await expect(page.locator("a:has-text('E2E Project')")).toBeVisible();
    });
  });
});
