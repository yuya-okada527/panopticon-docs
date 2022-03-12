import { expect, Page } from "@playwright/test";
import PageObject from "./page-object";

export default class NewTaskPage extends PageObject {
  constructor(page: Page) {
    super(page);
  }

  async goto(projectId: number) {
    await this.page.goto(`/${projectId}/new_task`);
  }

  async fillName(name: string) {
    await this.page.locator(".input-name").fill(name);
  }

  async fillDescription(description: string) {
    await this.page.locator("textarea").fill(description);
  }

  async create() {
    await this.page.locator("text=Create").click();
  }

  static async isOnPage(page: Page) {
    expect(page).toHaveURL(/.*\/[0-9]+\/new_task/);
  }
}
