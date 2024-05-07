class ApiUrl {
  ///<<<=================Local  Base Url=========================>>>
 // static const socketUrl = "https://server.united-cadz.fr";
 // static const serverUrl = "https://server.united-cadz.fr";
  static const baseUrl = "http://192.168.10.3:5000/api/v1";
  static const imageUrl = "http://192.168.10.3:5000";
  static const socketUrl = "http://192.168.10.3:9000";


  static const signUp = "$baseUrl/users/create-user";
  static const otpVerify = "$baseUrl/otp/verify-otp";
  static const resendOtp = "$baseUrl/otp/resend-otp";
  static const signIn = "$baseUrl/auth/login";
  static const forgotPass = "$baseUrl/auth/forgot-password";
  static const resetPAss = "$baseUrl/auth/reset-password";
  static const profileInfo = "$baseUrl/users";
  static const userUpdate = "$baseUrl/users";
  static const homeEndPoint = "$baseUrl/restaurants";
  static const changePassword = "$baseUrl/auth/change-password";
  static const deleteAccount = "$baseUrl/users";
  static const getTableData = "$baseUrl/restaurants";
  static const bookingTable = "$baseUrl/booking";
  static const menuCategory = "$baseUrl/menu-categories";
  static const menuEndPoint = "$baseUrl/menu";
  static const bookingAllData = "$baseUrl/booking";
  static const menuDetails = "$baseUrl/menu";
  static const addCart = "$baseUrl/cart";
  static const allCart = "$baseUrl/cart";
  static const removeData = "$baseUrl/cart";
  static const myOrder = "$baseUrl/cart/my-orders";
  static const getSingleBooking = "$baseUrl/booking/details";
  static const orderDetails= "$baseUrl/cart/details/";
  static const showOrder= "$baseUrl/cart";
  static const removeList = "$baseUrl/cart";
  static const settingContent = "$baseUrl/content";
  static const removeorderData = "$baseUrl/cart";
  static const addFavourite = "$baseUrl/favoriteLists/menu";
  static const allFavourite = "$baseUrl/favoriteLists/?fields=menu";

}
