import 'package:dio/dio.dart';
import 'package:masterapi/users.dart';
import 'package:retrofit/http.dart';
part 'web_service.g.dart';

@RestApi(baseUrl: 'https://gorest.co.in/public/v2/')
abstract class WebService {
  factory WebService(Dio dio, {String baseUrl}) = _WebService;

  @GET('users')
  Future<List<Users>> getAllUsers();

  @GET('users/{id}')
  Future<Users> getUserById(@Path('id') int userId);

  @POST('users')
  Future<Users> createNewUser(
      @Body() Users newUser, @Header('Authorization') String token);
}
