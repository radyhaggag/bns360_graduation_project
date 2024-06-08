import 'package:bns360_graduation_project/config/app_config.dart';

abstract class AppEndpoints {
  static String get baseUrl {
    if (AppConfig().isDev) {
      return "http://graduationbns360.runasp.net";
    } else {
      return "http://bns360.runasp.net/";
    }
  }

  //* Auth endpoints
  static String login = "$baseUrl/api/Account/login";
  static String register = "$baseUrl/api/Account/Register";
  static String forgetPassword = "$baseUrl/api/Account/forgetPassword";
  static String verifyOtp = "$baseUrl/api/Account/verfiyOtp";
  static String resetPassword = "$baseUrl/api/Account/resetPassword";

  //* Business
  static String addBusiness = "$baseUrl/api/Business";

  static String updateBusiness(int businessId) {
    return "$baseUrl/api/Business/$businessId";
  }

  static String deleteBusiness(int businessId) {
    return "$baseUrl/api/Business/$businessId";
  }

  static String getBusinessById(int businessId) {
    return "$baseUrl/api/Business/$businessId";
  }

  static String getMyBusiness(String userId) {
    return "$baseUrl/api/Business/business-owner/$userId";
  }

  //* Crafts
  static String addCraftsman = "$baseUrl/api/Craftsmen";

  static String updateCraftsman(int businessId) {
    return "$baseUrl/api/Craftsmen/$businessId";
  }

  static String deleteCraftsman(int craftsmanId) {
    return "$baseUrl/api/Craftsmen/$craftsmanId";
  }

  static String getCraftsmanById(int craftsmanId) {
    return "$baseUrl/api/Craftsmen/$craftsmanId";
  }

  static String getMyCraftsman(String userId) {
    return "$baseUrl/api/Craftsmen/craftsman/$userId";
  }

  //* Business Categories
  static String getAllCategories = "$baseUrl/api/Categories";
  static String getAllCategoryItems(int id) {
    return "$baseUrl/api/Business/all-businessesWithReviewsAndCategories/$id";
  }

  static String getCategoryItem(int id) {
    return "$baseUrl/api/Business/$id";
  }

  //* Jobs
  static String addJob = "$baseUrl/api/Job";
  static String getAllJobs = "$baseUrl/api/Job";

  static String jobById(String jobId) {
    return "$baseUrl/api/Job/$jobId";
  }

  //* Properties
  static String addProperty = "$baseUrl/api/property";
  static String getAllProperties = "$baseUrl/api/Property";

  static String propertyById(int propertyId) {
    return "$baseUrl/api/Property/$propertyId";
  }

  //* PROFILE
  static String getProfile(String userId) {
    return "$baseUrl/api/Profile/$userId";
  }

  static String editProfileImage = "$baseUrl/api/Profile/updateImage";
  static String editProfileName(String userId) {
    return "$baseUrl/api/Profile/$userId/name";
  }

  static String changePassword = "$baseUrl/api/Account/ChangePassword";

  //* REVIEWS
  static String getBusinessReviews(int businessId) {
    return "$baseUrl/api/RatingAndReviewForBusiness/$businessId";
  }

  static String getBusinessReviewSummary(int businessId) {
    return "$baseUrl/api/RatingAndReviewForBusiness/summary/$businessId";
  }

  static String removeBusinessReview({
    required String userId,
    required int reviewAndRatingId,
    required int businessId,
  }) {
    return "$baseUrl/api/RatingAndReviewForBusiness/$userId/$businessId/$reviewAndRatingId";
  }

  static String sendBusinessReview = "$baseUrl/api/RatingAndReviewForBusiness";

  static String geCraftsmanReviews(int craftsmanId) {
    return "$baseUrl/api/RatingAndReviewForCraftsman/$craftsmanId";
  }

  static String getCraftsmanReviewSummary(int craftsmanId) {
    return "$baseUrl/api/RatingAndReviewForCraftsman/summary/$craftsmanId";
  }

  static String removeCraftsmanReview({
    required String userId,
    required int reviewAndRatingId,
    required int craftsmanId,
  }) {
    return "$baseUrl/api/RatingAndReviewForCraftsman/$userId/$craftsmanId/$reviewAndRatingId";
  }

  static String sendCraftsmanReview =
      "$baseUrl/api/RatingAndReviewForCraftsman";

  //* Favorites
  static String businessFavorite = "$baseUrl/api/FavoritesBusinesses";
  static String getBusinessFavorites(String userId) {
    return "$baseUrl/api/FavoritesBusinesses/GetBusinessReviewSummary/$userId";
  }

  static String craftsmenFavorite = "$baseUrl/api/FavoritesCraftsmen";
  static String getCraftsmenFavorites(String userId) {
    return "$baseUrl/api/FavoritesCraftsmen/GetCraftsmanFavorites/$userId";
  }

  //* Saved
  static String savedJobs = "$baseUrl/api/SavedJobs";

  static String savedProperties = "$baseUrl/api/SavedProperty";

  //* My posts
  static String myPostsJobs(String userId) {
    return "$baseUrl/api/Profile/jobs/$userId";
  }

  static String myPostsProperties(String userId) {
    return "$baseUrl/api/Profile/properties/$userId";
  }

  //* Crafts
  static String getCraftItemsById(int craftId) {
    return "$baseUrl/api/Craftsmen/GetAllCraftsmenWithDetails/$craftId";
  }

  static String getAllCrafts = "$baseUrl/api/Crafts";

  //* account
  static String deleteAccount(String userId) => "$baseUrl/api/Profile/$userId";
}
