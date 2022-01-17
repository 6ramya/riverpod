import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/photo.dart';
import 'package:riverpod_demo/model/users.dart';
import 'package:riverpod_demo/network/network_request.dart';

final photoStateFuture = FutureProvider<List<Photo>?>((ref) async {
  return NetworkRequest().fetchPhotos();
});

final userStateFuture = FutureProvider<Users>((ref) async {
  return NetworkRequest().fetchUsers();
});
