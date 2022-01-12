import { expect, Locator, Page } from "@playwright/test";

export class ProjectsPage {
  readonly page: Page;

  static PATH: string = "/";

  constructor(page: Page) {
    this.page = page;
  }

  async goto() {
    await this.page.goto(ProjectsPage.PATH);
  }
}
