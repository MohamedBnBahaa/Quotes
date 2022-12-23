import 'package:flutter/material.dart';

class AddQuote extends StatelessWidget {
  const AddQuote({
    Key? key,
    required this.titleController,
    required this.authorController,
    required this.addNewQuote,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController authorController;
  final Function addNewQuote;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context){
            return Container(
                padding: const EdgeInsets.all(16.0,),
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: "New Quote",
                      ),
                    ),
                    const SizedBox(height: 32.0,),
                    TextField(
                      controller: authorController,
                      maxLength: 22,
                      decoration: const InputDecoration(
                        hintText: "Author",
                      ),
                    ),
                    const SizedBox(height: 32.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: (){
                            addNewQuote();
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "ADD",
                            style: TextStyle(fontSize: 24.0, color: Colors.green),
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "BACK",
                            style: TextStyle(fontSize: 24.0, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            );
          },
          isScrollControlled: true,
        );
      },
      backgroundColor: Colors.redAccent,
      tooltip: 'Add Quote',
      child: const Icon(Icons.add, size: 26,),
    );
  }
}
