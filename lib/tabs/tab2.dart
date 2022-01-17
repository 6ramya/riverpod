import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/state/state_manager.dart';

class Tab2 extends ConsumerWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<dynamic>?> photos = ref.watch(photoStateFuture);
    return Scaffold(
        body: photos.when(
            data: (photos) {
              return ListView.builder(itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(photos![index].url),
                        radius: 50,
                      ),
                      title: Text('${photos[index].title}'),
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
