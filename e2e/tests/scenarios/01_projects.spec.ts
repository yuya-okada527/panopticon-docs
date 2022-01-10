import { test, expect } from "@playwright/test";

test.describe("Projects", () => {
  test.describe("/", () => {
    test.beforeEach(async ({ page }) => {
      await page.goto("/");
    });
    test("プロジェクトTOPに遷移できること", async ({ page }) => {
      await page.locator("text='Local Project'").click();
      await expect(page).toHaveURL(/.*\/[0-9]+\/tasks/);
    });
  });
});
