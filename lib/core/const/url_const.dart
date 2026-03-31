class  UrlConst{
  static const String baseUrl = "https://bdms-laravel-main-ig0iag.free.laravel.cloud/api/v1";
  static const String register = "/auth/register";
  static const String login = "/auth/login";
  static const String profile = '/user';
  static const String donor = '/donors';
  static const String logout = "/auth/logout";
  static const String appointment = "/appointments";
  static const String dashboard = "/user-dashboard";
  static String becomeDonorPath(String userId) => "/user/$userId/donors";
}