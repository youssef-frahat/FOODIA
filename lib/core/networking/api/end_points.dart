class EndPoints {
  static const String _baseUrl =
      "https://mangamediaa.com/house-food/public/api";
  static const String baseUrlImage =
      "https://mangamediaa.com/house-food/public/";

  static String login = "$_baseUrl/login";

  static String register = "$_baseUrl/register";
  static String verifyOtp = "$_baseUrl/verify-otp";
  static String resend = "$_baseUrl/resend-code";
  static String profile = "$_baseUrl/profile";
  static String updateProfile = "$_baseUrl/update-profile";
  static String logout = "$_baseUrl/logout";
  static String editProfile = "$_baseUrl/profile";
  static String getAllCategorys = "$_baseUrl/user/categories";
  static String getAllfoods = "$_baseUrl/user/foods";
  static String getAllDetails = "$_baseUrl/foods";
  static String reviews = "$_baseUrl/reviews";
  static String addCart = "$_baseUrl/addCart";
  static String getCart = "$_baseUrl/cart";
  static String deleteCart = "$_baseUrl/cart";
}
