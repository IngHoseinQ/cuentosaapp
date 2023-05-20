import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class database_st {

  Future<Database> v() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'str.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE storys(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,story TEXT,img TEXT,state INTEGER DEFAULT 1, categoryId INTEGER DEFAULT 1)");
        await db.execute(
            "CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,img TEXT)");
        // Insert some initial data

        await insertdata(db);

        // Add more initial data as needed
      },
      version: 1,
    );
    return database;
  }

  Future<void> insertdata(Database db) async {
    await db.insert(
      'category',
      {
        'name': 'رومانسي',
        'img': 'asst/romance.jpg',
      },
    );
    await db.insert(
      'category',
      {
        'name': 'مغامرة',
        'img': 'asst/adventure.jpg',
      },
    );
    await db.insert(
      'category',
      {
        'name': 'اطفال',
        'img': 'asst/kids.jpg',
      },
    );
    await db.insert(
      'category',
      {
        'name': 'كوميديا',
        'img': 'asst/comedy.jpg',
      },
    );
    await db.insert(
      'category',
      {
        'name': 'رعب',
        'img': 'asst/horror.jpg',
      },
    );
    await db.insert(
      'category',
      {
        'name': 'خيال علمي',
        'img': 'asst/scifi.jpg',
      },
    );
    await db.insert(
      'category',
      {
        'name': 'غير مصنف',
        'img': 'asst/img.png',
      },
    );
    await db.insert(
      'storys',
      {
        'title': 'الرجل العجوز في القرية',
        'story':
        'يُحكى أنّ رجلا عجوزًا كان يعيش في قرية بعيدة، وكان أتعس شخص على وجه الأرض، حتى أنّ كلّ سكان القرية سئموا منه، لأنه كان محبطًا على الدوام، ولا يتوقّف عن التذمر والشكوى، ولم يكن يمرّ يوم دون أن تراه في مزاج سي. وكلّما تقدّم به السنّ، ازداد كلامه سوءًا وسلبية… كان سكّان القرية ينجنّبونه قدر الإمكان، فسوء حظّه أصبح مُعديًا. ويستحيل أن يحافظ أيّ شخص على سعادته بالقرب منه. لقد كان ينشر مشاعر الحزن والتعاسة لكلّ من حوله. لكن، وفي أحد الأيام وحينما بلغ العجوز من العمر ثمانين عامًا، حدث شيء غريب، وبدأت إشاعة عجيبة في الانتشار: - الرجل العجوز سعيد اليوم، إنه لا يتذمّر من شيء، والابتسامة ترتسم على محيّاه، بل إن ملامح وجهه قد أشرقت وتغيّرت! تجمّع القرويون عند منزل العجوز، وبادره أحدهم بالسؤال: -ما الذي حدث لك؟ وهنا أجاب العجوز: - لا شيء مهمًّا...لقد قضيتُ من عمري 80 عامًا أطارد السعادة بلا طائل. ثمّ قرّرت بعدها أن أعيش من دونها، وأن أستمتع بحياتي وحسب، لهذا السبب أنا سعيد الآن',
        'img': 'asst/old-man.jpg',
        'state': 1,
        'categoryId': 3,
      },
    );

    await db.insert(
      'storys',
      {
        'title': 'الرجل الحكيم',
        'story':
        'يحكى أنّه كان هناك رجل حكيم يأتي إليه الناس من كلّ مكان لاستشارته. لكنهم كانوا في كلّ مرّة يحدّثونه عن نفس المشاكل والمصاعب التي تواجههم، حتى سئم منهم. وفي يوم من الأيام، جمعهم الرجل الحكيم وقصّ عليهم نكتة طريفة، فانفجر الجميع ضاحكين. بعد بضع دقائق، قصّ عليهم النكتة ذاتها مرّة أخرى، فابتسم عدد قليل منهم. ثمّ ما لبث أن قصّ الطرفة مرّة ثالثة، فلم يضحك أحد. عندها ابتسم الحكيم وقال: -لا يمكنكم أن تضحكوا على النكتة نفسها أكثر من مرّة، فلماذا تستمرون بالتذمر والبكاء على نفس المشاكل في كلّ مرة؟!',
        'img': 'asst/wise-man.jpg',
        'state': 1,
        'categoryId': 3,
      },
    );

    await db.insert(
      'storys',
      {
        'title': 'الصديق الحقيقي',
        'story':
        'تدور القصّة حول صديقين كانا يسيران في وسط الصحراء. وفي مرحلة ما من رحلتهما تشاجرا شجارًا كبيرًا، فصفع أحدهما الآخر على وجهه. شعر ذلك الذي تعرّض للضرب بالألم والحزن الشديدين، لكن ومن دون أن يقول كلمة واحدة، كتب على الرمال: - اليوم صديقي المقرّب صفعني على وجهي. استمرّا بعدها في المسير إلى أن وصلا إلى واحة جميلة، فقرّرا الاستحمام في بحيرة الواحة، لكنّ الشاب الذي تعرّض للصفع سابقًا علق في مستنقع للوحل وبدأ بالغرق. فسارع إليه صديقه وأنقذه. في حينها كتب الشاب الذي كاد يغرق على صخرة كبيرة، الجملة التالية: - اليوم صديقي المقرّب أنقذ حياتي. وهنا سأله الصديق الذي صفعه وأنقذه: - بعد أن آذيتك، كتبت على الرمال، والآن أنت تكتب على الصخر، فلماذا ذلك؟ أجاب الشاب: - حينما يؤذينا أحدهم علينا أن نكتب إساءته على الرمال حتى تمسحها رياح النسيان. لكن عندما يقدّم لنا أحدهم معروفًا لابدّ أن نحفره على الصخر كي لا ننساه أبدًا ولا تمحوه ريح إطلاقًا',
        'img': 'asst/friendship.jpg',
        'state': 1,
        'categoryId': 3,
      },
    );
  }

  Future<void> insertStors(Stors stors) async {
    final Database db = await v();
    await db.insert(
      'storys',
      stors.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertCategory(Category category) async {
    final Database db = await v();
    await db.insert(
      'category',
      category.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateCategory(Category category) async {
    final Database db = await v();
    await db.update(
      'category',
      category.toMap(),
      where: "id = ?",
      whereArgs: [category.id],
    );
  }

  Future<void> deleteCategory(int id) async {
    final Database db = await v();
    await db.delete(
      'category',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateStors(Stors stors) async {
    final Database db = await v();
    await db.update(
      'storys',
      stors.toMap(),
      where: "id = ?",
      whereArgs: [stors.id],
    );
  }

  Future<void> deleteStors(int id) async {
    final Database db = await v();
    await db.delete(
      'storys',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> updateState(Stors story) async {
    final db = await v();
    await db.update(
      'storys',
      {
        'state': story.state, // update the state value with the new value
      },
      where: 'id = ?',
      whereArgs: [story.id],
    );
  }



  Future<List<Category>> cateview() async {
    final Database db = await v();
    final List<Map<String, dynamic>> maps =
    await db.query('category');
    return List.generate(maps.length, (i) {
      return Category(
        id: maps[i]['id'],
        name: maps[i]['name'],
        img: maps[i]['img'],
      );
    });
  }

  Future<List<Stors>> storview() async {
    final Database db = await v();
    final List<Map<String, dynamic>> maps = await db.query('storys');
    return List.generate(maps.length, (i) {
      return Stors(
        id: maps[i]['id'],
        title: maps[i]['title'],
        story: maps[i]['story'],
        img: maps[i]['img'],
        state: maps[i]['state'],
        categoryId: maps[i]['categoryId'],
      );
    });
  }

  Future<List<Stors>> getStoriesByCategory(int categoryId) async {
    final Database db = await v();
    final List<Map<String, dynamic>> maps = await db.query(
      'storys',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return List.generate(maps.length, (i) {
      return Stors(
        id: maps[i]['id'],
        title: maps[i]['title'],
        story: maps[i]['story'],
        img: maps[i]['img'],
        state: maps[i]['state'],
        categoryId: maps[i]['categoryId'],
      );
    });
  }
  Future<List<Stors>> searchStories(String query) async {
    final Database db = await v();
    final List<Map<String, dynamic>> maps = await db.query(
      'storys',
      where: "title LIKE ?",
      whereArgs: ['%$query%'],
    );
    return List.generate(maps.length, (i) {
      return Stors(
        id: maps[i]['id'],
        title: maps[i]['title'],
        story: maps[i]['story'],
        img: maps[i]['img'],
        state: maps[i]['state'],
        categoryId: maps[i]['categoryId'],
      );
    });
  }
  Future<String> getCategoryName(int storyId) async {
    final Database db = await v();
    List<Map> maps = await db.query(
      'storys',
      where: 'id = ?',
      whereArgs: [storyId],
    );
    int categoryId = maps[0]['categoryId'];
    List<Map> categoryMaps = await db.query(
      'category',
      where: 'id = ?',
      whereArgs: [categoryId],
    );
    return categoryMaps[0]['name'];
  }
}
class Category {
  final int id;
  final String name;
  final String img;

  Category({
    required this.id,
    required this.name,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'img': img};
  }

  @override
  String toString() {
    return 'category{id: $id, name: $name, img: $img}';
  }
}
class Stors {
   int? id;
  final String title;
  final String story;
  final String img;
  int state = 0;
  int categoryId;

  Stors({
    this.id,
    required this.title,
    required this.story,
    required this.img,
    required this.state,
    required this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'story': story,
      'img': img,
      'state': state,
      'categoryId': categoryId,
    };
  }



  @override
  String toString() {
    return 'storys{id: $id, title: $title, story: $story, img: $img, state: $state, categoryId: $categoryId}';
  }
}
