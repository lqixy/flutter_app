class Post {
  Post({this.title, this.author, this.imageUrl, this.description});

  final String title;
  final String author;
  final String imageUrl;
  final String description;

  bool selected = false;
}

final List<Post> posts = [
  Post(
      author: 'kyle',
      title: 'Consectetur aute cupidatat tempor qui aliquip ea incididunt adipisicing.',
      imageUrl: 'https://www.itying.com/images/flutter/1.png',
      description: '改也果买人？人本英列传恋暗丽登谢。摇处吧照京项共值赛迷觉般挥诉娘道连！老底空著送法短！米识战趣管？是数终工脱夫周窢饭喊记很顿州船就它停班。生叶升木忽艺我助喊优紶确备？印冷破帝酒划诉展的图竟妻刚骨提区想？流蒙十乱闻住臓寻康本当月突意画血！刚守丈住节直蒙冲苏士封东阵棋中。拍由待再恋环当种招。共依恩世杂娜器！察空平大红雨波急护！型欢们主脸角餐著吗运！痛密半挥忙哭冲死暗究德修。到当增假专解牛万值英保凡思。'),
  Post(
      author: 'qiqi',
      title: 'Consectetur nulla ad cupidatat occaecat est quis pariatur enim consectetur ipsum sunt fugiat nisi aliquip.',
      imageUrl: 'https://www.itying.com/images/flutter/2.png',
      description: '立晚画彩间？断帮照士间久耳信下近想代碃险。儿晚亡证帮什左画社险字急住屋义？军记奥洋请！破盛楼场数店亚程营悲史干万！立病群题言际技每礼位！弟友联胡错精给切！统部未度毛临要委招修根听雨马。群开管波觉情悲顺获妹把。登义场杰餐？军敢雨两佛忘密节曲犯！朝九临常换境鲜雨兴仅欢它席遗然并！改近单秘过死？差取舞桌木银居铁？宝采露钱范尔白事！府客草好婚珍她坚既候度船升完设编！环喝当势睛铁段察虽们。房桌月承伙希民烈？'),
  Post(
      author: 'tt',
      title: 'Non sunt ex incididunt qui est.',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '姐势口衣遇屋亮牛候级区原！忙举例惊想带。油莱看最童力显只角较费任少？您怎儿妻境曾铁女。课显务著易空哪虽机结山字下做架设半？退乐然每反业回间间拉如没犯算电采。乱雪铁转族抱新吃戏伦象终！有哥游睡象伤衣河！子通来双问。狗童兰碃女奇。造各黑房婚剧？步给纸吸降采低府留！堂多赶须把皮示？书追负五倒弟广木校落害统官兴？否突财京忘视！波旁导犯快灵婚钱娘！耳层珍休暗产你背甚能品响星友礼晚肉博？怪和远工束典好试参！！'),
  Post(
      author: 'admin',
      title: 'Minim reprehenderit ipsum ea ex in non mollit eiusmod esse voluptate.',
      imageUrl: 'https://www.itying.com/images/flutter/4.png',
      description: '冷依丝心收？奇暗终街支怪创究弹和！校普座双样往夜幸上我午支伤春月叫松切戴？渐富意机贵岁两祖船宝象银词该脑木？获支种神种人责继告土架暗！律罪条爱从朝调境？无竟选顿济依劳寻唱细担势人办灯伴杰画通？程内放己否引划宫两局院妈塞灵讲！任刚出排幸忽牌舞团而顿开空微中等奶等值。至脑之桌争！堂秘并封义规也故吃前冲守却。便少活胡星遍江必练批？间持吧雨少喊枪上再些完直告禁治外转？引担众寻跳灯姆军？绝火般算店紧塞姐身。'),
  Post(
      author: 'kyle',
      title: 'Excepteur velit dolor non amet nulla sit fugiat irure nisi.',
      imageUrl: 'https://www.itying.com/images/flutter/5.png',
      description: '格帝呢腿背。强之喊容动比引星数毛礼比？药外步倒术当久这露首不香？空碃水别极！况正降族求味餐另。词倒吗凡员战律左德难洛食满越呢舞黄结但。间去铁束采？典运千毕妈堂岁先紧研空名存确！笔集持姆改月钟纪千错育？幸碃戴本党班与哥充报停绝。至恋珍两玛间跑区职合始也妻悲。抱雪半责错水谁剧索碃黑莫趣恋木进某算忙？场可讲类迷异们票介法释。来差因少击客个老所负！完去达娘作设量朋且清弟难降了由怕然些参。报才云批第甚试确？'),
  Post(
      author: 'qiqi',
      title: 'Do voluptate cupidatat aliquip pariatur.',
      imageUrl: 'https://www.itying.com/images/flutter/6.png',
      description: '授节仍伦莫？诺阿改缺的必语统参明喊力理付持到切！之建所尽肯救鱼群露查查念！连于吃却旧建英退美热念加朝进言育梦标？初派离藸运律章兵门言趣鸟速住书泪？拥办细须进和批战志仍拉状欢达社普帮灯？讲今乡火没纪或预息节业大疑野？为鲁架恋饭停定正村脚八容笑！六单父棋灯我道姆采。满圣波浪去山消几怎球满卖样任调行孩亲个。鸟约道山年授约文色适恋？带房餐今编言想科革息坦欢！和桌卡乱级又三个波梦被架单蜖背商看两。生本解水！'),
  Post(
      author: 'tt',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'admin',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/4.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'kyle',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/1.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'qiqi',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/2.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'tt',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'tt',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'tt',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'tt',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'tt',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'tt',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'tt',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/3.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！'),
  Post(
      author: 'admin',
      title: '我是测试',
      imageUrl: 'https://www.itying.com/images/flutter/4.png',
      description: '视频来源于网络，仅供学习交流使用，如果侵犯您的权益，请私信进行删除！')
];
