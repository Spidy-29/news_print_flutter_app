import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_print_app/constants/utils.dart';

void httpStatusCodeHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      {
        // 200 - OK. The request was executed successfully.
        onSuccess();
        break;
      }
    case 400:
      {
        // 400 - Bad Request. The request was unacceptable, often due to a missing or misconfigured parameter.
        showSnackBar(context, "Bad Request");
        break;
      }
    case 401:
      {
        // 401 - Unauthorized. Your API key was missing from the request, or wasn't correct.
        showSnackBar(context, jsonDecode(response.body)['msg']);
        break;
      }
    case 429:
      {
        // 429 - Too Many Requests. You made too many requests within a window of time and have been rate limited. Back off for a while.
        showSnackBar(context,jsonDecode(response.body)['msg']);
        break;
      }
    case 500:
      {
        // 500 - Server Error. Something went wrong on our side.
        showSnackBar(context, jsonDecode(response.body)['error']);
        break;
      }
    default:
      showSnackBar(context, response.body);
  }
}
