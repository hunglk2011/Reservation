import 'package:first_app/Screen/login.dart';
import 'package:first_app/Routes/routeNamed.dart';
import 'package:first_app/Models/apearance.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Apearance.prefs = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      home: LoginScreen(),
      onGenerateRoute: (value) => Routenamed.generateRouted(value),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// class GetData extends StatelessWidget {

//   const GetData({super.key});

//     @override
//   Widget build(BuildContext context) {
//       return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           body: Column(
//           children: [
//               Column(
//                 children: [
//                   Icon(Icons.call, color: Colors.blue,),
//                   Text("Call"),
//                 ],
//               ),
//               SizedBox(width: 15,),
//               Column(
//                 children: [
//                   Icon(Icons.send, color: Colors.blue),
//                   Text("Send"),
//                 ],
//               ),
//               SizedBox(width: 15,),
//               Column(
//                 children: [
//                   Icon(Icons.link_sharp,color: Colors.blue),
//                   Text("Share"),
//                 ],
//               ),
//           ],
//       );
//   }
// }

// class GetData2 extends StatelessWidget {
//   const GetData2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.network(
//             'https://edu-api.vndigitech.com/uploads/course/photo/20230116031559_dss.png'),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Framework Flutter",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               width: 30,
//             ),
//             Icon(
//               Icons.star,
//               color: Colors.red,
//             ),
//             SizedBox(
//               width: 15,
//             ),
//             Text(
//               "41",
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//         SizedBox(height: 15),
//         // GetData(),
//         SizedBox(height: 10),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Text(
//             "Flutter ships applications with its own rendering engine which directly outputs pixel data to the screen.[15][16] This is in contrast to many other UI frameworks that rely on the target platform to provide a rendering engine, "
//             "such as native Android apps which rely on the device-level Android SDK or IOS SDK which dynamically uses the target platform's built-in UI stack. "
//             "Flutter's control of its rendering pipeline simplifies multi-platform support as identical UI code can be used for all target platforms.",
//             style: TextStyle(),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class CreateContainer extends StatelessWidget {
//   const CreateContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       width: 200,
//       decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: Colors.red, width: 2)),
//       alignment: Alignment.center,
//       child: Column(
//         spacing: 10,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.network(
//             'https://edu-api.vndigitech.com/uploads/course/photo/20230116031559_dss.png',
//             width: 150,
//             height: 75,
//           ),
//           FloatingActionButton(
//             onPressed: () {},
//             child: Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ListProducts extends StatelessWidget {
//   ListProducts({super.key});
//   // data
//   final List<Product> products = [
//     Product(
//         name: "T-Shirt",
//         description: "Comfortable cotton t-shirt",
//         numberStar: 3,
//         price: 19.99),
//     Product(
//         name: "Jeans",
//         description: "High-quality denim jeans",
//         numberStar: 5,
//         price: 39.99),
//     Product(
//         name: "Sneakers",
//         description: "Stylish running shoes",
//         numberStar: 4,
//         price: 59.99),
//     Product(
//         name: "Backpack",
//         description: "High-quality",
//         numberStar: 4,
//         price: 69.99),
//     Product(
//         name: "Boots",
//         description: "Super Luxury",
//         numberStar: 4,
//         price: 69.99),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     "Products",
//                     style: TextStyle(
//                       color: Colors.deepOrangeAccent,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       fontFamily: 'Arial',
//                     ),
//                   ),
//                   _numberShoppingCart(context, products.length)
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Expanded(
//                   child: ListView.builder(
//                       itemCount: products.length,
//                       itemBuilder: (context, index) {
//                         return _cardProduct(context, products[index]);
//                       })),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _cardProduct(BuildContext context, Product products) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Card(
//           borderOnForeground: true,
//           color: Colors.white,
//           shadowColor: Colors.grey,
//           elevation: 5,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Image.network(
//                   'https://file.hstatic.net/1000335192/collection/tshirt_919c31c27f4643d5a4e7228614c56ef8.png',
//                   width: 60,
//                   height: 60,
//                   fit: BoxFit.cover),
//               Padding(
//                 padding: const EdgeInsets.only(left: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       products.getName,
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       products.getDescription,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     //number of Star
//                     Row(
//                       children: List.generate(
//                         products.getNumberStar,
//                         (index) => const Icon(Icons.star,
//                             color: Colors.yellow, size: 16),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       "\$${products.getPrice.toStringAsFixed(2)}",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 60, top: 10),
//                     child: Icon(
//                       Icons.thumb_up_rounded,
//                       size: 20,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30),
//                     child: TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         "Add to Cart",
//                         style: TextStyle(
//                           color: Colors.deepOrange,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           )),
//     );
//   }
// }

// Widget _numberShoppingCart(BuildContext context, int number) {
//   return Stack(
//     children: [
//       Icon(Icons.shopping_cart, size: 30, color: Colors.lightGreenAccent),
//       Positioned(
//         bottom: 16,
//         left: 20,
//         child: Text(
//           number.toString(),
//           style: TextStyle(
//             color: Colors.pinkAccent,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ],
//   );
// }

// // class
// class Product {
//   String _name;
//   String _description;
//   int _numberStar;
//   double _price;

//   Product(
//       {required String name,
//       required String description,
//       required int numberStar,
//       required double price})
//       : _name = name,
//         _description = description,
//         _numberStar = numberStar,
//         _price = price;

//   // getter
//   String get getName => _name;
//   String get getDescription => _description;
//   int get getNumberStar => _numberStar;
//   double get getPrice => _price;

//   // setter
//   set setName(String name) => _name = name;
//   set setDescription(String description) => _description = description;
//   set setNumberStar(int numberStar) => _numberStar = numberStar;
//   set setPrice(double price) => _price = price;
// }

// // method
// class ActiveBox extends StatefulWidget {
//   const ActiveBox({super.key});

//   @override
//   _ActiveBoxState createState() => _ActiveBoxState();
// }

// class _ActiveBoxState extends State<ActiveBox> {
//   bool isActive = true;

//   void toggleState() {
//     setState(() {
//       isActive = !isActive;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//             child: Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                     color: isActive ? Colors.green : Colors.red,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: TextButton(
//                   onPressed: toggleState,
//                   child: isActive
//                       ? Text(
//                           "Active",
//                           style: TextStyle(color: Colors.white),
//                         )
//                       : Text(
//                           "Inactive",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                 ))),
//       ),
//     );
//   }
// }

// class GetData extends StatefulWidget {
//   const GetData({super.key});

//   @override
//   State<GetData> createState() => _GetDataState();
// }

// class _GetDataState extends State<GetData> {
//   final _fullnameController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _genderController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String fullname = "";
//   int age = 0;
//   bool gender = true;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextInput(
//                     hintText: "FullName",
//                     type: "text",
//                     controller: _fullnameController,
//                   ),
//                   TextInput(
//                     hintText: "Age",
//                     type: "number",
//                     controller: _ageController,
//                   ),
//                   TextInput(
//                       hintText: "Gender",
//                       type: "text",
//                       controller: _genderController),
//                   buttonSignup("Save Local", () async {
//                     SharedPreferences prefs =
//                         await SharedPreferences.getInstance();
//                     prefs.setString("fullname", _fullnameController.text);
//                     prefs.setInt("age", int.parse(_ageController.text));
//                     prefs.setBool(
//                         "gender",
//                         _genderController.text.toLowerCase() == 'male'
//                             ? true
//                             : false);
//                     setState(() {
//                       _fullnameController.clear();
//                       _ageController.clear();
//                       _genderController.clear();
//                     });
//                   }),
//                   SizedBox(height: 10),
//                   buttonSignup("Get Data", () async {
//                     final SharedPreferences prefs =
//                         await SharedPreferences.getInstance();

//                     setState(() {
//                       fullname = prefs.getString("fullname") ?? "";
//                       age = prefs.getInt("age") ?? 0;
//                       gender = prefs.getBool("gender") ?? true;
//                       _fullnameController.text = fullname;
//                       _ageController.text = age.toString();
//                       _genderController.text = gender ? "Male" : "Female";
//                     });
//                   }),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
