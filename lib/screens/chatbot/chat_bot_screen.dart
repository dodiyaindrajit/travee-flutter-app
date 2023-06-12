import 'dart:developer';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

//import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';

import '../../resources/color.dart';

class ChatModel {
  String type; //question or answer
  String text;

  ChatModel({
    required this.type,
    required this.text,
  });
}

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  List<ChatModel> chatList = [];
  var textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// back arrow & title
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "Search your Query",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),

              /// chat container
              Expanded(
                child: Container(
                  width: Get.width,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    reverse: true,
                    shrinkWrap: true,
                    controller: ScrollController(keepScrollOffset: true),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      final reversedIndex = chatList.length - 1 - index;
                      final item = chatList[reversedIndex];
                      return Align(
                        alignment: item.type == "a" ? Alignment.centerLeft : Alignment.centerRight,
                        child: item.type == "q"
                            ? ChatBubble(
                                clipper: ChatBubbleClipper2(type: BubbleType.sendBubble),
                                alignment: Alignment.topRight,
                                margin: const EdgeInsets.only(top: 20),
                                backGroundColor: kPrimaryColor,
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                                  ),
                                  child: Text(
                                    item.text,
                                    style: const TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              )
                            : ChatBubble(
                                clipper: ChatBubbleClipper2(type: BubbleType.receiverBubble),
                                backGroundColor: const Color(0xffE7E7ED),
                                margin: const EdgeInsets.only(top: 20),
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                                  ),
                                  child: Text(
                                    item.text,
                                    style: const TextStyle(color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ),

              /// search bar
              Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: textController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        cursorColor: kPrimaryColor,
                        style: TextStyle(color: kBlackColor),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: kGreyColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: kGreyColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: kGreyColor),
                          ),
                          labelStyle: TextStyle(color: kGreyColor),
                          labelText: "Search places",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        ),
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          chatList.add(ChatModel(type: "q", text: textController.text));
                          chatGptModel(textController.text);
                          // getChats(textController.text);
                          //getAnswer(textController.text);
                        });
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(14)),
                          child: Icon(
                            Icons.search,
                            color: kWhiteColor,
                            size: 26,
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void chatGptModel(String question) async {
    String answer = "";
    String gptApiKey = "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";
    final openAI = OpenAI.instance
        .build(token: gptApiKey, baseOption: HttpSetup(receiveTimeout: const Duration(minutes: 30)), enableLog: true);

    final request = ChatCompleteText(messages: [
      Map.of({"role": "user", "content": question})
    ], maxToken: 200, model: GptTurboChatModel());

    final response = await openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      answer += element.message!.content;
      print("data -> ${element.message?.content}");
    }

    chatList.add(ChatModel(type: "a", text: answer));
    setState(() {});
  }

  Future<void> getChats(String question) async {
    String answer = "";
    String gptApiKey = "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";
    final openAI = OpenAI.instance
        .build(token: gptApiKey, baseOption: HttpSetup(receiveTimeout: const Duration(minutes: 30)), enableLog: true);

    final request = CompleteText(prompt: question, maxTokens: 200, model: TextDavinci3Model());
    openAI.onCompletionSSE(request: request).listen((it) {
      debugPrint("complete text model================>${it.choices.last.text}");
    });
  }

/* void getAnswer(String question) async {
    String answer = "";
    List<OpenAIModelModel> models = await OpenAI.instance.model.list();
    OpenAIModelModel firstModel = models.first;

    */ /*models.forEach((element) {
      print("model ----> ${element.id}");
    });
*/ /*
    OpenAICompletionModel completionModel = await OpenAI.instance.completion.create(
      //model: "text-davinci-003", // use ada model if this limit is over
      model: "gpt-3.5-turbo-0301",
      prompt: question,
      maxTokens: 100,
      temperature: 0.5,
      topP: 1,
    );

    completionModel.choices.forEach((element) {
      answer += element.text;
    });

    log("chat model :::::::::::::: $answer");
    chatList.add(ChatModel(type: "a", text: answer));
    setState(() {});

    // completionModel.listen((event) {
    //   final firstCompletionChoice = event.choices.first;
    //   answer += firstCompletionChoice.text;
    // });
  }*/
}
