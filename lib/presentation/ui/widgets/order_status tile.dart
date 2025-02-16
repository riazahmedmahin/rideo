import 'package:app/presentation/ui/screens/continue%20a%20rider/order_details_screen.dart';
import 'package:app/presentation/ui/screens/continue%20a%20rider/order_verify.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Map<String, dynamic>> items = [
    {
      'title': 'Devid Jhon',
      'subtitle': 'Cash on delivery',
      'code': '#326754',
      'rating': "4.5"
    },
    {
      'title': 'Jhone Smith',
      'subtitle': 'Online payment',
      'code': '#236754',
      'rating': "4.2"
    },
    {
      'title': 'Robert Brown',
      'subtitle': '+8801317 686 695',
      'code': '#786545',
      'rating': "4.8"
    },
    {
      'title': 'Emily Davis',
      'subtitle': '+8801317 686 695',
      'code': '#234356',
      'rating': "4.0"
    },
    {
      'title': 'Michael Wilson',
      'subtitle': '+8801317 686 695',
      'code': '#786534',
      'rating': "4.6"
    },
    {
      'title': 'David Miller',
      'subtitle': '+8801317 686 695',
      'code': '#235467',
      'rating': "4.3"
    },
  ];

  bool showAllItems = false;

  @override
  Widget build(BuildContext context) {
    final itemCount = showAllItems ? items.length : 3;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (!showAllItems && index == itemCount - 1) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showAllItems = true;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      'More orders',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: AppColors.primaryColor,
                      indent: screenWidth * 0.29,
                      endIndent: screenWidth * 0.29,
                    ),
                  ],
                ),
              ),
            );
          }
          return buildListItem(index, screenWidth);
        },
      ),
    );
  }

  Widget buildListItem(int index, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First Row: Name & Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index]['title']!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text(
                          items[index]['rating']!,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 6), // Add spacing

                // Second Row: Payment Method (or Phone) & Order Code
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      items[index]['subtitle']!,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    Text(
                      items[index]['code']!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 42,
                width: screenWidth * 0.4,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor
                  ),
              
                  onPressed: () {
                    Get.to(OrderVerifyScreen());
                  },
                  child: Text(
                    'Accept',
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 42,
                width: screenWidth * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(RideDetailsScreen());
                  },
                  child: Text(
                    'Details',
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
