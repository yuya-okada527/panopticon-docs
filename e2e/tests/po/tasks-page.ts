import { expect, Locator, Page } from "@playwright/test";
import PageObject from "./page-object";
import { E2EUtils } from "../utils/e2e-utils";

export default class TasksPage extends PageObject {
  constructor(page: Page) {
    super(page);
  }

  async goto(projectId: number) {
    await this.page.goto(`/${projectId}/tasks`);
  }

  async isOnPage(projectId: number) {
    expect(this.page).toHaveURL(`/${projectId}/tasks`);
  }
}
