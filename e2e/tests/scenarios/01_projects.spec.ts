/**
  Project一覧画面に対するテストを記載する
 */
import { test, expect } from "@playwright/test";
import ProjectsPage from "../po/projects-page";
import { E2EUtils } from "../utils/e2e-utils";

test.describe("Projects", () => {
  test.describe(ProjectsPage.PATH, () => {
    test.beforeEach(async ({ page }) => {
      const projectsPage = new ProjectsPage(page);
      await projectsPage.goto();
    });
    test.afterEach(async ({ page }, testInfo) => {
      const screenshot = await page.screenshot();
      await testInfo.attach("screenshot", {
        body: screenshot,
        contentType: "image/png",
      });
    });
    test("プロジェクトTOPに遷移できること", async ({ page }) => {
      const projectsPage = new ProjectsPage(page);
      await projectsPage.selectProject("Local Project");
    });
    test("プロジェクトを追加できること", async ({ page }) => {
      const projectsPage = new ProjectsPage(page);
      const projectName = "E2E Project";
      await projectsPage.fillProjectName(projectName);
      await E2EUtils.sleep(1);
      await projectsPage.clickAddButton();
      await projectsPage.isProjectNameVisible(projectName);
    });
  });
});
