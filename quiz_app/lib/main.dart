import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  List<Map> allQuestions = [
    {
      "question" : "Who is the founder of Microsoft?",
      "options" : ["Steve Jobs","Bill Gates","Elon Musk","Larry Page"],
      "correctAnswer" : 1
    },
    {
      "question" : "Who is the founder of Google?",
      "options" : ["Elon Musk","Mark Zuckerberg","Sunder Pichai","Larry Page"],
      "correctAnswer" : 3
    },
    {
      "question" : "Who is the founder of SpaceX?",
      "options" : ["Steve Jobs","Bill Gates","Elon Musk","Mark Zuckerberg"],
      "correctAnswer" : 2
    },
    {
      "question" : "Who is the founder of Meta?",
      "options" : ["Mark Zuckerberg","Elon Musk","Larry Page","Bill Gates"],
      "correctAnswer" : 0
    },
    {
      "question" : "Who is the founder of Apple?",
      "options" : ["Mark Zuckerberg","Bill Gates","Elon Musk","Steve Jobs"],
      "correctAnswer" : 3
    }
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int score = 0;
  bool isQuestionPage = true;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if(selectedAnswerIndex != -1) {
      if(answerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      }else if(selectedAnswerIndex == answerIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      }else {
        return const WidgetStatePropertyAll(null);
      }
    }else {
      return const WidgetStatePropertyAll(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return toggleScreen();
  }

  Scaffold toggleScreen() {
    if(isQuestionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("QuizApp",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Colors.orange,
          ),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),

              /// QUESTION NO
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Question : ${currentQuestionIndex+1}/${allQuestions.length}",
                    style: const TextStyle(
                      fontWeight:FontWeight.w700,
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),

              /// QUESTION
              SizedBox(
                child: Text(
                  "Q. ${allQuestions[currentQuestionIndex]["question"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.purple,
                  ),
                ),
              ),
              const SizedBox(
                height: 50
              ),

              /// OPTION 1
              SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(0),
                  ),
                  onPressed: () {
                    if(selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 0;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "A. ${allQuestions[currentQuestionIndex]["options"][0]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              /// OPTION 2
              SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(1),
                  ),
                  onPressed: () {
                    if(selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 1;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "B. ${allQuestions[currentQuestionIndex]["options"][1]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              /// OPTION 3
              SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(2),
                  ),
                  onPressed: () {
                    if(selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 2;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "C. ${allQuestions[currentQuestionIndex]["options"][2]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              /// OPTION 4
              SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(3),
                  ),
                  onPressed: () {
                    if(selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 3;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "D. ${allQuestions[currentQuestionIndex]["options"][3]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed:() {
            if(selectedAnswerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
              score++;
            }
            if(selectedAnswerIndex != -1) {
              if(currentQuestionIndex < allQuestions.length-1) {
                currentQuestionIndex++;
              }else {
                isQuestionPage = false;
              }
            }
            selectedAnswerIndex = -1;
            setState(() {});
          },
          child: const Icon(
            Icons.forward,
            color: Colors.orange,
          ),
        ),
      );
    }else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Result",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text("Congratulations!!",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                child: Image.network("https://m.media-amazon.com/images/I/81uHXYcZX6L.jpg"),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text("You have successfully completed the test",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Score : $score/${allQuestions.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                    "Retest",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
              ),
            ],
          ),
        ),
      );
    }
  }
}