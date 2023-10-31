import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> rewriteCaption(String caption) async {
  var url = Uri.parse('https://api.openai.com/v1/chat/completions');
  var response = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer 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',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": "Rewrite the following caption in a fun way : $caption"
          }
        ]
      }));
  print(response.body);
  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);
    return jsonResponse['choices'][0]['message']['content'];
  } else {
    throw Exception('Failed to load data');
  }
}
