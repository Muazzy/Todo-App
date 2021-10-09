import 'package:sqflite/sqflite.dart';
import 'package:my_todo/models/tasks.dart';
import 'package:path/path.dart'; //used for using that join functionality, it kind of like joins two or more strings

class DBHelper {
  Database _database;
  //so that when ever the app starts it first cunstructs.
  DBHelper();

//this function will look if the database is null, then it will create a db.
  Future openDB() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), 'task.db'),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE task (id INTEGER NOT NULL PRIMARY KEY autoincrement, name TEXT, isDone BOOLEAN)');
      });
    }
  }

//to insert any task we have to first check if there are already tasks and the db is created or not.
//and for that we first call the openDB() to do the work for us.
  Future insertTask(Task task) async {
    await openDB();
    return await _database.insert('task', task.toMap());
  }

  Future<List<Task>> getTaskList() async {
    await openDB();
    //we first make a list of the following type in order to store the response
    //that query will generate.
    //actually this query will return us a list of maps but in order to make things work we have to convert it into a List of Task.
    final List<Map<String, dynamic>> maps = await _database.query('task');
    //and than after that we generate it into a simpler version (a list of type Task) of list by using the following function.
    //this List.generate method actually generates a list.
    return List.generate(
      maps.length,
      (i) {
        return Task(
            id: maps[i]['id'],
            name: maps[i]['name'],
            isDone: (maps[i]['isDone'] == 0 ? false : true));
      },
    );
  }

  Future<void> deleteTask(int id) async {
    await openDB();
    await _database.delete('task', where: "id= ?", whereArgs: [id]);
  }

  Future<int> updateTask(Task task) async {
    await openDB();
    return await _database
        .update('task', task.toMap(), where: "id = ?", whereArgs: [task.id]);
  }
}
