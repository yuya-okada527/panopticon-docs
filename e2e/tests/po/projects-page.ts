import { expect, Locator, Page } from "@playwright/test";
import PageObject from "./page-object";
import { E2EUtils } from "../utils/e2e-utils";

export default class ProjectsPage extends PageObject {
  static PATH: string = "/";

  constructor(page: Page) {
    super(page);
  }

  async goto() {
    await this.page.goto(ProjectsPage.PATH);
  }

  async selectProject(projectName: string) {
    await this.page.locator(`text='${projectName}'`).click();
    await expect(this.page).toHaveURL(/.*\/[0-9]+\/tasks/);
  }

  async fillProjectName(projectName: string) {
    await E2EUtils.sleep(1);
    await this.page.locator("input[type=text]").fill(projectName);
  }

  async clickAddButton() {
    await this.page.locator("text=Add").click();
  }

  async isProjectNameVisible(projectName: string) {
    await expect(
      this.page.locator(`a:has-text('${projectName}')`)
    ).toBeVisible();
  }
}
