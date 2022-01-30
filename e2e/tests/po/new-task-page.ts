import { expect, Page } from "@playwright/test";
import PageObject from "./page-object";

export default class NewTaskPage extends PageObject {
  constructor(page: Page) {
    super(page);
  }

  static async isOnPage(page: Page) {
    expect(page).toHaveURL(/.*\/[0-9]+\/new_task/);
  }
}
