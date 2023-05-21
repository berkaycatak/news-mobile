import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_mobile/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class RequestServices {
  Future<Response?> sendRequest({
    required String path,
    required Map payload,
    required bool isToken,
  }) async {
    try {
      //print("PAYLOADS : $payload");
      Response response;
      Map<String, String> my_header = {
        'Accept': "application/json",
      };
      Uri uri = Uri.parse(Constants.API_URL + path);

      http.MultipartRequest m_request;
      http.Request request;

      response = await http.post(uri, headers: my_header, body: payload);
      return response;
    } catch (error) {
      print(error);
      return null;
    }
  }

  dynamic returnResponse(http.Response response, context) {
    switch (response.statusCode) {
      case 200:
        if (jsonDecode(response.body)['status'] == 0) {
          return showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.black,
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Kapat",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
                title: Text(
                  jsonDecode(response.body)["message"],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          );
        } else {
          dynamic responseJson = jsonDecode(response.body);
          return responseJson;
        }
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        break;
      case 401:
        return null;
      case 403:
        break;
      case 500:
      case 302:
      case 422:
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Kapat",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
              title: Text(
                jsonDecode(response.body)["message"],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        );
        break;
      default:
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Kapat",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
              title: Text(
                jsonDecode(response.body)["message"],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          },
        );
        break;
    }
  }
}
