import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final maxContentWidth = 1200.0;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.changeTheme();
                          },
                          child: Icon(Icons.dark_mode, size: 36),
                        )
                      ],
                    ),
                    const SizedBox(height: 80),

                    /// === Header Section ===
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double screenWidth = constraints.maxWidth;
                        bool isWide = screenWidth > 900;

                        return Wrap(
                          spacing: 32,
                          runSpacing: 24,
                          children: [
                            SizedBox(
                              width:
                                  isWide ? (screenWidth - 32) / 2 : screenWidth,
                              child: _buildTextCard(context),
                            ),
                            SizedBox(
                              width:
                                  isWide ? (screenWidth - 32) / 2 : screenWidth,
                              child: _buildImageCard(),
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 80),

                    /// === Skills Section ===
                    Row(
                      children: const [
                        Icon(Icons.psychology, size: 24),
                        SizedBox(width: 16),
                        Text(
                          "Skills",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount;

                      if (constraints.maxWidth >= 900) {
                        crossAxisCount = 3;
                      } else if (constraints.maxWidth <= 600) {
                        crossAxisCount = 2;
                      } else {
                        crossAxisCount = 1;
                      }

                      return GridView.count(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: controller.skills.map((skill) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Icon(skill['icon'] as IconData, size: 24),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      skill['name'] as String,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                  const SizedBox(height: 80),

                    /// === Experience Section ===
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Determine the number of columns based on screen width
                      bool isWideScreen = constraints.maxWidth > 900;
                      bool isNarrowScreen = constraints.maxWidth < 600;

                      return Column(
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.work, size: 24),
                              SizedBox(width: 16),
                              Text(
                                "Experience",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          isNarrowScreen
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // First experience (Frontend Web Developer)
                              const Text("💼 Frontend Web Developer (Volunteer) KiloIT"),
                              const Text("July 2024-January 2025"),
                              const SizedBox(height: 24),
                              bulletItem(
                                "Collaborated with a development team to build and improve user interfaces using modern frontend technologies.",
                              ),
                              bulletItem(
                                "Took ownership of tasks assigned by the team lead and ensured timely and high-quality delivery.",
                              ),
                              bulletItem(
                                "Utilized version control systems (Git) to manage code, regularly pushing completed work to the repository.",
                              ),
                              const SizedBox(height: 24),
                              // Second experience (Academic Project)
                              const Text("🎓 Academic Project"),
                              const Text("2024-2025 (SETEC INSTITUTE)"),
                              const SizedBox(height: 24),
                              bulletItem(
                                "Collaborated with a team to develop a full-stack web application using PHP and Laravel.",
                              ),
                              bulletItem(
                                "Participated in the complete development cycle: planning, coding, testing, and deployment.",
                              ),
                              bulletItem(
                                "Successfully deployed the project using Vercel for hosting and gained experience in real-world deployment practices.",
                              ),
                            ],
                          )
                              : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("💼 Frontend Web Developer (Volunteer) KiloIT"),
                                    const Text("July 2024-January 2025"),
                                    const SizedBox(height: 24),
                                    bulletItem(
                                      "Collaborated with a development team to build and improve user interfaces using modern frontend technologies.",
                                    ),
                                    bulletItem(
                                      "Took ownership of tasks assigned by the team lead and ensured timely and high-quality delivery.",
                                    ),
                                    bulletItem(
                                      "Utilized version control systems (Git) to manage code, regularly pushing completed work to the repository.",
                                    ),
                                  ],
                                ),
                              ),
                              if (isWideScreen) const SizedBox(width: 48),
                              if (isWideScreen)
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("🎓 Academic Project"),
                                      const Text("2024-2025 (SETEC INSTITUTE)"),
                                      const SizedBox(height: 24),
                                      bulletItem(
                                        "Collaborated with a team to develop a full-stack web application using PHP and Laravel.",
                                      ),
                                      bulletItem(
                                        "Participated in the complete development cycle: planning, coding, testing, and deployment.",
                                      ),
                                      bulletItem(
                                        "Successfully deployed the project using Vercel for hosting and gained experience in real-world deployment practices.",
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 80),
                        ],
                      );
                    },
                  ),

                    /// === Projects Section ===
                    Row(
                      children: const [
                        Icon(Icons.work, size: 24),
                        SizedBox(width: 16),
                        Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount;

                      if (constraints.maxWidth >= 1200) {
                        crossAxisCount = 3;
                      } else if (constraints.maxWidth >= 600) {
                        crossAxisCount = 3;
                      } else {
                        crossAxisCount = 1;
                      }

                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: controller.projects.length,
                        itemBuilder: (context, index) {
                          final project = controller.projects[index];
                          return Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Image.asset(
                                      project['image'] as String,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    project['name'] as String,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    project['info'] as String,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            launchUrl(
                                              project['demo'] as Uri,
                                              mode: LaunchMode.externalApplication,
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black,
                                          ),
                                          child: const Text(
                                            "Demo",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 80),

                    /// === Contact Section ===
                LayoutBuilder(
                  builder: (context, constraints) {

                    bool isWideScreen = constraints.maxWidth > 900;
                    bool isNarrowScreen = constraints.maxWidth < 600;

                    return Column(
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.contact_mail, size: 24),
                            SizedBox(width: 16),
                            Text(
                              "Contact",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        isNarrowScreen
                            ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "If you're interested to maximize your and your team's efficiency, send us a message to get started.",
                            ),
                            const SizedBox(height: 24),
                            const Card(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Text("Email: panhaacc933@gmail.com"),
                              ),
                            ),
                            const Card(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Text("Tel: 0964614754"),
                              ),
                            ),
                            const Card(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  "Address: Tek Tla, Sen Sok, Phnom Penh, Cambodia",
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                launchUrl(
                                  Uri.parse('https://t.me/Mariooo_D'),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                "Telegram",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                            : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "If you're interested to maximize your and your team's efficiency, send us a message to get started.",
                                  ),
                                ],
                              ),
                            ),
                            if (isWideScreen)
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text("Email: panhaacc933@gmail.com"),
                                      ),
                                    ),
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text("Tel: 0964614754"),
                                      ),
                                    ),
                                    const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          "Address: Tek Tla, Sen Sok, Phnom Penh, Cambodia",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        launchUrl(
                                          Uri.parse('https://t.me/Mariooo_D'),
                                          mode: LaunchMode.externalApplication,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                      ),
                                      child: const Text(
                                        "Telegram",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 46),
                      ],
                    );
                  },
                )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget bulletItem(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("• ", style: TextStyle(fontSize: 20)), // Bullet symbol
      Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
    ],
  );
}

Widget _buildTextCard(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Portfolio',
        style: Theme.of(
          context,
        ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
        "Hello, I'm SUN Panha.",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      const SizedBox(height: 16),
      Text(
        "I am a Year 4 university student with a strong interest in mobile app development using Flutter. Although I don’t have much work experience yet, I am eager to learn and ready to work hard. I am looking for an internship to improve my skills, gain hands-on experience, and grow as a future Flutter developer.",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      const SizedBox(height: 36),
      ElevatedButton(
        onPressed: () {
          launchUrl(
            Uri.parse('https://t.me/Mariooo_D'),
            mode: LaunchMode.externalApplication,
          );
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: const Text("Contact me!", style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}

Widget _buildImageCard() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.asset(
      "assets/images/imagePortfolio.png",
      height: 250,
      fit: BoxFit.contain,
    ),
  );
}
