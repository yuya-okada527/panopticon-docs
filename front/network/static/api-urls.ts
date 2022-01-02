export default class ApiUrls {
  static getProjectsUrl = (apiUrl: string) => `${apiUrl}/v1/projects`;

  static getTasksUrl = (apiUrl: string, project_id: string | string[]) =>
    `${apiUrl}/v1/projects/${project_id}/tasks`;

  static getTaskUrl = (
    apiUrl: string,
    project_id: string | string[],
    task_id: string | string[]
  ) => `${apiUrl}/v1/projects/${project_id}/tasks/${task_id}`;

  static getTaskStatusUrl = (
    apiUrl: string,
    project_id: string | string[],
    task_id: string | string[]
  ) => `${apiUrl}/v1/projects/${project_id}/tasks/${task_id}/status`;

  static getTaskProvidersUrl = (
    apiUrl: string,
    project_id: string | string[]
  ) => `${apiUrl}/v1/projects/${project_id}/task_providers`;

  static getTaskProviderUrl = (
    apiUrl: string,
    project_id: string | string[],
    task_provider_id: string | string[]
  ) => `${apiUrl}/v1/projects/${project_id}/task_providers/${task_provider_id}`;

  static getTaskProviderSyncUrl = (
    apiUrl: string,
    project_id: string | string[],
    task_provider_id: string | string[]
  ) =>
    `${apiUrl}/v1/projects/${project_id}/task_providers/${task_provider_id}/sync`;
}
