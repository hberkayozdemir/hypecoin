import 'package:flutter/material.dart';
import 'package:hypecoin/app/core/constants/assets.gen.dart';

import 'package:hypecoin/app/features/news/Widgets/ForYouContainer.dart';
import 'package:hypecoin/app/features/news/Widgets/TrendingContainer.dart';
import 'package:hypecoin/app/features/news/data/article.dart';
import 'package:hypecoin/localization/localization.dart';

class NewsBodyScreen extends StatefulWidget {
  @override
  _NewsBodyScreenState createState() => _NewsBodyScreenState();
}

class _NewsBodyScreenState extends State<NewsBodyScreen> {
  Widget buildForYouContainers() {
    List<Widget> forYouContainers = [];

    List<Article> forYou = [
      Article(
        category: 'Sports',
        title: 'CR7 unlikely to face Barcelona',
        description:
            'Juventus will take on Barcelona in Matchday 2 of their Champions League group next Wednesday, but they\'ll likely be without Cristiano Ronaldo for that match. The Portuguese forward tested positive for COVID-19 during the international break and has tested positive again.',
        time: '30min ago',
        author: 'Sky News',
      ),
      Article(
        category: 'Entertainment',
        title: 'JRE on Spotify',
        description:
            'Joe Rogan—America’s most popular podcaster—has officially debuted on Spotify. The longtime comedian and mixed martial arts announcer made “The Joe Rogan Experience” available to Spotify subscribers on Tuesday.',
        time: '2hr ago',
        author: 'Spotify',
      ),
      Article(
        category: 'Sports',
        title: 'Lionel Messi sets new record ',
        description:
            'Lionel Messi became the first player to score in 16 consecutive Champions League seasons as he guided 10-man Barcelona to a 5-1 victory over Hungarian side Ferencvaros in their Group G opener at the Camp Nou on Tuesday.',
        time: '3hr ago',
        author: 'Sky News',
      ),
      Article(
        category: 'politics',
        title: 'Biden anti-trans violence',
        description:
            'Democratic presidential nominee Joe Biden called the violence against transgender and gender-nonconforming people an “epidemic that needs national leadership” and accused the Trump administration of fueling “the flames of transphobia.”',
        time: '1hr ago',
        author: 'Sky News',
      ),
      Article(
        category: 'politics',
        title: 'Biden anti-trans violence',
        description:
        'Democratic presidential nominee Joe Biden called the violence against transgender and gender-nonconforming people an “epidemic that needs national leadership” and accused the Trump administration of fueling “the flames of transphobia.”',
        time: '1hr ago',
        author: 'Sky News',
      ),
      Article(
        category: 'politics',
        title: 'Biden anti-trans violence',
        description:
        'Democratic presidential nominee Joe Biden called the violence against transgender and gender-nonconforming people an “epidemic that needs national leadership” and accused the Trump administration of fueling “the flames of transphobia.”',
        time: '1hr ago',
        author: 'Sky News',
      ),
      Article(
        category: 'politics',
        title: 'Biden anti-trans violence',
        description:
        'Democratic presidential nominee Joe Biden called the violence against transgender and gender-nonconforming people an “epidemic that needs national leadership” and accused the Trump administration of fueling “the flames of transphobia.”',
        time: '1hr ago',
        author: 'Sky News',
      ),
    ];
    for (Article article in forYou) {
      forYouContainers.add(ForYouContainer(article: article));
    }

    return Column(
      children: forYouContainers,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode=Theme.of(context).brightness==Brightness.dark;

    final Article article = Article(
      image: Assets.images.banner3.path,
      category: 'politics',
      title: 'It has to stop',
      description:
          'Donald Trump has verbally attacked Michigan\'s governor Gretchen Whitmer, despite warnings about the effect his words can have.During a rally in the state, Mr Trump called on Ms Whitmer, a Democrat, to axe the remaining restrictions aimed at limiting the spread of the coronavirus.',
      time: '1hr ago',
      author: 'Sky News',
    );
    return ListView(
      padding: EdgeInsets.all(2),
      children: [



        DefaultTabController(
          length: 5,
          child: TabBar(
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.purple,
            unselectedLabelColor: isDarkMode? Colors.white:Colors.black,

            indicatorColor: Colors.purple,
            isScrollable: true,
            tabs: [
              Tab(text: 'Ethereum'),
              Tab(
                text: 'Bitcoin',
              ),
              Tab(
                text: 'Avalanche',
              ),
              Tab(
                text: 'Ripple',
              ),
              Tab(
                text: 'Shib',
              ),
            ],
          ),
        ),



        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            context.localization.for_you,
            style: TextStyle(
              color: isDarkMode? Colors.white:Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        buildForYouContainers(),
      ],
    );
  }
}
