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
  static String addAdress = "$_baseUrl/addresses";
  static String getAdress = "$_baseUrl/addresses";
  static String updateAdress = "$_baseUrl/addresses";
  static String deleteAdress = "$_baseUrl/addresses";
  static String followChef = "$_baseUrl/follow-chef";
  static String getFollowers = "$_baseUrl/my-followed-chefs";
  static String getFoodsChefe = "$_baseUrl/followed-chefs/foods";
  static String getProfileChefe = "$_baseUrl/followed";
  static String order = "$_baseUrl/my-orders";
  static String cancelOrder = "$_baseUrl/cancel-order";
  static String balance = "$_baseUrl/wallet/balance";
  static String orderDetails= "$_baseUrl/order/details";
  static String addBalance= "$_baseUrl/wallet/recharge";
  static String specialOffer = "$_baseUrl/user/offer-prices";
}
