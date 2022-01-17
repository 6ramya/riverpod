// import 'package:flutter/material.dart';
// import 'package:riverpod_demo/model/users.dart';
// import 'package:riverpod_demo/network/network_request.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder<List<Users>?>(
//       future: NetworkRequest().fetchUsers(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                     title:
//                         Text('${snapshot.data![index].results![index].name}'));
//               });
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     ));
//   }
// }
