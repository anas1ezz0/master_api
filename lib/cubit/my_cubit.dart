import 'package:bloc/bloc.dart';
import 'package:masterapi/my_repo.dart';
import 'package:masterapi/users.dart';
import 'package:meta/meta.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;
  MyCubit(this.myRepo) : super(MyInitial());

  void emitAllUsers() {
    myRepo.getAllUsers().then((usersList) {
      emit(GetAllUsers(usersList));
    });
  }

  void emitUserDetails(int userId) {
    myRepo.getUserById(userId).then((userdetails) {
      emit(GetUserDetails(userdetails));
    });
  }

  void emitCreateNewUser(Users newUswer) {
    myRepo.createNewUser(newUswer).then((newUswer) {
      emit(CreateNewUser(newUswer));
    });
  }
}
