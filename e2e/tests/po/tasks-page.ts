import { expect, Page, Locator } from "@playwright/test";
import PageObject from "./page-object";

type TaskStatus = "Created" | "Todo" | "Doing" | "Done" | "Closed";

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

  async countTasks(taskStatus: TaskStatus): number {
    return await this.getTaskList(taskStatus).locator("li").count();
  }

  async moveTask(
    taskName: string,
    fromStatus: TaskStatus,
    toStatus: TaskStatus
  ) {
    // TODO Playwrightでdrag and drop APIの操作がうまくいかない
    const targetTask = await this.getTaskList(fromStatus).locator(
      `text='${taskName}'`
    );
    const toStatusTaskList = await this.getTaskList(toStatus);
    await targetTask.dragTo(toStatusTaskList);
  }

  private getTaskList(taskStatus: TaskStatus): Locator {
    return this.page.locator(`.task-list-card:has-text('${taskStatus}')`);
  }

  async isOnPage(projectId: number) {
    expect(this.page).toHaveURL(`/${projectId}/tasks`);
  }
}
