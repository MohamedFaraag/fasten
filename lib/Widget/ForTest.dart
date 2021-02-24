//
// import 'package:flutter/material.dart';
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool isSelectionMode = false;
//   List<Map> staticData = MyData.data;
//   Map<int, bool> selectedFlag = {};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Item'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (builder, index) {
//           Map data = staticData[index];
//           selectedFlag[index] = selectedFlag[index] ?? false;
//           bool isSelected = selectedFlag[index];
//
//           return ListTile(
//             onLongPress: () => onLongPress(isSelected, index),
//             onTap: () => onTap(isSelected, index),
//             title: Text("${data['name']}"),
//             subtitle: Text("${data['email']}"),
//             leading: _buildSelectIcon(isSelected, data),
//           );
//         },
//         itemCount: staticData.length,
//       ),
//       floatingActionButton: _buildSelectAllButton(),
//     );
//   }
//
//   void onTap(bool isSelected, int index) {
//     if (isSelectionMode) {
//       setState(() {
//         selectedFlag[index] = !isSelected;
//         isSelectionMode = selectedFlag.containsValue(true);
//       });
//     } else {
//       // Open Detail Page
//     }
//   }
//
//   void onLongPress(bool isSelected, int index) {
//     setState(() {
//       selectedFlag[index] = !isSelected;
//       isSelectionMode = selectedFlag.containsValue(true);
//     });
//   }
//
//   Widget _buildSelectIcon(bool isSelected, Map data) {
//     if (isSelectionMode) {
//       return Icon(
//         isSelected ? Icons.check_box : Icons.check_box_outline_blank,
//         color: Theme.of(context).primaryColor,
//       );
//     } else {
//       return CircleAvatar(
//         child: Text('${data['id']}'),
//       );
//     }
//   }
//
//   Widget _buildSelectAllButton() {
//     bool isFalseAvailable = selectedFlag.containsValue(false);
//     if (isSelectionMode) {
//       return FloatingActionButton(
//         onPressed: _selectAll,
//         child: Icon(
//           isFalseAvailable ? Icons.done_all : Icons.remove_done,
//         ),
//       );
//     } else {
//       return null;
//     }
//   }
//
//   void _selectAll() {
//     bool isFalseAvailable = selectedFlag.containsValue(false);
//     // If false will be available then it will select all the checkbox
//     // If there will be no false then it will de-select all
//     selectedFlag.updateAll((key, value) => isFalseAvailable);
//     setState(() {
//       isSelectionMode = selectedFlag.containsValue(true);
//     });
//   }
// }
// // https://raw.githubusercontent.com/nstack-in/flutter-select-list-item/master/lib/data.dart
// class MyData {
//   static List<Map> data = [
//     {
//       "id": 1,
//       "name": "Marchelle",
//       "email": "mailward0@hibu.com",
//       "address": "57 Bowman Drive"
//     },
//     {
//       "id": 2,
//       "name": "Modesty",
//       "email": "mviveash1@sohu.com",
//       "address": "2171 Welch Avenue"
//     },
//     {
//       "id": 3,
//       "name": "Maure",
//       "email": "mdonaghy2@dell.com",
//       "address": "4623 Chinook Circle"
//     },
//     {
//       "id": 4,
//       "name": "Myrtie",
//       "email": "mkilfoyle3@yahoo.co.jp",
//       "address": "406 Kings Road"
//     },
//     {
//       "id": 5,
//       "name": "Winfred",
//       "email": "wvenn4@baidu.com",
//       "address": "2444 Pawling Lane"
//     }
//   ];
// }
//
