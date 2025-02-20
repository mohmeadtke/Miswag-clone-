import 'package:flutter/material.dart';
import 'package:miswag/core/Widget/app_bar_widget.dart';

class DeliveryPage extends StatelessWidget {
  final List<Map<String, String>> deliveryData = [
    {'duration': '2-4', 'cost': '8000', 'province': 'بغداد'},
    {'duration': '3-5', 'cost': '8000', 'province': 'البصرة'},
    {'duration': '2-4', 'cost': '8000', 'province': 'الأنبار'},
    {'duration': '2-4', 'cost': '8000', 'province': 'الديوانية'},
    {'duration': '3-6', 'cost': '8000', 'province': 'السليمانية'},
    {'duration': '2-4', 'cost': '8000', 'province': 'المثنى'},
    {'duration': '3-6', 'cost': '8000', 'province': 'النجف'},
    {'duration': '3-6', 'cost': '8000', 'province': 'بابل'},
    {'duration': '3-6', 'cost': '8000', 'province': 'أربيل'},
    {'duration': '3-5', 'cost': '8000', 'province': 'حلبجة'},
    {'duration': '3-5', 'cost': '8000', 'province': 'دهوك'},
    {'duration': '2-4', 'cost': '8000', 'province': 'ديالى'},
    {'duration': '3-6', 'cost': '8000', 'province': 'ذي قار'},
    {'duration': '2-4', 'cost': '8000', 'province': 'صلاح الدين'},
    {'duration': '3-6', 'cost': '8000', 'province': 'كربلاء'},
    {'duration': '3-5', 'cost': '8000', 'province': 'كركوك'},
    {'duration': '2-4', 'cost': '8000', 'province': 'ميسان'},
    {'duration': '3-7', 'cost': '8000', 'province': 'نينوى'},
    {'duration': '2-4', 'cost': '8000', 'province': 'واسط'},
  ];

  DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(pageNum: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "تفاصيل اسعار ومواعيد خدمه التوصيل",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      tableCell('مدة التوصيل', true),
                      tableCell('كلفة الشحن', true),
                      tableCell('المحافظة', true),
                    ],
                  ),
                  ...deliveryData.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, String> data = entry.value;
                    Color? rowColor =
                        index.isEven ? Colors.grey[300] : Colors.white;

                    return TableRow(
                      decoration: BoxDecoration(color: rowColor),
                      children: [
                        tableCell(data['duration']!),
                        tableCell(data['cost']!),
                        tableCell(data['province']!),
                      ],
                    );
                  }),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '•أسعار التوصيل مفروضة من قبل شركات الشحن ولا تقدم شركتنا خدمة التوصيل مباشرة.\n'
                '• أسعار الشحن قابلة للتغيير بدون إشعار مسبق.\n'
                '• أسعار الشحن للطبية بالكامل بغض النظر عن عدد القطع.\n'
                '• في حالة الأوزان العالية، يتم الاتصال بالزبون وإبلاغه بأي تكاليف إضافية قبل بدء عملية الشحن.\n'
                '• قد تحتسب تكاليف إضافية بسيطة في حالة الشحن للأقصية والنواحي.',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tableCell(String text, [bool isHeader = false]) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isHeader ? 16 : 14,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
