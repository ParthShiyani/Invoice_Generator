import 'dart:io';
import 'package:flutter/material.dart';

class Globel {
  //company logo
  static File? image;
  //experience
  static String? invoicenumber;
  static String? invoicedate = "";
  static String? invoiceduedate = "";
  //Your Details
  static String? companyname = "";
  static String? address1 = "";
  static String? pincode = "";
  static String? city = "";
  static String? phone = "";
  //Client Details
  static String? clientname = "";
  static String? clientaddress1 = "";
  static String? clientpincode = "";
  static String? clientcity = "";
  static String? clientphone = "";
  //Items
  static var allitems = [];
  static var allqty = [];
  static var allrate = [];
  static var amount = [];
  static num subtotal = 0;
  static num gst = 0;
  static dynamic initalDropdownVal = null;
  static num gstrate = 0;
  static num total = 0;
}
