import { expect, Page } from "@playwright/test";
import PageObject from "./page-object";

export default class TaskProvidersPage extends PageObject {
  constructor(page: Page) {
    super(page);
  }

  static async isOnPage(page: Page) {
    await expect(page).toHaveURL(/.*\/[0-9]+\/task_providers/);
  }
}
