class LoginSingelton {
  static String user_name = "";
  static String password = "";
  static String department= "";
  

  static bool isUserNameSet = false;
  static bool isUserPasswordSet = false;
  static bool isUserDepartmentSet = false;
  

  LoginSingelton._internal();

  static final LoginSingelton _singelton = LoginSingelton._internal();

  factory LoginSingelton() {
    return _singelton;
  }

  //setter method

  static void setUserName(String user_name) {
    user_name = user_name;
    isUserNameSet = true;
  }

  static void setUserPassword(String password) {
    password = password;
    isUserPasswordSet = true;
  }

  static void setUserDepartment(String department) {
    department = department;
    isUserDepartmentSet = true;
  }

  //getters
  static String getuser_name() {
    return user_name;
  }

  static String getpassword() {
    return password;
  }

  static String getdepartment() {
    return department;
  }
}