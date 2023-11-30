import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My app",
      home: Bookapp(),
    );

  }
}


class Bookapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan.shade300,
          title: Text("Books"),

        ),
        body: Column(
          children: [
            BookCard("Himu", "Humayun Ahmed", "7.5", "Himu.jpg","Himu,it is a popular fictional character created by Bangladeshi author Humayun Ahmed. The series revolves around Himu, a unique and philosophical young man who leads an unconventional lifestyle, embracing simplicity and exploring the complexities of life in an intriguing and thought-provoking manner."),
            BookCard("Misir Ali Shomogro", "Humayun Ahmed", "9", "misirali.jpg","The Misir Ali series, written by renowned Bangladeshi author Humayun Ahmed, delves into the enigmatic and analytical mind of the titular character, Misir Ali, a brilliant but eccentric psychologist. The books explore his encounters with the supernatural, psychology, and his personal reflections, creating a captivating blend of mystery and introspection."),
            BookCard("Ami Topu", "Md.Jafar Iqbal", "8.5", "amitopu.jpg","Ami Topu,a book by Muhammad Zafar Iqbal is a Bengali science fiction novel that revolves around the adventures of Topu, a young boy with extraordinary abilities, as he explores the mysteries of the universe and confronts various challenges. The story combines elements of science and fantasy to engage readers in a captivating journey of imagination and discovery."),
          ],
        )
    );
  }
}


class BookCard extends StatelessWidget {
  final String bookName;
  final String author;
  final String rating;
  final String pic;
  final String description;
  BookCard(this.bookName,this.author,this.rating,this.pic,this.description) {

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetails(bookName,author,rating,pic,description),
          ),
        );
      },
      child: (
          Container(
            height: 100,
            width: 400,
            child: Card(
              color: Colors.cyan.shade100,
              elevation: 12,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: 50,
                      child: (
                          Image.asset('assets/images/$pic')
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start ,
                        children: [
                          Text('Title:$bookName'),
                          Text('Author:$author'),
                          Text('Rating:$rating/10'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}


class BookDetails extends StatelessWidget {
  final String bookName;
  final String author;
  final String rating;
  final String pic;
  final String description;
  const BookDetails(this.bookName,this.author,this.rating,this.pic,this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade300,
        title: Text("Book Details"),
      ),
      body: Container(
        child: (
            Column(
              children: [
                Container(
                  child: Center(
                    child: Container(
                      height: 50,
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset("assets/images/$pic")
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Column(

                      children: [
                        Text('Title:$bookName',style: TextStyle(fontSize: 25),),
                        Text('Author:$author',style: TextStyle(fontSize: 20),),
                        Text('Rating:$rating/10',style: TextStyle(fontSize: 20),),
                        Text('Description:$description',style: TextStyle(fontSize: 10),)
                      ],
                    ),
                  ),
                ),
                Container(
                  child: DropdownButton(
                    hint: Text('Contents'),
                    items: [
                      DropdownMenuItem(
                        value: 1,
                        child: Text('Chapter 1'),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text('Chapter 2'),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Text('Chapter 3'),
                      )
                    ], onChanged: (int? value) {  },

                  ),
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text('Go Back'),

                  ),
                ),
              ],
            )
        ),
      ),

    );
  }
}
