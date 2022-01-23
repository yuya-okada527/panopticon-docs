import { expect, Locator, Page } from "@playwright/test";
import { E2EUtils } from "../utils/e2e-utils";

export class TasksPage {
  readonly page: Page;

  constructor(page: Page) {
    this.page = page;
  }
}
