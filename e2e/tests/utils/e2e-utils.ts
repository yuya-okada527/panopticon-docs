export class E2EUtils {
  static async sleep(sec: number) {
    return new Promise((resolve) => setTimeout(resolve, sec * 1000));
  }
  static addCommonHooks(test) {
    test.afterEach(async ({ page }, testInfo) => {
      const screenshot = await page.screenshot();
      await testInfo.attach("screenshot", {
        body: screenshot,
        contentType: "image/png",
      });
    });
  }
}
