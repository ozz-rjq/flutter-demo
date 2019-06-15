import 'package:dating_demo/shared/paragraph.dart';
import 'package:flutter/material.dart';

import './about_advantages.stateless.dart';
import './about_main.stateless.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('About')),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: <Widget>[
            AboutAdvantages(),
            AboutMain(),
            Paragraph(
              title: 'International Dating',
              description:
                  'DatingWalk provides a safe place where Singles meet Singles from local communities as well as from foreign places. If you prefer to search for your spouse abroad, as an international online dating services DatingWalk does not only offer local dating but also Russian dating, Ukraine dating, Filipina dating, Asian dating, Latino dating as well as US Dating and European Dating. But before dating with someone from abroad it is recommended to show your respect and admiration and learn more about another country and its culture. Whether you are looking for beautiful Russian lady or a woman from Ukraine, or if you wish to meet an Asian woman, a Filipina wife, a Latino lady or a spouse from any other foreign place, we recommend reading our articles about online dating and culture & traditions first.',
            ),
            Paragraph(
              title: 'Dating Ads, History, Facts and Figures',
              description:
                  'Online Dating Services have become very popular among all age groups. Today you can\'t think of dating and finding your spouse without thinking of online dating possibilities.According to BBC News, CNN TV or NBC the online dating population is growing larger every day. In 2002 it was already predicted, that in twenty years, the idea that someone is looking for love without looking for it online will be silly. According to BBC News, no less than two thirds of single people looking for love have signed up to dating agencies in 2006. (BBC News Online, Love on the Web, Thursday, 2 February 2006). The profession of the matchmaker goes back centuries and was widespread in East Europe. Dating ads date back to the invitation of Gutenberg’s print technique. With the release of News Papers, the first dating ads were published by East Europe Jews families arranging marriages with like-minded ones. In the 1930s, marriage agencies sprang up to send out English wives to colonials, starved of the company of their female compatriots in far flung outposts of the Empire. With the internet, dating ads have become more popular than ever before. If you are considering giving your luck a boost through an online dating site, you have made the right choice. Millions of other singles do the same!',
            ),
          ],
        ));
  }
}
