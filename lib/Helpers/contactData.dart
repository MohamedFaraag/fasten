// https://raw.githubusercontent.com/nstack-in/flutter-select-list-item/master/lib/data.dart
class ContactData {
  static List<Map> data = [
    {
      "id": 1,
      "name": "phone",
    },
    {
      "id": 2,
      "name": "chat",
    },
    {
      "id": 3,
      "name": "whatsup",
    }
  ];
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   List<Map> staticData = MyData.data;
//   Map<int, bool> selectedFlag = {};
//   bool isSelectionMode = false;
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
//           // For the first time selectedFlag[index] will be null
//           // so, for that time we will initialize with false
//           selectedFlag[index] = selectedFlag[index] ?? false;
//           bool isSelected = selectedFlag[index];
//
//           return ListTile(
//             onLongPress: () => onLongPress(isSelected, index),
//             onTap: () => onTap(isSelected, index),
//             title: Text("${data['name']}"),
//             subtitle: Text("${data['email']}"),
//             leading: _buildSelectIcon(isSelected, data),  // updated
//           );
//         },
//         itemCount: staticData.length,
//       ),
//     );
//   }
//
//   void onLongPress(bool isSelected, int index) {
//     setState(() {
//       selectedFlag[index] = !isSelected;
//       // If there will be any true in the selectionFlag then
//       // selection Mode will be true
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

// }
