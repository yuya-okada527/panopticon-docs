export class E2EUtils {
  static async sleep(sec: number) {
    return new Promise((resolve) => setTimeout(resolve, sec * 1000));
  }
}
