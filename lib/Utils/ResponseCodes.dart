class ResponseCodes {

  // RESPONSE CODES

  // USER
  static var CODE_USER_LOGIN = "SUCCESS_200";
  static var CODE_USER_CREATED = "SUCCESS_201";
  static var CODE_USER_FOUND = "SUCCESS_202";
  static var CODE_USER_ALREADY_EXISTS = "ERROR_203";
  static var CODE_USER_INPUT_EMPTY = "ERROR_204";
  static var CODE_USER_DELETED = "SUCCESS_205";
  static var CODE_USER_SIGNUP_FAILED = "ERROR_400";
  static var CODE_USER_LOGIN_FAILED = "ERROR_401";
  static var CODE_USER_DELETED_FAILED = "ERROR_402";
  static var CODE_USER_NOT_FOUND = "ERROR_404";
  static var CODE_USER_EMAIL_INVALID = "ERROR_405";
  static var CODE_USER_PASSWORD_INVALID = "ERROR_406";    
  static var CODE_USER_PARAMETERS_INVALID = "ERROR_407";

  // GENERAL
  static var CODE_SOMETHING_WENT_WRONG = "ERROR_500";

  // RESPONSE MESSAGES

  // USER 
  static var MSG_USER_ALREADY_EXIST = "User is Already Available";
  static var MSG_USER_LOGIN_SUCCESSFULLY = "Welcome to Mera Thar";
  static var MSG_USER_LOGIN_FAILED = "User is Login Failed Due to Some Issue";
  static var MSG_NO_USER_EXIST = "User is Not Available";
  static var MSG_USER_PASSWORD_INCORRECT = "User's Password is Incorrect";
  static var MSG_USER_SIGNUP_SUCCESSFULLY = "User is Registered Successfully";
  static var MSG_USER_SIGNUP_FAILED = "User is Registered Failed Due to Some Issue";
  static var MSG_USER_PARAMETERS_UNAVAILABLE = "Some Parameters are Unavailable";
  static var MSG_USER_PARAMETERS_INVALID = "Input Fields are Empty or Invalid";
  static var MSG_USER_EMAIL_POLICY = "Provided Email doesn't meet the policy";
  static var MSG_USER_PASSWORD_POLICY = "Password Length should be more 6 and 1 Capital, 1 Small & 1 Number";
  static var MSG_USER_LOGOUT_SUCCESSFULLY = "User is Logout Successfully!";
  static var MSG_USER_FOUND_SUCCESSFULLY = "Requested User Found Successfully!";
  static var MSG_USER_DELETED_SUCCESSFULLY = "Hey! You'll be missed.";
  static var MSG_USER_DELETED_FAILED = "Requested User failed to Delete!";

  // GENERAL
  static var MSG_SOMETHING_WENT_WRONG = "Something went Wrong!";

}