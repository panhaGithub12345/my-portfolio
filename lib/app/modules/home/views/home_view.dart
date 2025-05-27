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
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){
                          controller.changeTheme();
                        }, child: Icon(Icons.dark_mode,size: 36))
                      ],
                    ),
                    const SizedBox(height: 80),
                    /// === Header Section ===
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Portfolio',
                                style: Theme.of(context).textTheme.headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Hello, I'm SUN Panha.",
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "I am a dedicated and enthusiastic student eager to start my professional journey in web development. "
                                "While I have limited formal work experience, my passion, creativity, and strong commitment to learning "
                                "make me a promising candidate for this position. I thrive on solving challenges, am highly motivated to grow, "
                                "and am excited to contribute innovative solutions in the field of web development.",
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
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black
                                ),
                                child: const Text("Contact me!",style: TextStyle(color: Colors.white),),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              "assets/images/imagePortfolio.png",
                              height: 250,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
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
                    GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children:
                          controller.skills.map((skill) {
                            return Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
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
                    ),
                    const SizedBox(height: 80),
              
                    /// === Experience Section ===
                    Row(
                      children: const [
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "💼 Frontend Web Developer (Volunteer) KiloIT",
                              ),
                              Text("July 2024-Janury 2025"),
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
                        SizedBox(width: 48),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("🎓 Academic Project"),
                              Text("2024-2025 (SETEC INSTITUTE)"),
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
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    project['image'] as String,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
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
                                        child: Text("Demo",style: TextStyle(color: Colors.white),),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 80),
              
                    /// === Contact Section ===
                    Row(
                      children: const [
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("If you're interested to maximize your and your team's efficiency, send us a message to get started."),
                          ],
                        )
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text("Email : panhaacc933@gmail.com"),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text("Tel : 0964614754"),
                              ),
                            ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text("Address : Tek Tla, Sen Sok, Phnom Penh, Cambodia"),
                              ),
                            ),
                            SizedBox(height: 16,),
                            ElevatedButton(
              
                                onPressed: (){
                                  launchUrl(
                                    Uri.parse('https://t.me/Mariooo_D'),
                                    mode: LaunchMode.externalApplication,
                                  );
              
                            },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black
                                ),
                                child: Text("Telegram",style: TextStyle(color: Colors.white),))
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(height: 46),
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
