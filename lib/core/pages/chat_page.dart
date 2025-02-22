import 'package:flutter/material.dart';

class ChatHelpPage extends StatelessWidget {
  const ChatHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Image(image: AssetImage("assets/image/scl.jpg"))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "Hi there ",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  WidgetSpan(child: Text("👋", style: TextStyle(fontSize: 24))),
                ],
              ),
            ),
            const Text("How can we help?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            buildOptionTile("Messages", Icons.chat_bubble_outline, () {}),
            const SizedBox(height: 10),
            buildOptionTile("Send us a message", Icons.arrow_forward, () {}),
          ],
        ),
      ),
    );
  }

  Widget buildOptionTile(String title, IconData icon, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 4)],
      ),
      child: ListTile(
        title: Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing: Icon(icon, color: Colors.red),
        onTap: onTap,
      ),
    );
  }
}
