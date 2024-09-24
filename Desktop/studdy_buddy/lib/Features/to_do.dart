import 'package:flutter/material.dart';
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> _todos = [];

  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTodo = "";
        return AlertDialog(
          title: Text("Add a task"),
          content: TextField(
            onChanged: (value) {
              newTodo = value;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (newTodo.isNotEmpty) {
                    _todos.add(newTodo);
                  }
                  Navigator.pop(context);
                });
              },
              child: Text("Done",),
              
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
        
      ),
      
      body:
      
      
      
       ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                _todos[index],
                style: TextStyle(fontSize: 18),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _todos.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        backgroundColor: Color.fromARGB(255, 228, 227, 221),
        child: Icon(Icons.add),
  ),
);}}