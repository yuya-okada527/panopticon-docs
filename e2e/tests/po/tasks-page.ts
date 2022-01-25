import { expect, Locator, Page } from "@playwright/test";
import { E2EUtils } from "../utils/e2e-utils";

export class TasksPage {
  readonly page: Page;

  constructor(page: Page) {
    this.page = page;
  }

  async goto(projectId: number) {
    await this.page.goto(`/${projectId}/tasks`);
  }

  async isOnPage(projectId: number) {
    expect(this.page).toHaveURL(`/${projectId}/tasks`);
  }
}
