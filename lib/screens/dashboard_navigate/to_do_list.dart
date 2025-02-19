import 'package:flutter/material.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  // Task lists with check states
  List<bool> selfCareTasks = [false, false, false];
  List<bool> importantTasks = [false, false, false];
  List<bool> personalTasks = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Today's Tasks",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Set equal top and bottom padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTaskCategory("Self-Care Tasks", selfCareTasks, [
                "Meditation for 5 minutes",
                "Go for a short walk",
                "Drink enough water",
              ], ["7:00 AM", "7:30 AM", "8:00 AM"]),
              SizedBox(height: 15),
              _buildTaskCategory("Important Tasks", importantTasks, [
                "Respond to emails/messages",
                "Attend meeting",
                "Submit the Assignment",
              ], ["7:20 AM", "9:00 AM", "10:00 AM"]),
              SizedBox(height: 15),
              _buildTaskCategory("Personal Tasks", personalTasks, [
                "Call to mom",
                "Go to the shop",
                "Bath",
              ], ["1:00 PM", "7:00 PM", "8:00 AM"]),
              SizedBox(height: 20), // Bottom spacing for even padding
            ],
          ),
        ),
      ),
    );
  }

  // Task Category Widget
  Widget _buildTaskCategory(String title, List<bool> taskStates,
      List<String> taskNames, List<String> times) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.add_circle, color: Colors.purple[400]),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: List.generate(taskNames.length, (index) {
              return _buildTaskItem(taskNames[index], times[index],
                  taskStates[index], (value) {
                setState(() {
                  taskStates[index] = value!;
                });
              });
            }),
          ),
        ],
      ),
    );
  }

  // Task Item Widget
  Widget _buildTaskItem(
      String taskName, String time, bool isChecked, Function(bool?) onChanged) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: Colors.purple[400],
        ),
        Expanded(
          child: Text(
            taskName,
            style: TextStyle(
              fontSize: 16,
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.purple[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            time,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
