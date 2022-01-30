import { Page, Locator } from "@playwright/test";

export default class PageObject {
  readonly page: Page;
  readonly providersLink: Locator;

  constructor(page: Page) {
    this.page = page;
    this.providersLink = this.page.locator("text='Providers'");
  }

  async gotoProvidersPage() {
    await this.providersLink.click();
  }
}
