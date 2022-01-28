import { expect, Page } from "@playwright/test";
import PageObject from "./page-object";

export default class TasksPage extends PageObject {
  constructor(page: Page) {
    super(page);
  }

  async goto(projectId: number) {
    await this.page.goto(`/${projectId}/tasks`);
  }

  async clickAddButton() {
    await this.page.locator(".add-button").click();
  }

  async isOnPage(projectId: number) {
    expect(this.page).toHaveURL(`/${projectId}/tasks`);
  }
}
