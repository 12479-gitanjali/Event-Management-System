import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Ranking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  buildRankingTile('1', 'Alex', '2300 Points', 'https://i.pravatar.cc/150?img=1'),
                  buildRankingTile('2', 'Tony', '2100 Points', 'https://i.pravatar.cc/150?img=2'),
                  buildRankingTile('3', 'Lily', '1600 Points', 'https://i.pravatar.cc/150?img=3'),
                ],
              ),
            ),
            // Full width container, edge to edge
            Container(
              width: double.infinity,
              height: 217,
              color: const Color(0x4028D2D1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const QRScannerScreen()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/scan_button.png',
                      width: 150,
                      height: 147,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Scan code',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB71D86),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRankingTile(String number, String name, String points, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
        ),
        child: ListTile(
          leading: Text(number, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          title: Row(
            children: [
              CircleAvatar(radius: 26, backgroundImage: NetworkImage(imageUrl)),
              const SizedBox(width: 16),
              Text(name),
            ],
          ),
          trailing: Text(points, style: const TextStyle(fontSize: 18, color: Colors.grey)),
        ),
      ),
    );
  }
}

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final TextEditingController codeController = TextEditingController();

  void _showManualEntryFullScreen() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Stack(
              children: [
                Container(
                  width: 342,
                  height: 590,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xB328D2D1), // 70% opacity background color
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/QR_code.png',
                                width: 180,
                                height: 180,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Enter Code",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Enter the 8 digit code manually",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 70,
                                child: Center(
                                  child: TextField(
                                    controller: codeController,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      hintText: "Event code",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF28D2D1),
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                onPressed: () {
                                  final enteredCode = codeController.text.trim();
                                  if (enteredCode.isEmpty) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text('Alert'),
                                        content: const Text('Please enter a code before submitting.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    );
                                    return;
                                  }
                                  Navigator.pop(context);
                                  Navigator.pop(context, enteredCode);
                                },
                                child: const Text("Submit"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Scan event code",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close, size: 28, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          'Scan Game Code',
          style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcodeCapture) {
              final String? code = barcodeCapture.barcodes.isNotEmpty
                  ? barcodeCapture.barcodes.first.rawValue
                  : null;
              if (code != null) {
                Navigator.pop(context, code);
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              color: Colors.black,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.lightbulb, color: Colors.white),
                      SizedBox(width: 8),
                      Text("TIP: Bright light works best", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(width: double.infinity, height: 1, color: Colors.white24),
                  const SizedBox(height: 16),
                  const Text(
                    'Have trouble scanning?',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: _showManualEntryFullScreen,
                    child: const Text("Add Code Manually"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}