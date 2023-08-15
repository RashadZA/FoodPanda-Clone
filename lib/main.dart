import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_clone/Services/Routes/app_pages.dart';
import 'package:foodpanda_clone/Utils/design_utils.dart';
import 'package:foodpanda_clone/firebase_options.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FoodPanda Clone',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
      initialBinding: BindingsX.initialBindigs(),
      theme: AppTheme.lightTheme,
      unknownRoute: AppPages.unknownRoute,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List shops = [
//     {
//       "area": "Khan Chamkar Mon",
//       "image_url": "",
//       "latitude": 11.5502283,
//       "shopImage":
//           "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FCguEHiQ5QvQhoP7dSutwsB1dLFA3%2Fprofile?alt=media&token=7ffb7207-247a-4616-a94e-5989d1403579",
//       "houseNumber": "105",
//       "rating": 0,
//       "shopName": "Starbuck",
//       "totalRating": 0,
//       "uid": "CguEHiQ5QvQhoP7dSutwsB1dLFA3",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Tuol Kouk",
//       "image_url": "",
//       "latitude": 11.56732362224277,
//       "shopImage":
//           "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FJbjFrqUJRZToFe8c5op0Dnhzo9Z2%2Fprofile?alt=media&token=e3785606-650d-4d94-83d2-bc29fea39e2b",
//       "houseNumber": "N.83",
//       "rating": 0,
//       "shopName": "KOI Thé Reachtheany",
//       "totalRating": 0,
//       "uid": "JbjFrqUJRZToFe8c5op0Dnhzo9Z2",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Chamkar Mon",
//       "image_url": "",
//       "latitude": 11.5502283,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FCguEHiQ5QvQhoP7dSutwsB1dLFA3%2Fprofile?alt=media&token=7ffb7207-247a-4616-a94e-5989d1403579",
//       "houseNumber": "105",
//       "rating": 0,
//       "shopName": "Starbuck",
//       "totalRating": 0,
//       "uid": "CguEHiQ5QvQhoP7dSutwsB1dLFA3",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Tuol Kouk",
//       "image_url": "",
//       "latitude": 11.56732362224277,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FJbjFrqUJRZToFe8c5op0Dnhzo9Z2%2Fprofile?alt=media&token=e3785606-650d-4d94-83d2-bc29fea39e2b",
//       "houseNumber": "N.83",
//       "rating": 0,
//       "shopName": "KOI Thé Reachtheany",
//       "totalRating": 0,
//       "uid": "JbjFrqUJRZToFe8c5op0Dnhzo9Z2",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Chamkar Mon",
//       "image_url": "",
//       "latitude": 11.5502283,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FCguEHiQ5QvQhoP7dSutwsB1dLFA3%2Fprofile?alt=media&token=7ffb7207-247a-4616-a94e-5989d1403579",
//       "houseNumber": "105",
//       "rating": 0,
//       "shopName": "Starbuck",
//       "totalRating": 0,
//       "uid": "CguEHiQ5QvQhoP7dSutwsB1dLFA3",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Tuol Kouk",
//       "image_url": "",
//       "latitude": 11.56732362224277,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FJbjFrqUJRZToFe8c5op0Dnhzo9Z2%2Fprofile?alt=media&token=e3785606-650d-4d94-83d2-bc29fea39e2b",
//       "houseNumber": "N.83",
//       "rating": 0,
//       "shopName": "KOI Thé Reachtheany",
//       "totalRating": 0,
//       "uid": "JbjFrqUJRZToFe8c5op0Dnhzo9Z2",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Chamkar Mon",
//       "image_url": "",
//       "latitude": 11.5502283,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FCguEHiQ5QvQhoP7dSutwsB1dLFA3%2Fprofile?alt=media&token=7ffb7207-247a-4616-a94e-5989d1403579",
//       "houseNumber": "105",
//       "rating": 0,
//       "shopName": "Starbuck",
//       "totalRating": 0,
//       "uid": "CguEHiQ5QvQhoP7dSutwsB1dLFA3",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Tuol Kouk",
//       "image_url": "",
//       "latitude": 11.56732362224277,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FJbjFrqUJRZToFe8c5op0Dnhzo9Z2%2Fprofile?alt=media&token=e3785606-650d-4d94-83d2-bc29fea39e2b",
//       "houseNumber": "N.83",
//       "rating": 0,
//       "shopName": "KOI Thé Reachtheany",
//       "totalRating": 0,
//       "uid": "JbjFrqUJRZToFe8c5op0Dnhzo9Z2",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Chamkar Mon",
//       "image_url": "",
//       "latitude": 11.5502283,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FCguEHiQ5QvQhoP7dSutwsB1dLFA3%2Fprofile?alt=media&token=7ffb7207-247a-4616-a94e-5989d1403579",
//       "houseNumber": "105",
//       "rating": 0,
//       "shopName": "Starbuck",
//       "totalRating": 0,
//       "uid": "CguEHiQ5QvQhoP7dSutwsB1dLFA3",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Tuol Kouk",
//       "image_url": "",
//       "latitude": 11.56732362224277,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FJbjFrqUJRZToFe8c5op0Dnhzo9Z2%2Fprofile?alt=media&token=e3785606-650d-4d94-83d2-bc29fea39e2b",
//       "houseNumber": "N.83",
//       "rating": 0,
//       "shopName": "KOI Thé Reachtheany",
//       "totalRating": 0,
//       "uid": "JbjFrqUJRZToFe8c5op0Dnhzo9Z2",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Chamkar Mon",
//       "image_url": "",
//       "latitude": 11.5502283,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FCguEHiQ5QvQhoP7dSutwsB1dLFA3%2Fprofile?alt=media&token=7ffb7207-247a-4616-a94e-5989d1403579",
//       "houseNumber": "105",
//       "rating": 0,
//       "shopName": "Starbuck",
//       "totalRating": 0,
//       "uid": "CguEHiQ5QvQhoP7dSutwsB1dLFA3",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//     {
//       "area": "Khan Tuol Kouk",
//       "image_url": "",
//       "latitude": 11.56732362224277,
//       "shopImage":
//       "https://firebasestorage.googleapis.com/v0/b/foodpanda-7ecb8.appspot.com/o/seller%2FJbjFrqUJRZToFe8c5op0Dnhzo9Z2%2Fprofile?alt=media&token=e3785606-650d-4d94-83d2-bc29fea39e2b",
//       "houseNumber": "N.83",
//       "rating": 0,
//       "shopName": "KOI Thé Reachtheany",
//       "totalRating": 0,
//       "uid": "JbjFrqUJRZToFe8c5op0Dnhzo9Z2",
//       "emailVerified": true,
//       "phoneNumber": 1111111,
//       "province": "Phnom Penh",
//       "street": "Oknha Nou Kan Street (St. 105)",
//       "shopDescription": "Fresh and delicious drink!",
//       "name": "Hov Vathana",
//       "floor": "",
//       "isApproved": true,
//       "email": "hovvathana3@gmail.com",
//       "longitude": 104.9192617
//     },
//   ];
//   int _counter = 0;
//   final height = Get.height;
//   final width = Get.width;
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: CustomScrollView(
//         physics: const BouncingScrollPhysics(),
//         slivers: [
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     padding: const EdgeInsets.all(8.0),
//                     decoration: const BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: Center(
//                       // Center is a layout widget. It takes a single child and positions it
//                       // in the middle of the parent.
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           const Text(
//                             'You have pushed the button this many times:',
//                           ),
//                           Text(
//                             '$_counter',
//                             style: Theme.of(context).textTheme.headlineMedium,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(15),
//                   color: Colors.grey[200],
//                   child: buildCollage(context, height),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(15),
//                   color: Colors.grey[200],
//                   child: buildCollage(context, height),
//                 ),
//               ],
//             ),
//           ),
//
//           // SliverToBoxAdapter(
//           //   child: Column(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     children: [
//           //       Container(
//           //         padding: const EdgeInsets.all(15),
//           //         color: Colors.grey[200],
//           //         child: buildCollage(context, height),
//           //       ),
//           //       Column(
//           //         crossAxisAlignment: CrossAxisAlignment.start,
//           //         children: [
//           //           const SizedBox(height: 20),
//           //           const Padding(
//           //             padding: EdgeInsets.symmetric(horizontal: 15),
//           //             child: Text(
//           //               'Popular Restaurants',
//           //               style: TextStyle(
//           //                 fontSize: 20,
//           //                 fontWeight: FontWeight.bold,
//           //               ),
//           //             ),
//           //           ),
//           //           const SizedBox(height: 15),
//           //           SizedBox(
//           //               height: height * 0.3,
//           //               child: ListView.builder(
//           //                 physics: const BouncingScrollPhysics(),
//           //                 shrinkWrap: true,
//           //                 scrollDirection: Axis.horizontal,
//           //                 itemCount: shops.length,
//           //                 itemBuilder: (context, index) {
//           //                   final shop = shops[index];
//           //
//           //                   return Row(
//           //                     children: [
//           //                       SizedBox(width: index == 0 ? 15 : 0),
//           //                       GestureDetector(
//           //                         onTap: () {},
//           //                         child: SizedBox(
//           //                           height: height * 0.3,
//           //                           width: width * 0.6,
//           //                           child: Column(
//           //                             mainAxisAlignment: MainAxisAlignment.start,
//           //                             crossAxisAlignment: CrossAxisAlignment.start,
//           //                             children: [
//           //                               Stack(
//           //                                 children: [
//           //                                   ClipRRect(
//           //                                     borderRadius: BorderRadius.circular(10),
//           //                                     child: Image(
//           //                                       fit: BoxFit.cover,
//           //                                       height: height * 0.2,
//           //                                       width: double.infinity,
//           //                                       image: NetworkImage(shop['shopImage']),
//           //                                     ),
//           //                                   ),
//           //                                   Positioned(
//           //                                     top: 15,
//           //                                     left: 0,
//           //                                     child: Container(
//           //                                       decoration: const BoxDecoration(
//           //                                         color: Colors.white60,
//           //                                         borderRadius: BorderRadius.only(
//           //                                           topRight: Radius.circular(20),
//           //                                           bottomRight: Radius.circular(20),
//           //                                         ),
//           //                                       ),
//           //                                       child: const Padding(
//           //                                         padding:
//           //                                         EdgeInsets.only(top: 7, left: 5, right: 10, bottom: 7),
//           //                                         child: Text(
//           //                                           'Featured',
//           //                                           style: TextStyle(
//           //                                             color: Colors.white,
//           //                                             fontSize: 12,
//           //                                             fontWeight: FontWeight.w600,
//           //                                           ),
//           //                                         ),
//           //                                       ),
//           //                                     ),
//           //                                   ),
//           //                                   Positioned(
//           //                                     bottom: 10,
//           //                                     left: 10,
//           //                                     child: Container(
//           //                                       decoration: BoxDecoration(
//           //                                         color: const Color(0xfffffcff),
//           //                                         borderRadius: BorderRadius.circular(20),
//           //                                       ),
//           //                                       child: Padding(
//           //                                         padding:
//           //                                         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           //                                         child: Text(
//           //                                           ' ${shop['remainingTime']} min',
//           //                                           style: const TextStyle(
//           //                                             color: Colors.black,
//           //                                             fontSize: 12,
//           //                                             // fontFamily: boldFont,
//           //                                           ),
//           //                                         ),
//           //                                       ),
//           //                                     ),
//           //                                   ),
//           //                                 ],
//           //                               ),
//           //                               const SizedBox(height: 5),
//           //                               Row(
//           //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //                                 children: [
//           //                                   Text(
//           //                                     shop.shopName,
//           //                                     style: const TextStyle(
//           //                                       // color: MyColors.appBarTextColor,
//           //                                       fontSize: 14,
//           //                                       fontWeight: FontWeight.w700,
//           //                                       // fontFamily: boldFont,
//           //                                     ),
//           //                                   ),
//           //                                   Row(
//           //                                     children: [
//           //                                       Text(
//           //                                         shop['rating'].toString(),
//           //                                         style: const TextStyle(
//           //                                           // color: MyColors.appBarTextColor,
//           //                                           fontSize: 12,
//           //                                           // fontFamily: boldFont,
//           //                                         ),
//           //                                       ),
//           //                                       const SizedBox(width: 5),
//           //                                       Text(
//           //                                         '(${shop['totalRating']})',
//           //                                         style: const TextStyle(
//           //                                           // color: MyColors.secondaryIconColor,
//           //                                           fontSize: 12,
//           //                                           // fontFamily: lightFont,
//           //                                         ),
//           //                                       ),
//           //                                     ],
//           //                                   )
//           //                                 ],
//           //                               ),
//           //                               const SizedBox(height: 6),
//           //                               Text(
//           //                                 '\$ • ${shop['shopDescription']}',
//           //                                 style: const TextStyle(
//           //                                   // color: MyColors.secondaryIconColor,
//           //                                   fontSize: 12,
//           //                                   // fontFamily: regularFont,
//           //                                 ),
//           //                               ),
//           //                               Row(
//           //                                 crossAxisAlignment: CrossAxisAlignment.center,
//           //                                 mainAxisAlignment: MainAxisAlignment.start,
//           //                                 children: [
//           //                                   Icon(
//           //                                     Icons.directions_bike,
//           //                                     size: 14,
//           //                                     color: Colors.white60,
//           //                                   ),
//           //                                   const SizedBox(width: 5),
//           //                                   Text(
//           //                                     shop.deliveryPrice != 0
//           //                                         ? '\$ ${shop.deliveryPrice}'
//           //                                         : 'Free delivery',
//           //                                     style: TextStyle(
//           //                                       color:
//           //                                       shop.deliveryPrice != 0 ? Colors.black : Colors.white60,
//           //                                       fontSize: 12,
//           //                                       // fontFamily: regularFont,
//           //                                     ),
//           //                                   ),
//           //                                 ],
//           //                               )
//           //                             ],
//           //                           ),
//           //                         ),
//           //                       ),
//           //                       SizedBox(
//           //                           width: index == shops.length - 1 ? 15 : 10),
//           //                     ],
//           //                   );
//           //                 },
//           //               ))
//           //         ],
//           //       )
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
//
//   Column buildCollage(BuildContext context, double height) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: InkWell(
//             onTap: () {},
//             child: Container(
//               height: height * 0.20,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey[300]!),
//               ),
//               child: const Stack(
//                 alignment: Alignment.topLeft,
//                 children: [
//                   Positioned(
//                     bottom: 5,
//                     right: 5,
//                     child: Image(
//                       width: 150,
//                       image: AssetImage('assets/images/food_delivery.png'),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(15),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Food delivery',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                           ),
//                         ),
//                         Text(
//                           'Order food you love',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             height: 1,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   height: height * 0.35,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: Colors.grey[300]!),
//                   ),
//                   child: const Stack(
//                     alignment: Alignment.topLeft,
//                     children: [
//                       Positioned(
//                         bottom: 5,
//                         right: 20,
//                         child: Image(
//                           width: 100,
//                           image: AssetImage('assets/images/shops.png'),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(15),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Shops',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             Text(
//                               'Groceries and more',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w400,
//                                 height: 1,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 flex: 1,
//                 child: Column(
//                   children: [
//                     Container(
//                       width: double.infinity,
//                       height: height * 0.25,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.grey[300]!),
//                       ),
//                       child: const Stack(
//                         alignment: Alignment.topLeft,
//                         children: [
//                           Positioned(
//                             bottom: 10,
//                             right: 0,
//                             child: Image(
//                               width: 100,
//                               image: AssetImage('assets/images/pick_up.png'),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(15),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Pick-up',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Up to 50% off',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     height: 1,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       width: double.infinity,
//                       height: height * 0.10,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.grey[300]!),
//                       ),
//                       child: const Stack(
//                         alignment: Alignment.topLeft,
//                         children: [
//                           Positioned(
//                             bottom: 5,
//                             right: 0,
//                             child: Image(
//                               width: 55,
//                               image: AssetImage('assets/images/pandasend.png'),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 8),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'pandasend',
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Express\nDelivery',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w400,
//                                     height: 1,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
