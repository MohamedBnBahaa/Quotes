import 'package:flutter/material.dart';
import 'package:quotes/widgets/quotes.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    Key? key,
    required this.deleteQuote,
    required this.item,
  }) : super(key: key);

  final Function deleteQuote;
  final Quotes item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: FractionallySizedBox(
        widthFactor: 0.92,
        child: Column(
          children: [
            Card(
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),),
              margin: const EdgeInsets.only(top: 20.0,),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.quoteTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                      ),
                    ),
                    const SizedBox(height: 12.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.author,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),
                        ),
                        IconButton(
                          onPressed:(){
                            deleteQuote(item);
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}