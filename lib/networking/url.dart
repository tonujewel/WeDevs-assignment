class URL {
  //base url
  static var baseURL = 'https://apptest.dokandemo.com/';

  // Sign up URL - POST
  static final String signUpURL = "${baseURL}wp-json/wp/v2/users/register";

  // Sign in URL - POST
  static final String signInURL = "${baseURL}wp-json/jwt-auth/v1/token";

  // get user information
  static final String userInformationURL = "${baseURL}wp-json/wp/v2/users/me";

  // update user information
  static final String updateUserInformationURL = "${baseURL}wp-json/wp/v2/users/";
}
