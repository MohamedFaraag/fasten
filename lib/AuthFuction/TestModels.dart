// import 'package:flutter/material.dart';
//
// class HomeAge extends StatefulWidget {
//   @override
//   _HomeAgeState createState() => _HomeAgeState();
// }
//
// class _HomeAgeState extends State<HomeAge> {
//   List<ListItem<String>> list;
//   @override
//   void initState() {
//     super.initState();
//     populateData();
//   }
//
//   void populateData() {
//     list = [];
//     for (int i = 0; i < 10; i++) list.add(ListItem<String>("item $i"));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("List Selection"),
//       ),
//       body: ListView.builder(
//         itemCount: list.length,
//         itemBuilder: _getListItemTile,
//       ),
//     );
//   }
//
//   Widget _getListItemTile(BuildContext context, int index) {
//     return GestureDetector(
//       onTap: () {
//         if (list.any((item) => item.isSelected)) {
//           setState(() {
//             list[index].isSelected = !list[index].isSelected;
//           });
//         } else {
//           setState(() {
//             list[index].isSelected = true;
//           });
//         }
//       },
//       onLongPress: () {},
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 4),
//         color: list[index].isSelected ? Colors.red[100] : Colors.white,
//         child: ListTile(
//           title: Text(list[index].data),
//         ),
//       ),
//     );
//   }
// }
//
// class ListItem<T> {
//   bool isSelected = false; //Selection property to highlight or not
//   T data; //Data of the user
//   ListItem(this.data); //Constructor to assign the data
// }
