abstract class AppEndpoints {
  static const baseUrl = "http://bns360.runasp.net";

  //* Auth endpoints
  static const login = "$baseUrl/api/Account/login";
  static const register = "$baseUrl/api/Account/Register";
  static const forgetPassword = "$baseUrl/api/Account/forgetPassword";
  static const verifyOtp = "$baseUrl/api/Account/verfiyOtp";
  static const resetPassword = "$baseUrl/api/Account/resetPassword";
}
