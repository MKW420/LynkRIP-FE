import 'dart:async';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
class GenerativeModelAI {

  final model = GenerativeModel(
    model: 'gemini-pro', 
    apiKey: const String.fromEnvironment('api-key'));
  

  Future<String> generateHubTopicFromUrl(String url)async {
    final prompt = 'Anaylze this URL and suggest one general topic title not more than 1 word that summarize its content: $url';
    final response = await model.generateContent([Content.text(prompt)]);

    return response.text ?? "No response";
  }

   Future<String> generateTags(String url)async {
    final prompt = 'Anaylze this URL and suggest only 3 related tags with 1 word each that describe a category the url falls into: $url';
    final response = await model.generateContent([Content.text(prompt)]);

    return response.text ?? "No Tags";

  }
  Future<String> anaylzeSource(String url)async {
    final prompt = 'Anaylze this URL and give the social media name it comes from only: $url';
    final response = await model.generateContent([Content.text(prompt)]);

    return response.text ?? "No Tags";
  }

 
 
}
