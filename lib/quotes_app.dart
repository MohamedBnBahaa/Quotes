import 'package:flutter/material.dart';
import 'package:quotes/widgets/add_quote.dart';
import 'package:quotes/widgets/quote_card.dart';
import 'package:quotes/widgets/quotes.dart';

class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key, required this.title,});

  final String title;

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}


class _QuotesAppState extends State<QuotesApp> {

  // Create controller to get the text inside the textFields
  final titleController = TextEditingController();
  final authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 36.0),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children:
            allQuotes.map((item) => QuoteCard(
              item: item,
              deleteQuote: deleteQuote,
            )).toList(),

        ),
      ),

      floatingActionButton: AddQuote(
        titleController: titleController,
        authorController: authorController,
        addNewQuote: addNewQuote,
      ),

    );
  }


  // To remove a quote when clicking on "delete" icon
  void deleteQuote(Quotes item){
    setState(() {
      allQuotes.remove(item);
    });
  }


  // To add a new quote when clicking on "ADD" in showModalBottomSheet
  void addNewQuote(){
    setState(() {
      allQuotes.add(
        Quotes(
          quoteTitle: titleController.text,
          author: authorController.text,
        ),
      );
    });
  }


}
