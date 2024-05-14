abstract class AppEndpoints {
  static const baseUrl = "http://graduationbns360.runasp.net";

  //* Auth endpoints
  static const login = "$baseUrl/api/Account/login";
  static const register = "$baseUrl/api/Account/Register";
  static const forgetPassword = "$baseUrl/api/Account/forgetPassword";
  static const verifyOtp = "$baseUrl/api/Account/verfiyOtp";
  static const resetPassword = "$baseUrl/api/Account/resetPassword";

  //* Business
  static const addBusiness = "$baseUrl/api/Business/add";

  static String updateBusiness(String businessId) {
    return "$baseUrl/api/Business/UpdateBusiness/$businessId";
  }

  static String deleteBusiness(String businessId) {
    return "$baseUrl/api/Business/delete/$businessId";
  }

  static String getBusinessById(String businessId) {
    return "$baseUrl/api/Business/GetBusinessById/$businessId";
  }

  //* Business Categories
  static const getAllCategories = "$baseUrl/api/Category/GetAllCategories";

  //* Jobs
  static const addJob = "$baseUrl/api/Job";
  static const getAllJobs = "$baseUrl/api/Job";

  static String jobById(String jobId) {
    return "$baseUrl/api/Job/$jobId";
  }

  //* Properties
  static const addProperty = "$baseUrl/api/Property";
  static const getAllProperties = "$baseUrl/api/Property";

  static String propertyById(String propertyId, {bool addPrefix = true}) {
    if (addPrefix) {
      return "$baseUrl/api/Property/properties/$propertyId";
    }
    return "$baseUrl/api/Property/$propertyId";
  }
}
