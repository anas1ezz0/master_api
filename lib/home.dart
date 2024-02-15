import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterapi/cubit/my_cubit.dart';
import 'package:masterapi/users.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Users> allUsers = [];
  Users userdetails = Users();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MyCubit>(context).emitAllUsers();
    // BlocProvider.of<MyCubit>(context).emitUserDetails(6006975);
    BlocProvider.of<MyCubit>(context).emitAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            BlocBuilder<MyCubit, MyState>(
              builder: (context, state) {
                if (state is GetAllUsers) {
                  allUsers = (state).allUsersList;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: allUsers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(15)),
                          height: 50,
                          child: Center(
                              child: Text(allUsers[index].email.toString())),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            // BlocBuilder<MyCubit, MyState>(
            //   builder: (context, state) {
            //     if (state is CreateNewUser) {
            //       userdetails = (state).newUser;
            //       // return ListView.builder(

            //       //   shrinkWrap: true,
            //       //   itemCount: 1,
            //       //   itemBuilder: (context, index) {
            //       //     return Padding(
            //       //       padding: const EdgeInsets.all(8.0),
            //       //       child: Container(
            //       //         decoration: BoxDecoration(
            //       //             color: Colors.blueAccent,
            //       //             borderRadius: BorderRadius.circular(15)),
            //       //         height: 50,
            //       //         child: Center(
            //       //             child: Text(allUsers[index].email.toString())),
            //       //       ),
            //       //     );
            //       //   },
            //       // );
            //       return Container(
            //         decoration: BoxDecoration(
            //             color: Colors.blueAccent,
            //             borderRadius: BorderRadius.circular(15)),
            //         height: 50,
            //         child: Center(child: Text(userdetails.email.toString())),
            //       );
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
          ],
        ));
  }
}
