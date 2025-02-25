class EndPoints {
  static const String login = 'login';
  static const String register = 'register';
  static const String profile = 'profile';
  static const String baseUrl = 'https://food-api-omega.vercel.app/api/v1/';
  static const String signIn = 'user/signin';
  static const String signUp = 'user/signup';
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKeys {
  static String status = 'status';
  static String errorMessage = 'ErrorMessage';
  static String email = 'email';
  static String password = 'password';
  static String name = 'name';
  static String confirmPassword = 'confirmPassword';
  static String profilePic = 'profilePic';
  static String location = 'location';
  static String phone = 'phone';

  static String token = 'token';
  static String message = 'message';
  static String id = 'id';
}
