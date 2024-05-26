abstract class AppEndpoints {
  static const baseUrl = "http://graduationbns360.runasp.net";

  //* Auth endpoints
  static const login = "$baseUrl/api/Account/login";
  static const register = "$baseUrl/api/Account/Register";
  static const forgetPassword = "$baseUrl/api/Account/forgetPassword";
  static const verifyOtp = "$baseUrl/api/Account/verfiyOtp";
  static const resetPassword = "$baseUrl/api/Account/resetPassword";

  //* Business
  static const addBusiness = "$baseUrl/api/Business";

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

  //* Business Categories
  static const getAllCategories = "$baseUrl/api/Categories";
  static String getAllCategoryItems(int id) {
    return "$baseUrl/api/Business/all-businessesWithReviewsAndCategories/$id";
  }

  static String getCategoryItem(int id) {
    return "$baseUrl/api/Business/$id";
  }

  //* Jobs
  static const addJob = "$baseUrl/api/Job";
  static const getAllJobs = "$baseUrl/api/Job";

  static String jobById(String jobId) {
    return "$baseUrl/api/Job/$jobId";
  }

  //* Properties
  static const addProperty = "$baseUrl/api/property";
  static const getAllProperties = "$baseUrl/api/Property";

  static String propertyById(int propertyId) {
    return "$baseUrl/api/Property/$propertyId";
  }

  //* PROFILE
  static String getProfile(String userId) {
    return "$baseUrl/api/Profile/$userId";
  }

  static const editProfileImage = "$baseUrl/api/Profile/updateImage";
  static String editProfileName(String userId) {
    return "$baseUrl/api/Profile/$userId/name";
  }

  static const changePassword = "$baseUrl/api/Account/ChangePassword";

  //* REVIEWS
  static String getBusinessReviews(int businessId) {
    return "$baseUrl/api/RatingAndReviewForBusiness/$businessId";
  }

  static String getBusinessReviewSummary(int businessId) {
    return "$baseUrl/api/RatingAndReviewForBusiness/summary/$businessId";
  }

  static String removeBusingsReview(int reviewId) {
    return "$baseUrl/api/RatingAndReviewForBusiness/{reviewAndRatingId}/$reviewId";
  }

  static const sendReview = "$baseUrl/api/RatingAndReviewForBusiness";

  //* Favorites
  static const businessFavorite = "$baseUrl/api/FavoritesBusinesses";
  static String getBusinessFavorites(String userId) {
    return "$baseUrl/api/FavoritesBusinesses/GetBusinessReviewSummary/$userId";
  }

  static const craftsmenFavorite = "$baseUrl/api/FavoritesCraftsmen";
  static String getCraftsmenFavorites(String userId) {
    return "$baseUrl/api/FavoritesCraftsmen/GetCraftsmanFavorites/$userId";
  }

  //* Saved
  static const savedJobs = "$baseUrl/api/SavedJobs";

  static const savedProperties = "$baseUrl/api/SavedProperty";

  //* My posts
  static String myPostsJobs(String userId) {
    return "$baseUrl/api/Profile/jobs/$userId";
  }

  static String myPostsProperties(String userId) {
    return "$baseUrl/api/Profile/properties/$userId";
  }
}
