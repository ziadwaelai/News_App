import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newes/cubit/cubit.dart';

Future getData({country = 'us', category = 'business'}) async {
  Response response = await get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=17cdfa397b194cef92eb5da4d866de5b"));
  var data = jsonDecode(response.body);
  return await (data);
}

Future getdataserch({key = 'a'}) async {
  Response response = await get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?q=$key&apiKey=17cdfa397b194cef92eb5da4d866de5b"));
  var data = jsonDecode(response.body);
  return await (data);
}
