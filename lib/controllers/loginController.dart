import '../services/loginServices.dart';

// start login process
// 1. check user email and password is correct return true or false
// 1 is true = push to Homepage
// 1 is false = go to 2
// 2. check if user email exists return true or false
// 2 is true = return to page , message = user email and password incorrect , stay in loginPage
// 2 is false = addUser, message = user created and push to HomePage
// end

Future<bool> loginProcess(String email, String password) async {
  bool status = false;
  if (await userAuth(email, password)) {
    status = true;
    return status;
  } else if (await userExists(email)) {
    status = false;
    return status;
  }
  else if (!await userExists(email)) {
    // sudo registration
    addUser("Test", email, password);
    status = true;
    return status;
  }
  return status;
}

Future<bool> userAuth(String email, String password) {
  // step 1
  return checkUserAuth(email, password).then((value) {
    print("Get User ${value.size}");
    if (value.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }).catchError((error) {
    print("Failed to check User Auth: ${error.toString()}");
    return false;
  });
}

Future<bool> userExists(String email) {
  // step 2
  return findUser(email).then((value) {
    print("Get User");
    if (value.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }).catchError((error) {
    print("Failed to find User: ${error.toString()}");
    return false;
  });
}


// registration process
Future<bool> registerProcess(String fullNme, String email, String password) async {
  bool status = false;
  if (!await userExists(email)) {
    // sudo registration
    addUser("Test", email, password);
    status = true;
    return status;
  }
  else {
    return status;
  }
}
