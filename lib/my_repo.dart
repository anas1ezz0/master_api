import 'package:masterapi/service/web_service.dart';
import 'package:masterapi/users.dart';

class MyRepo {
  final WebService webService;

  MyRepo(this.webService);

  Future<List<Users>> getAllUsers() async {
    return await webService.getAllUsers();
  }

  Future<Users> getUserById(int userId) async {
    return await webService.getUserById(userId);
  }

  Future<Users> createNewUser(Users newUser) async {
    return await webService.createNewUser(newUser,
        'Bearer 07c2b24346737a4d279025526096834784f67ea451884d1627b8cf748748f434');
  }
}
