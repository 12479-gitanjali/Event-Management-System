import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';


void main() {
  runApp(const MaterialApp(home: Agenda(), debugShowCheckedModeBanner: false));
}

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  late List<String> dates;
  late String selectedDate;
  late DateTime _now;
  late Timer _timer;

  Set<String> remindersSet = {};

  final Map<String, List<Map<String, String>>> events = {};

  final Map<String, Color> streamColors = {
    'Filming': Colors.red,
    'Animation': Colors.orange,
    '3D': Colors.blue,
    'Game': Colors.green,
    'Information': Colors.purple,
  };

  @override
  void initState() {
    super.initState();

    _now = DateTime.now();

    // Generate next 7 days formatted
    dates = List.generate(7, (index) {
      final date = _now.add(Duration(days: index));
      return DateFormat('EEEE, MMMM dd').format(date);
    });

    selectedDate = dates[0];

   events[dates[0]] = [
      {
        'title': 'Sydney MasterTalk with Lukas Sarralde',
        'startTime': '1:00 PM',
        'endTime': '2:30 PM',
        'duration': '1.5 hr',
        'location': 'Sydney Campus',
        'room': 'Room 12',
        'speaker': 'Lukas Sarralde',
        'stream': '3D',
        'description': '''
<h3><strong>Motion Capture MasterTalk with Lukas Sarralde</strong></h3>
<p>From animating Lil’ Elvis and the Truckstoppers in the ’90s to starting his own creative studio and later turning a hugely successful, award-winning brand film around in just six weeks as a creative director at Monster & Bear, JC Reyes has done it all.</p>
<p>The night began with JC telling our audience of animation and game design students, filmmakers and producers, “I’m your peoples,” and the event certainly felt like a joyful reunion, with many AIT educators excited to catch up with an old colleague. The animation industry in Melbourne may be small in numbers, but it is mighty in spirit. </p>
<p>It’s clear that apart from his impressive personal achievements, JC has also had an important impact on the careers of many other creatives. From past interns to present colleagues, half the room seemed to have some connection to JC, and everyone was keen to share in more of his wisdom. </p>
<p>JC kicked off with a quote usually attributed to Albert Einstein – “Creativity is intelligence having fun.” And that’s a really good way to sum up JC Reyes’ explanation of the creative process. It’s clear that a lot of thought has gone into his creation of this framework, and for every new project, JC starts with his intellect – nutting out the problems and the parameters before committing fully to the bold, creative ideas that make the work fun.</p>

<p>One of the things JC really wanted our audience to take away from the talk was the importance of mastering – and then demonstrating – the foundational skills of their craft.</p>
<p>This is especially important for junior animators, and something that they should take care to present in their showreels. </p>
<p>“We don’t want to see perfect,” JC explained. “We want to see a good understanding of foundational skills. Animators – I want to see weight, I want to see – you know – anticipation before you move. I don’t want to see it perfectly moving – I want to see your thinking with your work.” </p>
<p>While there’s a lot to be said for presenting polished work, junior animators shouldn’t overlook the pieces that show their working, and display their understanding of the principles that underpin these finished works. This is something that will demonstrate to potential employers that a junior can become a valuable member of their team.  </p>

<h3><strong>The Importance of Knowing that a “No” Isn’t Personal</strong></h3>
<p>“The ‘no’ is not about you. If you get a ‘no’, it means you haven’t really understood the ask.”</p>
<p>Throughout your career as a creative professional, you are going to face rejection, and you are going to hear the word, “no”. No to the big idea, no to the creative direction you want to take. JC believes this is just part of the job, and that you have to look beyond the sense of rejection to figure out why the client, your boss, or your team have said no. </p>  
<p>“You’ll hear lots of nos, and don’t take it personally. I still work with this because I’m a very proud and passionate person.” “But most of the nos tend to be about me not understanding what they’re asking of me. Because I’ve always wanted to present my ideas, and they’re like.. ‘I just want to advertise socks’.” “It’s being discerning enough to go, ‘What have I not seen?’ What have I not heard from the brief?’ And then going back again.” And while it’s important to respect the client’s wishes, JC also pointed out that you shouldn’t give up when faced with these rejections of ideas or concepts. You can always adjust your approach and try again. </p>
        ''',
        'image':
            'https://ait.edu.au/_next/image?url=https%3A%2F%2Fait.yourcreative.com.au%2Fwp-content%2Fuploads%2F2024%2F04%2FAIT-Motion-Capture-MasterTalk-Sydney-Lukas-Sarralde-scaled.jpeg&w=3840&q=75',
        'speakerImage':
            'https://media.licdn.com/dms/image/v2/D5603AQGE_CLapiLjKg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1672874224289?e=1756339200&v=beta&t=_Jkk3al3VxHkbRhoxfOVuuRTP5zwQnIDjArD2q8KzNI',
        'speakerSocial': '@lukas_3d',
      },

      {
        'title': 'Melbourne MasterTalk with JC Reyes',
        'startTime': '10:00 AM',
        'endTime': '11:00 AM',
        'duration': '1 hr',
        'location': 'Melbourne Campus',
        'room': 'Room 102',
        'speaker': 'JC Reyes',
        'stream': 'Filming',
        'description': '''
<h3><strong>The Importance of a Creative Process with JC Reyes</strong></h3>
<p>From animating Lil’ Elvis and the Truckstoppers in the ’90s to starting his own creative studio and later turning a hugely successful, award-winning brand film around in just six weeks as a creative director at Monster & Bear, JC Reyes has done it all.</p>
<p>The night began with JC telling our audience of animation and game design students, filmmakers and producers, “I’m your peoples,” and the event certainly felt like a joyful reunion, with many AIT educators excited to catch up with an old colleague. The animation industry in Melbourne may be small in numbers, but it is mighty in spirit. </p>
<p>It’s clear that apart from his impressive personal achievements, JC has also had an important impact on the careers of many other creatives. From past interns to present colleagues, half the room seemed to have some connection to JC, and everyone was keen to share in more of his wisdom. </p>
<p>JC kicked off with a quote usually attributed to Albert Einstein – “Creativity is intelligence having fun.” And that’s a really good way to sum up JC Reyes’ explanation of the creative process. It’s clear that a lot of thought has gone into his creation of this framework, and for every new project, JC starts with his intellect – nutting out the problems and the parameters before committing fully to the bold, creative ideas that make the work fun.</p>

<h3><strong>Junior Creatives Need to Demonstrate Foundational Skills</strong></h3>
<p>One of the things JC really wanted our audience to take away from the talk was the importance of mastering – and then demonstrating – the foundational skills of their craft.</p>
<p>This is especially important for junior animators, and something that they should take care to present in their showreels. </p>
<p>“We don’t want to see perfect,” JC explained. “We want to see a good understanding of foundational skills. Animators – I want to see weight, I want to see – you know – anticipation before you move. I don’t want to see it perfectly moving – I want to see your thinking with your work.” </p>
<p>While there’s a lot to be said for presenting polished work, junior animators shouldn’t overlook the pieces that show their working, and display their understanding of the principles that underpin these finished works. This is something that will demonstrate to potential employers that a junior can become a valuable member of their team.  </p>

<h3><strong>The Importance of Knowing that a “No” Isn’t Personal</strong></h3>
<p>“The ‘no’ is not about you. If you get a ‘no’, it means you haven’t really understood the ask.”</p>
<p>Throughout your career as a creative professional, you are going to face rejection, and you are going to hear the word, “no”. No to the big idea, no to the creative direction you want to take. JC believes this is just part of the job, and that you have to look beyond the sense of rejection to figure out why the client, your boss, or your team have said no. </p>  
<p>“You’ll hear lots of nos, and don’t take it personally. I still work with this because I’m a very proud and passionate person.” “But most of the nos tend to be about me not understanding what they’re asking of me. Because I’ve always wanted to present my ideas, and they’re like.. ‘I just want to advertise socks’.” “It’s being discerning enough to go, ‘What have I not seen?’ What have I not heard from the brief?’ And then going back again.” And while it’s important to respect the client’s wishes, JC also pointed out that you shouldn’t give up when faced with these rejections of ideas or concepts. You can always adjust your approach and try again. </p>
        ''',
        'image':
            'https://ait.edu.au/_next/image?url=https%3A%2F%2Fait.yourcreative.com.au%2Fwp-content%2Fuploads%2F2025%2F04%2FJC_Reyes_Melb_MasterTalk_Mar_-2025_IMG_20250326_190914140_HDR-scaled.jpg&w=3840&q=75',
        'speakerImage':
            'https://media.licdn.com/dms/image/v2/D5603AQGddhXFFtDIbw/profile-displayphoto-scale_400_400/B56Zho.OLoHkAg-/0/1754107806053?e=1756944000&v=beta&t=iEQPDPJRjoao5VxMqdvgtUT77RIS-2Cyc56Ryxw3kNU',
        'speakerSocial': '@jc_reyes',
      },
    ];

    events[dates[1]] = [
      {
        'title': 'Sydney MasterTalk Panel: The Business of Creativity',
        'startTime': '9:30 AM',
        'endTime': '11:00 AM',
        'duration': '1.5 hr',
        'location': 'Sydney Campus',
        'room': 'Room 11',
        'speaker':
            'Marc Bouyer (BUCK), Ryan Penning (ScreenNSW), and Will Pietsch (freelance animator)',
        'stream': 'Animation',
        'description': '''
<h3><strong>Create with Purpose: What You Do Today Shapes Tomorrow’s Creative Industry</strong></h3>
<p>From animating Lil’ Elvis and the Truckstoppers in the ’90s to starting his own creative studio and later turning a hugely successful, award-winning brand film around in just six weeks as a creative director at Monster & Bear, JC Reyes has done it all.</p>
<p>The night began with JC telling our audience of animation and game design students, filmmakers and producers, “I’m your peoples,” and the event certainly felt like a joyful reunion, with many AIT educators excited to catch up with an old colleague. The animation industry in Melbourne may be small in numbers, but it is mighty in spirit. </p>
<p>It’s clear that apart from his impressive personal achievements, JC has also had an important impact on the careers of many other creatives. From past interns to present colleagues, half the room seemed to have some connection to JC, and everyone was keen to share in more of his wisdom. </p>
<p>JC kicked off with a quote usually attributed to Albert Einstein – “Creativity is intelligence having fun.” And that’s a really good way to sum up JC Reyes’ explanation of the creative process. It’s clear that a lot of thought has gone into his creation of this framework, and for every new project, JC starts with his intellect – nutting out the problems and the parameters before committing fully to the bold, creative ideas that make the work fun.</p>

<h3><strong>Embrace Lifelong Adaptability</strong></h3>
<p>One of the things JC really wanted our audience to take away from the talk was the importance of mastering – and then demonstrating – the foundational skills of their craft.</p>
<p>This is especially important for junior animators, and something that they should take care to present in their showreels. </p>
<p>“We don’t want to see perfect,” JC explained. “We want to see a good understanding of foundational skills. Animators – I want to see weight, I want to see – you know – anticipation before you move. I don’t want to see it perfectly moving – I want to see your thinking with your work.” </p>
<p>While there’s a lot to be said for presenting polished work, junior animators shouldn’t overlook the pieces that show their working, and display their understanding of the principles that underpin these finished works. This is something that will demonstrate to potential employers that a junior can become a valuable member of their team.  </p>

<h3><strong>Make Your Creative Voice Heard</strong></h3>
<p>“The ‘no’ is not about you. If you get a ‘no’, it means you haven’t really understood the ask.”</p>
<p>Throughout your career as a creative professional, you are going to face rejection, and you are going to hear the word, “no”. No to the big idea, no to the creative direction you want to take. JC believes this is just part of the job, and that you have to look beyond the sense of rejection to figure out why the client, your boss, or your team have said no. </p>  
<p>“You’ll hear lots of nos, and don’t take it personally. I still work with this because I’m a very proud and passionate person.” “But most of the nos tend to be about me not understanding what they’re asking of me. Because I’ve always wanted to present my ideas, and they’re like.. ‘I just want to advertise socks’.” “It’s being discerning enough to go, ‘What have I not seen?’ What have I not heard from the brief?’ And then going back again.” And while it’s important to respect the client’s wishes, JC also pointed out that you shouldn’t give up when faced with these rejections of ideas or concepts. You can always adjust your approach and try again. </p>
        ''',
        'image':
            'https://ait.edu.au/_next/image?url=https%3A%2F%2Fait.yourcreative.com.au%2Fwp-content%2Fuploads%2F2025%2F04%2FFeature_Sydney_March_2025_MasterTalk_Marc_Bouyer_Ryan_Penning_Will_Pietsch-scaled.jpg&w=3840&q=75',
        'speakerImage':
            'https://media.licdn.com/dms/image/v2/D5603AQGE_CLapiLjKg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1672874224289?e=1756339200&v=beta&t=_Jkk3al3VxHkbRhoxfOVuuRTP5zwQnIDjArD2q8KzNI',
        'speakerSocial': '@creative_panel',
      },
      {
        'title': 'Melbourne MasterTalk with Dean Musumeci',
        'startTime': '10:00 AM',
        'endTime': '11:00 AM',
        'duration':  '1 hr',
        'location': 'Melbourne Campus',
        'room': 'Room 102',
        'speaker': 'Dean Musumeci',
        'stream': 'Filming',
        'description': '''
<h3><strong>Melbourne MasterTalk: Dean Musumeci, Digital Compositor for The Amazing Digital Circus</strong></h3>
<p>From animating Lil’ Elvis and the Truckstoppers in the ’90s to starting his own creative studio and later turning a hugely successful, award-winning brand film around in just six weeks as a creative director at Monster & Bear, JC Reyes has done it all.</p>
<p>The night began with JC telling our audience of animation and game design students, filmmakers and producers, “I’m your peoples,” and the event certainly felt like a joyful reunion, with many AIT educators excited to catch up with an old colleague. The animation industry in Melbourne may be small in numbers, but it is mighty in spirit. </p>
<p>It’s clear that apart from his impressive personal achievements, JC has also had an important impact on the careers of many other creatives. From past interns to present colleagues, half the room seemed to have some connection to JC, and everyone was keen to share in more of his wisdom. </p>
<p>JC kicked off with a quote usually attributed to Albert Einstein – “Creativity is intelligence having fun.” And that’s a really good way to sum up JC Reyes’ explanation of the creative process. It’s clear that a lot of thought has gone into his creation of this framework, and for every new project, JC starts with his intellect – nutting out the problems and the parameters before committing fully to the bold, creative ideas that make the work fun.</p>

<h3><strong>Learning to Create Films</strong></h3>
<p>One of the things JC really wanted our audience to take away from the talk was the importance of mastering – and then demonstrating – the foundational skills of their craft.</p>
<p>This is especially important for junior animators, and something that they should take care to present in their showreels. </p>
<p>“We don’t want to see perfect,” JC explained. “We want to see a good understanding of foundational skills. Animators – I want to see weight, I want to see – you know – anticipation before you move. I don’t want to see it perfectly moving – I want to see your thinking with your work.” </p>
<p>While there’s a lot to be said for presenting polished work, junior animators shouldn’t overlook the pieces that show their working, and display their understanding of the principles that underpin these finished works. This is something that will demonstrate to potential employers that a junior can become a valuable member of their team.  </p>

<h3><strong>Becoming a Filmmaker</strong></h3>
<p>“The ‘no’ is not about you. If you get a ‘no’, it means you haven’t really understood the ask.”</p>
<p>Throughout your career as a creative professional, you are going to face rejection, and you are going to hear the word, “no”. No to the big idea, no to the creative direction you want to take. JC believes this is just part of the job, and that you have to look beyond the sense of rejection to figure out why the client, your boss, or your team have said no. </p>  
<p>“You’ll hear lots of nos, and don’t take it personally. I still work with this because I’m a very proud and passionate person.” “But most of the nos tend to be about me not understanding what they’re asking of me. Because I’ve always wanted to present my ideas, and they’re like.. ‘I just want to advertise socks’.” “It’s being discerning enough to go, ‘What have I not seen?’ What have I not heard from the brief?’ And then going back again.” And while it’s important to respect the client’s wishes, JC also pointed out that you shouldn’t give up when faced with these rejections of ideas or concepts. You can always adjust your approach and try again. </p>
        ''',
        'image':
            'https://ait.edu.au/_next/image?url=https%3A%2F%2Fait.yourcreative.com.au%2Fwp-content%2Fuploads%2F2024%2F04%2FMelbourne-MasterTalk-April-2024-Dean-Musumeci-scaled.jpg&w=3840&q=75',
        'speakerImage':
            'https://media.licdn.com/dms/image/v2/D5603AQENqX6u8GtaKw/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1718236198003?e=1756339200&v=beta&t=r45N7SmjaXtYNCs06pIf3JUu9kMFKY8WbaR4VurdwOs',
        'speakerSocial': '@dean_films',
      },
    ];

    events[dates[2]] = [
      {
        'title': 'Melbourne MasterTalk with Annemarie Gereis',
        'startTime': '2:00 PM',
        'endTime': '3:30 PM',
        'duration': '1.5 hr',
        'location': 'Melbourne Campus',
        'room': 'Room 407',
        'speaker': 'Annemarie Gereis',
        'stream': 'Game',
        'description': '''
<h3><strong>Melbourne MasterTalk: Building a VFX Career with Annemarie Gereis</strong></h3>
<p>From animating Lil’ Elvis and the Truckstoppers in the ’90s to starting his own creative studio and later turning a hugely successful, award-winning brand film around in just six weeks as a creative director at Monster & Bear, JC Reyes has done it all.</p>
<p>The night began with JC telling our audience of animation and game design students, filmmakers and producers, “I’m your peoples,” and the event certainly felt like a joyful reunion, with many AIT educators excited to catch up with an old colleague. The animation industry in Melbourne may be small in numbers, but it is mighty in spirit. </p>
<p>It’s clear that apart from his impressive personal achievements, JC has also had an important impact on the careers of many other creatives. From past interns to present colleagues, half the room seemed to have some connection to JC, and everyone was keen to share in more of his wisdom. </p>
<p>JC kicked off with a quote usually attributed to Albert Einstein – “Creativity is intelligence having fun.” And that’s a really good way to sum up JC Reyes’ explanation of the creative process. It’s clear that a lot of thought has gone into his creation of this framework, and for every new project, JC starts with his intellect – nutting out the problems and the parameters before committing fully to the bold, creative ideas that make the work fun.</p>

<h3><strong>Inspiring the Next Generation to Build Their VFX Careers</strong></h3>
<p>One of the things JC really wanted our audience to take away from the talk was the importance of mastering – and then demonstrating – the foundational skills of their craft.</p>
<p>This is especially important for junior animators, and something that they should take care to present in their showreels. </p>
<p>“We don’t want to see perfect,” JC explained. “We want to see a good understanding of foundational skills. Animators – I want to see weight, I want to see – you know – anticipation before you move. I don’t want to see it perfectly moving – I want to see your thinking with your work.” </p>
<p>While there’s a lot to be said for presenting polished work, junior animators shouldn’t overlook the pieces that show their working, and display their understanding of the principles that underpin these finished works. This is something that will demonstrate to potential employers that a junior can become a valuable member of their team.  </p>

<h3><strong>The Importance of Inspiration as a VFX Artist</strong></h3>
<p>“The ‘no’ is not about you. If you get a ‘no’, it means you haven’t really understood the ask.”</p>
<p>Throughout your career as a creative professional, you are going to face rejection, and you are going to hear the word, “no”. No to the big idea, no to the creative direction you want to take. JC believes this is just part of the job, and that you have to look beyond the sense of rejection to figure out why the client, your boss, or your team have said no. </p>  
<p>“You’ll hear lots of nos, and don’t take it personally. I still work with this because I’m a very proud and passionate person.” “But most of the nos tend to be about me not understanding what they’re asking of me. Because I’ve always wanted to present my ideas, and they’re like.. ‘I just want to advertise socks’.” “It’s being discerning enough to go, ‘What have I not seen?’ What have I not heard from the brief?’ And then going back again.” And while it’s important to respect the client’s wishes, JC also pointed out that you shouldn’t give up when faced with these rejections of ideas or concepts. You can always adjust your approach and try again. </p>
        ''',
        'image':
            'https://ait.yourcreative.com.au/wp-content/uploads/2024/07/Annemarie-Gereis-Melbourne-MasterTalk-July-2024_1.11.1.jpg',
        'speakerImage':
            'https://media.licdn.com/dms/image/v2/D5603AQFpws_nm5tbDw/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1713351324974?e=1756339200&v=beta&t=_6f3yu-egZngZAB3PL3uVzJ0rSisysZkykiQfYWzBSw',
        'speakerSocial': '@annemarie_games',
      },
      {
        'title': 'Open Day',
        'startTime': '09:00 AM',
        'endTime': '10:30 PM',
        'duration': '1.5 hr',
        'location': 'Sydney Campus',
        'room': 'Hall',
        'speaker': 'Natalie Wong',
        'stream': 'Information',
        'description': '''
<h3><strong>About Academy of Interactive Technology (AIT)</strong></h3>
<p>From animating Lil’ Elvis and the Truckstoppers in the ’90s to starting his own creative studio and later turning a hugely successful, award-winning brand film around in just six weeks as a creative director at Monster & Bear, JC Reyes has done it all.</p>
<p>The night began with JC telling our audience of animation and game design students, filmmakers and producers, “I’m your peoples,” and the event certainly felt like a joyful reunion, with many AIT educators excited to catch up with an old colleague. The animation industry in Melbourne may be small in numbers, but it is mighty in spirit. </p>
<p>It’s clear that apart from his impressive personal achievements, JC has also had an important impact on the careers of many other creatives. From past interns to present colleagues, half the room seemed to have some connection to JC, and everyone was keen to share in more of his wisdom. </p>
<p>JC kicked off with a quote usually attributed to Albert Einstein – “Creativity is intelligence having fun.” And that’s a really good way to sum up JC Reyes’ explanation of the creative process. It’s clear that a lot of thought has gone into his creation of this framework, and for every new project, JC starts with his intellect – nutting out the problems and the parameters before committing fully to the bold, creative ideas that make the work fun.</p>

<h3><strong>Our Courses</strong></h3>
<p>One of the things JC really wanted our audience to take away from the talk was the importance of mastering – and then demonstrating – the foundational skills of their craft.</p>
<p>This is especially important for junior animators, and something that they should take care to present in their showreels. </p>
<p>“We don’t want to see perfect,” JC explained. “We want to see a good understanding of foundational skills. Animators – I want to see weight, I want to see – you know – anticipation before you move. I don’t want to see it perfectly moving – I want to see your thinking with your work.” </p>
<p>While there’s a lot to be said for presenting polished work, junior animators shouldn’t overlook the pieces that show their working, and display their understanding of the principles that underpin these finished works. This is something that will demonstrate to potential employers that a junior can become a valuable member of their team.  </p>

<h3><strong>Life at AIT</strong></h3>
<p>“The ‘no’ is not about you. If you get a ‘no’, it means you haven’t really understood the ask.”</p>
<p>Throughout your career as a creative professional, you are going to face rejection, and you are going to hear the word, “no”. No to the big idea, no to the creative direction you want to take. JC believes this is just part of the job, and that you have to look beyond the sense of rejection to figure out why the client, your boss, or your team have said no. </p>  
<p>“You’ll hear lots of nos, and don’t take it personally. I still work with this because I’m a very proud and passionate person.” “But most of the nos tend to be about me not understanding what they’re asking of me. Because I’ve always wanted to present my ideas, and they’re like.. ‘I just want to advertise socks’.” “It’s being discerning enough to go, ‘What have I not seen?’ What have I not heard from the brief?’ And then going back again.” And while it’s important to respect the client’s wishes, JC also pointed out that you shouldn’t give up when faced with these rejections of ideas or concepts. You can always adjust your approach and try again. </p>
        ''',
        'image':
            'https://ait.edu.au/_next/image?url=https%3A%2F%2Fait.yourcreative.com.au%2Fwp-content%2Fuploads%2F2023%2F11%2FAIT-Graduation-2023-by-Homepix-Photography-0216-scaled.jpg&w=3840&q=75',
        'speakerImage':
            'https://media.licdn.com/dms/image/v2/C5103AQE83gBmCt2BXg/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1546429509243?e=1756339200&v=beta&t=cPlviX-aKdwkLeBXPBwqMm3pDMccZyfidCHRNiRzt2o',
        'speakerSocial': '@natalie_info',
      },
    ];
    events[dates[3]] = [
      {
        'title': 'Melbourne MasterTalk with JC Reyes',
        'startTime': '10:00 AM',
        'endTime': '11:00 AM',
        'duration': '1 hr',
        'location': 'Melbourne Campus',
        'room': 'Room 102',
        'speaker': 'JC Reyes',
        'stream': 'Filming',
        'description': '''
<h3><strong>The Importance of a Creative Process with JC Reyes</strong></h3>
<p>From animating Lil’ Elvis and the Truckstoppers in the ’90s to starting his own creative studio and later turning a hugely successful, award-winning brand film around in just six weeks as a creative director at Monster & Bear, JC Reyes has done it all.</p>
<p>The night began with JC telling our audience of animation and game design students, filmmakers and producers, “I’m your peoples,” and the event certainly felt like a joyful reunion, with many AIT educators excited to catch up with an old colleague. The animation industry in Melbourne may be small in numbers, but it is mighty in spirit. </p>
<p>It’s clear that apart from his impressive personal achievements, JC has also had an important impact on the careers of many other creatives. From past interns to present colleagues, half the room seemed to have some connection to JC, and everyone was keen to share in more of his wisdom. </p>
<p>JC kicked off with a quote usually attributed to Albert Einstein – “Creativity is intelligence having fun.” And that’s a really good way to sum up JC Reyes’ explanation of the creative process. It’s clear that a lot of thought has gone into his creation of this framework, and for every new project, JC starts with his intellect – nutting out the problems and the parameters before committing fully to the bold, creative ideas that make the work fun.</p>

<h3><strong>Junior Creatives Need to Demonstrate Foundational Skills</strong></h3>
<p>One of the things JC really wanted our audience to take away from the talk was the importance of mastering – and then demonstrating – the foundational skills of their craft.</p>
<p>This is especially important for junior animators, and something that they should take care to present in their showreels. </p>
<p>“We don’t want to see perfect,” JC explained. “We want to see a good understanding of foundational skills. Animators – I want to see weight, I want to see – you know – anticipation before you move. I don’t want to see it perfectly moving – I want to see your thinking with your work.” </p>
<p>While there’s a lot to be said for presenting polished work, junior animators shouldn’t overlook the pieces that show their working, and display their understanding of the principles that underpin these finished works. This is something that will demonstrate to potential employers that a junior can become a valuable member of their team.  </p>

<h3><strong>The Importance of Knowing that a “No” Isn’t Personal</strong></h3>
<p>“The ‘no’ is not about you. If you get a ‘no’, it means you haven’t really understood the ask.”</p>
<p>Throughout your career as a creative professional, you are going to face rejection, and you are going to hear the word, “no”. No to the big idea, no to the creative direction you want to take. JC believes this is just part of the job, and that you have to look beyond the sense of rejection to figure out why the client, your boss, or your team have said no. </p>  
<p>“You’ll hear lots of nos, and don’t take it personally. I still work with this because I’m a very proud and passionate person.” “But most of the nos tend to be about me not understanding what they’re asking of me. Because I’ve always wanted to present my ideas, and they’re like.. ‘I just want to advertise socks’.” “It’s being discerning enough to go, ‘What have I not seen?’ What have I not heard from the brief?’ And then going back again.” And while it’s important to respect the client’s wishes, JC also pointed out that you shouldn’t give up when faced with these rejections of ideas or concepts. You can always adjust your approach and try again. </p>
        ''',
        'image':
            'https://ait.edu.au/_next/image?url=https%3A%2F%2Fait.yourcreative.com.au%2Fwp-content%2Fuploads%2F2025%2F04%2FJC_Reyes_Melb_MasterTalk_Mar_-2025_IMG_20250326_190914140_HDR-scaled.jpg&w=3840&q=75',
        'speakerImage':
            'https://media.licdn.com/dms/image/v2/D5603AQGddhXFFtDIbw/profile-displayphoto-scale_400_400/B56Zho.OLoHkAg-/0/1754107806053?e=1756944000&v=beta&t=iEQPDPJRjoao5VxMqdvgtUT77RIS-2Cyc56Ryxw3kNU',
        'speakerSocial': '@jc_reyes',
      },
    ];
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedEvents = events[selectedDate] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Agenda',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final date = dates[index];
                  final isSelected = selectedDate == date;
                  return GestureDetector(
                    onTap: () => setState(() => selectedDate = date),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF28D2D1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: const Color(0xFF28D2D1)),
                      ),
                      child: Center(
                        child: Text(
                          date,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: selectedEvents.isEmpty
                  ? const Center(
                      child: Text(
                        'No sessions to display',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      itemCount: selectedEvents.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final event = selectedEvents[index];
                        final stream = event['stream'] ?? 'General';
                        final color = streamColors[stream] ?? Colors.grey;
                        final eventTitle = event['title'] ?? '';
                        final isReminderSet = remindersSet.contains(eventTitle);

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EventDetailScreen(
                                  event: event,
                                  streamColor: color,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 6,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    16,
                                    24,
                                    16,
                                    16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              eventTitle,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.1),
                                                  blurRadius: 4,
                                                ),
                                              ],
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.alarm),
                                              iconSize: 22,
                                              color: isReminderSet
                                                  ? color
                                                  : Colors.black,
                                              onPressed: () {
                                                setState(() {
                                                  if (isReminderSet) {
                                                    remindersSet.remove(
                                                      eventTitle,
                                                    );
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Reminder removed for "$eventTitle"',
                                                        ),
                                                        duration:
                                                            const Duration(
                                                              seconds: 2,
                                                            ),
                                                      ),
                                                    );
                                                  } else {
                                                    remindersSet.add(
                                                      eventTitle,
                                                    );
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Reminder set for "$eventTitle"',
                                                        ),
                                                        duration:
                                                            const Duration(
                                                              seconds: 2,
                                                            ),
                                                      ),
                                                    );
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_today,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              selectedDate,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          const Icon(
                                            Icons.access_time,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              '${event['startTime']} – ${event['endTime']} (${event['duration']})',
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${event['location']}, ${event['room']}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            size: 16,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Expanded(
                                            child: Text(
                                              'Speaker: ${event['speaker']}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                              softWrap: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        stream,
                                        style: TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventDetailScreen extends StatelessWidget {
  final Map<String, String> event;
  final Color streamColor;

  const EventDetailScreen({
    super.key,
    required this.event,
    required this.streamColor,
  });

  @override
  Widget build(BuildContext context) {
    final String eventTitle = event['title'] ?? 'Event';
    final String eventImage =
        event['image'] ??
        'https://via.placeholder.com/600x300.png?text=Event+Image';
    final String speakerName = event['speaker'] ?? 'Speaker';
    final String speakerImage =
        event['speakerImage'] ??
        'https://via.placeholder.com/150.png?text=Speaker+Image';

    return Scaffold(
      appBar: AppBar(title: Text(eventTitle), backgroundColor: streamColor),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              eventImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              eventTitle,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: streamColor,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${event['location']}, ${event['room']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${event['startTime']} – ${event['endTime']} (${event['duration']})',
                    style: const TextStyle(fontSize: 14),
                    overflow:
                        TextOverflow.ellipsis, // Ensure long text doesn't overflow
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Html(
              data: event['description'] ?? 'No description available.',
              style: {
                "h3": Style(
                  fontSize: FontSize.xLarge,
                  fontWeight: FontWeight.bold,
                ),
                "p": Style(fontSize: FontSize.medium),
                "strong": Style(fontWeight: FontWeight.bold),
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    speakerImage,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        speakerName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        _SocialButtonImage(
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/174/174857.png', // LinkedIn
                        ),
                        SizedBox(width: 8),
                        _SocialButtonImage(
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/5968/5968764.png', // Facebook
                        ),
                        SizedBox(width: 8),
                        _SocialButtonImage(
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/281/281764.png', // Google
                        ),
                        SizedBox(width: 8),
                        _SocialButtonImage(
                          imageUrl:
                              'https://cdn-icons-png.flaticon.com/512/5968/5968958.png', // Twitter
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _SocialButtonImage extends StatelessWidget {
  final String imageUrl;

  const _SocialButtonImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Image.network(imageUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}

