class ApiUrl {
  ///<<<=================Local  Base Url=========================>>>
 // static const socketUrl = "https://server.united-cadz.fr";
 // static const serverUrl = "https://server.united-cadz.fr";
  static const baseUrl = "http://103.145.138.78:5000/api/v1";


  static const signUp = "$baseUrl/users/create-user";
  static const otpVerify = "$baseUrl/otp/verify-otp";
  static const resendOtp = "$baseUrl/otp/resend-otp";
  static const signIn = "$baseUrl/auth/login";
  static const forgotPass = "$baseUrl/auth/forgot-password";
  static const resetPAss = "$baseUrl/auth/reset-password";
  static const profileInfo = "$baseUrl/users";

}
