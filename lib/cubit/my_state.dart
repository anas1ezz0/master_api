part of 'my_cubit.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class GetAllUsers extends MyState {
  final List<Users> allUsersList;

  GetAllUsers(this.allUsersList);
}

class GetUserDetails extends MyState {
  final Users userDetails;

  GetUserDetails(this.userDetails);
}

class CreateNewUser extends MyState {
  final Users newUser;

  CreateNewUser(this.newUser);
}
