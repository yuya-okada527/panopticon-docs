/**
  タスク作成画面に対するテストを記載する
 */
import { test, expect } from "@playwright/test";
import NewTaskPage from "../po/new-task-page";
import TasksPage from "../po/tasks-page";
import { E2EUtils } from "../utils/e2e-utils";

const projectId = 1;

test.describe("New Task", () => {
  E2EUtils.addCommonHooks(test);
  test.beforeEach(async ({ page }) => {
    const newTaskPage = new NewTaskPage(page);
    await newTaskPage.goto(projectId);
    await NewTaskPage.isOnPage(page);
  });
  test("新規タスクが作成できる", async ({ page }) => {
    const newTaskPage = new NewTaskPage(page);
    await E2EUtils.sleep(0.5);
    const name = "new task";
    await newTaskPage.fillName(name);
    await newTaskPage.fillDescription("new description");
    await newTaskPage.create();
    const tasksPage = new TasksPage(page);
    await tasksPage.goto(projectId);
    await page.reload();
    await tasksPage.isTaskVisible(name);
  });
});
