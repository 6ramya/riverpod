import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/users.dart';
import 'package:riverpod_demo/state/state_manager.dart';
import 'package:riverpod_demo/story_screen.dart';
import 'package:riverpod_demo/user_profile.dart';

class Tab1 extends ConsumerWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Users> users = ref.watch(userStateFuture);
    return Scaffold(
        body: users.when(
            data: (users) {
              return ListView.builder(
                  itemCount: users.results!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${users.results![index].picture!.thumbnail}'),
                            radius: 25,
                          ),
                          title: Text(
                              '${users.results![index].name!.first} ${users.results![index].name!.last}'),
                          onTap: () {
                            // Users? user = users[index];
                            // print(users[index].name);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => UserProfile(
                            //               user: users[index],
                            //             )));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StoryScreen()));
                          },
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  });
            },
            error: (err, stack) => Center(child: Text('${err.toString()}')),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
