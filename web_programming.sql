-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2018-03-10 15:54:19
-- 服务器版本： 5.5.55-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_programming`
--

-- --------------------------------------------------------

--
-- 表的结构 `bankAccount`
--

CREATE TABLE `bankAccount` (
  `uid` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `bankAccount`
--

INSERT INTO `bankAccount` (`uid`, `password`) VALUES
('Pat', 'Pat'),
('wjw', 'wjw');

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE `book` (
  `bid` int(5) NOT NULL,
  `title` varchar(30) NOT NULL,
  `author` varchar(30) NOT NULL,
  `coverURL` varchar(64) NOT NULL DEFAULT 'staticPages/covers/default',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(200) DEFAULT NULL,
  `subtitle` varchar(30) DEFAULT NULL,
  `category` varchar(10) NOT NULL,
  `tag` varchar(30) DEFAULT NULL,
  `status` varchar(6) NOT NULL DEFAULT '连载中',
  `price` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `book`
--

INSERT INTO `book` (`bid`, `title`, `author`, `coverURL`, `date`, `description`, `subtitle`, `category`, `tag`, `status`, `price`) VALUES
(1, '三体', '刘慈欣', 'default', '2007-12-31 16:00:00', NULL, '“地球往事”三部曲之一', '科幻', NULL, '已完结', 0),
(2, '三体 II', '刘慈欣', 'default', '2011-10-31 16:00:00', NULL, '黑暗森林', '科幻', NULL, '已完结', 0),
(3, '三体 III', '刘慈欣', 'default', '2010-10-31 16:00:00', NULL, '死神永生', '科幻', NULL, '已完结', 0),
(4, 'C++ Primer Plus', 'Stephen Prata', 'default', '2012-06-18 16:00:00', NULL, NULL, '计算机', NULL, '已完结', 0),
(5, '算法竞赛入门经典', '刘汝佳', 'default', '2014-05-31 16:00:00', NULL, NULL, '计算机', NULL, '已完结', 0),
(6, '数学之美', '吴军', 'default', '2012-04-30 16:00:00', NULL, NULL, '科学', NULL, '已完结', 0),
(7, '众神的星空', '稻草人语', 'default', '2013-12-31 16:00:00', NULL, NULL, '文学', NULL, '已完结', 0),
(8, '星座神话', '稻草人语', 'default', '2014-12-31 16:00:00', NULL, NULL, '文学', NULL, '已完结', 0),
(9, '年少荒唐', '朱炫', 'default', '2015-08-31 16:00:00', NULL, NULL, '文学', NULL, '已完结', 0),
(10, 'The Little World of Liz Climo', 'Liz Climo', 'default', '2014-09-29 16:00:00', NULL, NULL, '绘本', NULL, '已完结', 0),
(11, 'Rory the Dinosaur', 'Liz Climo', 'default', '2015-05-27 16:00:00', NULL, 'Me and My Dad', '绘本', NULL, '已完结', 0),
(12, '夜观星空', '特伦斯·迪金森 ', 'default', '2012-08-31 16:00:00', 'NightWatch: A Practical Guide to Viewing the Universe', '天文观测实践指南', '科学', NULL, '已完结', 0),
(13, '哈利·波特与魔法石', 'J.K.罗琳', 'default', '2000-08-31 16:00:00', NULL, NULL, '魔幻', NULL, '已完结', 0),
(14, '哈利·波特与密室', 'J.K.罗琳', 'default', '2000-08-31 16:00:00', '', NULL, '魔幻', NULL, '已完结', 0),
(15, '哈利·波特与阿兹卡班的囚徒', 'J.K.罗琳', 'default', '2000-08-31 16:00:00', '', NULL, '魔幻', NULL, '已完结', 0),
(16, '哈利·波特与火焰杯', 'J.K.罗琳', 'default', '2001-04-30 16:00:00', '译者：马爱新', NULL, '魔幻', NULL, '已完结', 0),
(17, '哈利·波特与凤凰社', 'J.K.罗琳', 'default', '2003-08-31 16:00:00', NULL, NULL, '魔幻', NULL, '已完结', 0),
(18, '哈利·波特与混血王子', 'J.K.罗琳', 'default', '2005-09-30 16:00:00', '译者：马爱农 / 马爱新 ', NULL, '魔幻', NULL, '已完结', 0),
(19, '哈利·波特与死亡圣器', 'J.K.罗琳', 'default', '2007-09-30 16:00:00', '译者：马爱农 / 马爱新 ', NULL, '魔幻', NULL, '已完结', 0),
(20, '亚当的航行日记', 'Patrick', 'fbaa9a9d9137e083fb3cfb80c3031f72', '2017-06-08 02:51:22', '亚当·尤因的太平洋日记', NULL, '传记', NULL, '连载中', 0),
(21, '来自希德海姆庄园的信', 'Patrick', 'default', '2017-05-15 16:00:00', NULL, NULL, '文学', NULL, '连载中', 0),
(22, '半衰期——路易莎的第一个谜', 'Patrick', 'default', '2017-05-14 16:00:00', NULL, NULL, '纪实', NULL, '连载中', 0),
(23, '卡文迪许的苦难经历', 'Patrick', 'default', '2017-05-13 16:00:00', NULL, NULL, '传记', NULL, '连载中', 0),
(24, '星美451的记录仪', 'Patrick', 'default', '2017-05-12 16:00:00', NULL, NULL, '科幻', NULL, '连载中', 0),
(25, '思路刹路口及以后', 'Patrick', 'default', '2017-05-11 16:00:00', NULL, NULL, '科幻', NULL, '连载中', 0),
(30, '1', 'wjw', 'default', '2017-05-24 16:00:00', '', '', '玄幻', '', '连载中', 0),
(35, 'test', 'Patrick', '8894453c6a4831f17d27d33aa16a6c6a', '2017-06-05 11:04:50', '', '1', '玄幻', '', '连载中', 10),
(36, 'coverTest', 'Patrick', '5332afcfcfe40afd394cd30935d1a663', '2017-06-05 11:04:57', '123123123', 'nothing', '科学', '', '连载中', 20);

--
-- 触发器 `book`
--
DELIMITER $$
CREATE TRIGGER `autoCreate` AFTER INSERT ON `book` FOR EACH ROW BEGIN
	INSERT INTO bookDetail
    (bid, chapters, clicks)
    VALUES (new.bid, 0, 0);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `bookChapters`
--

CREATE TABLE `bookChapters` (
  `bid` int(5) NOT NULL,
  `chapterIndex` int(5) NOT NULL,
  `chapterTitle` varchar(30) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `bookChapters`
--

INSERT INTO `bookChapters` (`bid`, `chapterIndex`, `chapterTitle`, `content`) VALUES
(20, 1, 'title', 'des'),
(20, 2, 'title2', 'gfhgdgjdf'),
(20, 3, 'title3', 'asdasd'),
(20, 4, 'alsdh', 'sdaskjdhqwe'),
(20, 5, '123', '123123'),
(20, 6, '疯狂年代', '中国，1967年。\n\n　　“红色联合”对“四?二八兵团”总部大楼的攻击已持续了两天，他们的旗帜在大楼周围躁动地飘扬着，仿佛渴望干柴的火种。“红色联合”的指挥官心急如焚，他并不惧怕大楼的守卫者，那二百多名“四?二八”战士，与诞生于l966年初、经历过大检阅和大串联的“红色联合”相比要稚嫩许多。他怕的是大楼中那十几个大铁炉子，里面塞满了烈性炸药，用电雷管串联起来，他看不到它们，但能感觉到它们磁石般的存在，开关一合，玉石俱焚，而“四?二八”的那些小红卫兵们是有这个精神力量的。比起已经在风雨中成熟了许多的第一代红卫兵，新生的造反派们像火炭上的狼群，除了疯狂还是疯狂。\n\n　　大楼顶上出现了一个娇小的身影，那个美丽的女孩子挥动着一面“四?二八”的大旗，她的出现立刻招来了一阵杂乱的枪声，射击的武器五花八门，有陈旧的美式卡宾枪、捷克式机枪和三八大盖，也有崭新的制式步枪和冲锋枪——后者是在“八月社论”发表之后从军队中偷抢来的（注：1967年8月《红旗》杂志发表“揪军内一小撮”的社论，使冲击军区、抢夺军队枪支弹药的事件愈演愈烈，全国范围的武斗也进入高潮。）——连同那些梭标和大刀等冷兵器，构成了一部浓缩的近现代史……“四?二八”的人在前面多次玩过这个游戏，在楼顶上站出来的人，除了挥舞旗帜外，有时还用喇叭筒喊口号或向下撒传单，每次他们都能在弹雨中全身而退，为自己挣到了崇高的荣誉。这次出来的女孩儿显然也相信自己还有那样的幸运她挥舞着战旗，挥动着自己燃烧的青春，敌人将在这火焰中化为灰烬，理想世界明天就会在她那沸腾的热血中诞生……她陶醉在这鲜红灿烂的梦幻中，直到被一颗步枪子弹洞穿了胸膛，十五岁少女的胸膛是那么柔嫩，那颗子弹穿过后基本上没有减速，在她身后的空中发出一声啾鸣。年轻的红卫兵同她的旗帜一起从楼顶落下，她那轻盈的身体落得甚至比旗帜还慢，仿佛小鸟眷恋着天空。\n\n　　“红色联合”的战士们欢呼起来，几个人冲到楼下，掀开四．二八的旗帜，抬起下面纤小的遗体，作为一个战利品炫耀地举了一段，然后将她高高地扔向大院的铁门，铁门上带尖的金属栅条大部分在武斗初期就被抽走当梭标了，剩下的两条正好挂住了她，那一瞬间，生命似乎又回到了那个柔软的躯体。红色联合的红卫兵们退后一段距离，将那个挂在高处的躯体当靶子练习射击，密集的子弹对她来说已柔和如雨，不再带来任何感觉，她那春藤般的手臂不时轻挥一下，仿佛拂去落在身上的雨滴，直到那颗年轻的头颅被打掉了一半，仅剩的一只美丽的眼睛仍然凝视着一九六七年的蓝天，目光中没有痛苦，只有凝固的激情和渴望。\n\n　　其实，比起另外一些人来，她还是幸运的，至少是在为理想献身的壮丽激情中死去。\n\n　　这样的热点遍布整座城市，像无数并行运算的CPU，将“文革大革命”联为一个整体。疯狂如同无形的洪水，将城市淹没其中并渗透到每一个细微的角落和缝隙。\n\n　　在城市边缘的那所著名大学的操场上，一场几千人参加的批斗会已经进行了近两个小时。在这个派别林立的年代，任何一处都有错综复杂的对立派别在格斗。在校园中，红卫兵、文革工作组、工宣队和军宣队，相互之间都在爆发尖锐的冲突，而每种派别的内部又时时分化出新的对立派系，捍卫着各自不同的背景和纲领，爆发更为残酷的较量。但这次被批斗的反动学术权威，却是任何一方均无异议的斗争目标，他们也只能同时承受来自各方的残酷打击。\n\n　　与其他的牛鬼蛇神相比，反动学术权威有他们的特点：当打击最初到来时，他们的表现往往是高傲而顽固的，这也是他们伤亡率最高的阶段；在首都，四十天的时间里就有一千七百多名批斗对象被活活打死，更多的人选择了更快捷的路径来逃避疯狂，老舍、吴晗、葛伯赞、傅雷、赵九章、以群、闻捷、海默等，都自己结束了他们那曾经让人肃然起敬的生命。\n\n　　从这一阶段幸存下来的人，在持续的残酷打击下渐渐麻木，这是一种自我保护的精神外壳，使他们避免最后的崩溃。他们在批斗会上常常进入半睡眠状态，只有一声恫吓才能使其惊醒过来，机械地重复那已说过无数遍的认罪词；然后，他们中的一部分人便进入了第三阶段，旷日持久的批判将鲜明的政治图像如水银般注入了他们的意识，将他们那由知识和理性构筑的思想大厦彻底摧毁，他们真的相信自己有罪，真的看到了自己对伟大事业构成的损害，并为此痛哭流涕，他们的忏悔往往比那此非知识分子的牛鬼蛇神要深刻得多，也真诚得多；而对于红卫兵来说，进入后两个阶段的批判对象是最乏味的，只有处于第一阶段的牛鬼蛇神才能对他们那早已过度兴奋的神经产生有效的刺激，如同斗牛士手上的红布，但这样的对象越来越少了，在这所大学中可能只剩下一个，他由于自己的珍稀而被留到批判大会最后出场。\n\n　　叶哲泰从文革开始一直活到了现在，并且一直处于第一阶段，他不认罪，不自杀，也不麻木。当这位物理学教授走上批判台时，他那神情分明在说：让我背负的十字架更沉重一些吧！红卫兵们让他负担的东西确实很重，但不是十字架。别的批判对象戴的高帽子都是用竹条扎的框架，而他戴的这顶却是用一指粗的钢筋焊成的，还有他挂在胸前的那块牌子，也不是别人挂的木板，而是从实验室的一个烤箱上拆下的铁门，上面用黑色醒目地写着他的名字，并沿对角线画上了一个红色的大叉。\n\n　　押送叶哲泰上台的红卫兵比别的批判对象多了一倍，有六人，两男四女。两个男青年步伐稳健有力，一副成熟的青年布尔什维克形象，他们都是物理系理论物理专业大四年级的，叶哲泰曾是他们的老师；那四名女孩子要年轻得多，都是大学附中的初二学生，这些穿着军装扎着武装带的小战士挟带着逼人的青春活力，像四团绿色的火焰包围着叶哲泰。叶哲泰的出现使下面的人群兴奋起来，刚才已有些乏力的口号声又像新一轮海潮般重新高昂起来，淹没了一切。\n\n　　耐心地等口号声平息下去后，台上两名男红卫兵中的一人转向批判对象：“叶哲泰，你精通各种力学，应该看到自己正在抗拒的这股伟大的合力是多么强大，顽固下去是死路一条！今天继续上次大会的议程，废话就不多说了。老实回答下面的问题：在六二至六五届的基础课中，你是不是擅自加入了大量的相对论内容？！”\n\n　　“相对论已经成为物理学的古典理论，基础课怎么能不涉及它呢？”叶哲泰回答说。\n\n　　“你胡说！”旁边的一名女红卫兵厉声说，“爱因斯坦是反动的学术权威，他有奶便是娘，跑去为美帝国主义造原子弹！要建立起革命的科学，就要打倒以相对论为代表的资产阶级理论黑旗！”\n\n　　叶哲泰沉默着，他在忍受着头上铁高帽和胸前铁板带来的痛苦，不值得回应的问题就沉默了。在他身后，他的学生也微微皱了一下眉头。说话的女孩儿是这四个中学红卫兵中天资最聪颖的一个，并且显然有备而来，刚才上台前还看到她在背批判稿，但要对付叶哲泰，仅凭她那几句口号是不行的。他们决定亮出今天为老师准备的新武器，其中的一人对台下挥了一下手。\n\n　　叶哲泰的妻子，同系的物理学教授绍琳从台下的前排站起来，走上台。她身穿一件很不合体的草绿色衣服，显然想与红卫兵的色彩拉近距离，但熟悉绍琳的人联想到以前常穿精致旗袍讲课的她，总觉得别扭。\n\n　　“叶哲泰！”绍琳指着丈夫喝道，她显然不习惯于这种场合，尽量拔高自己的声音，却连其中的颤抖也放大了，“你没有想到我会站出来揭发你，批判你吧！？是的，我以前受你欺骗，你用自己那反动的世界观和科学观蒙蔽了我！现在我醒悟了，在革命小将的帮助下，我要站到革命的一边，人民的一边！”她转向台下，\"同志们、革命小将们、革命的教职员工们，我们应该认清爱因斯坦相对论的反动本质，这种本质，广义相对论体现得最清楚；它提出的静态宇宙模型，否定了物质的运动本性，是反辩证法的！它认为宇宙有限，更是彻头彻尾的反动唯心主义……”\n\n　　听着妻子滔滔不绝的演讲，叶哲泰苦笑了一下。琳，我蒙蔽了你？其实你在我心中倒一直是个谜。一次，我对你父亲称赞你那过人的天资——他很幸运，去得早，躲过了这场灾难——老人家摇摇头，说我女儿不可能在学术上有什么建树；接着，他说出了对我后半生很重要的一句话：琳琳太聪明了，可是搞基础理论，不笨不行啊。\n\n　　以后的许多年里，我不断悟出这话的深意。琳，你真的太聪明了，早在几年前，你就嗅出了知识界的政治风向，做出了一些超前的举动，比如你在教学中，把大部分物理定律和参数都改了名字，欧姆定律改叫电阻定律，麦克斯韦方程改名成电磁方程，普朗克常数叫成了量子常数……你对学生们解释说：所有的科学成果都是广大劳动人民智慧的结晶，那些资产阶级学术权威不过是窃取了这些智慧。但即使这样，你仍然没有被“革命主流”所接纳，看看现在的你，衣袖上没有“革命教职员工”都戴着的红袖章；你两手空空地上来，连一本语录都没资格拿……谁让你出生在旧中国那样一个显赫的家庭，你父母又都是那么著名的学者。\n\n　　说起爱因斯坦，你比我有更多的东西需要交待。1922年冬天，爱因斯坦到上海访问，你父亲因德语很好被安排为接待陪同者之一。你多次告诉我，父亲是在爱因斯坦的亲自教诲下走上物理学之路的，而你选择物理专业又是受了父亲的影响，所以爱翁也可以看作你的间接导师，你为此感到无比的自豪和幸福。\n\n　　后来我知道，父亲对你讲了善意的谎言，他与爱因斯坦只有过一次短得不能再短的交流。那是l922年11月l3日上午，他陪爱因斯坦到南京路散步，同行的好像还有上海大学校长于右任、《大公报》经理曹谷冰等人，经过一个路基维修点，爱因斯坦在一名砸石子的小工身旁停下，默默看着这个在寒风中衣衫破烂、手脸污黑的男孩子，问你父亲：他一天挣多少钱？问过小工后，你父亲回答：五分。这就是他与改变世界的科学大师唯一的一次交流，没有物理学，没有相对论，只有冰冷的现实。据你父亲说，爱因斯坦听到他的回答后又默默地站在那里好一会儿，看着小工麻木的劳作，手里的烟斗都灭了也没有吸一口。你父亲在回忆这件事后，对我发出这样的感叹：在中国，任何超脱飞扬的思想都会砰然坠地的，现实的引力太沉重了。\n\n　　“低下头！”一名男红卫兵大声命令。这也许是自己的学生对老师一丝残存的同情，被批斗者都要低头，但叶哲泰要这样，那顶沉重的铁高帽就会掉下去，以后只要他一直低着头，就没有理由再给他戴上。但叶哲泰仍昂着头，用瘦弱的脖颈支撑着那束沉重的钢铁。\n\n　　“低头！你个反动顽固分子！！”旁边一名女红卫兵解下腰间的皮带朝叶哲泰挥去，黄铜带扣正打在他脑门上，在那里精确地留下了带扣的形状，但很快又被淤血模糊成黑紫的一团。他摇晃了一下，又站稳了。\n\n　　一名男红卫兵质问叶哲泰：“在量子力学的教学中，你也散布过大量的反动言论！”说完对绍琳点点头，示意她继续。\n\n　　绍琳迫不及待地要继续下去了，她必须不停顿地说下去，以维持自己那摇摇欲坠的精神免于彻底垮掉。“叶哲泰，这一点你是无法抵赖的！你多次向学生散布反动的哥本哈根解释！”\n\n　　“这毕竟是目前公认的最符合实验结果的解释。”叶哲泰说，在受到如此重击后，他的口气还如此从容，这让绍琳很吃惊，也很恐惧。\n\n　　“这个解释认为，是外部的观察导致了量子波函数的坍缩，这是反动唯心论的另一种表现形式，而且是一种最猖狂的表现！”\n\n　　“是哲学指引实验还是实验指引哲学？”叶哲泰问道，他这突然的反击令批判者们一时不知所措。\n\n　　“当然是正确的马克思主义哲学指引科学实验！”一名男红卫兵说。\n\n　　“这等于说正确的哲学是从天上掉下来的，这反对实践出真知，恰恰是违背马克思主义对自然界的认知原则的。”\n\n　　绍琳和两名大学红卫兵无言以对，与中学和社会上的红卫兵不同，他们不可能一点儿道理也不讲。但来自附中的四位小将自有她们“无坚不摧”的革命方式，刚才动手的那个女孩儿又狠抽了叶哲泰一皮带，另外三个女孩子也都分别抡起皮带抽了一下，当同伴革命时，她们必须表现得更革命，至少要同样革命。两名男红卫兵没有过问，他们要是现在管这事，也有不革命的嫌疑。\n\n　　“你还在教学中散布宇宙大爆炸理论，这是所有科学理论中最反动的一个！”一名男红卫兵试图转移话题。\n\n　　“也许以后这个理论会被推翻，但本世纪的两大宇宙学发现：哈勃红移和3K宇宙背景辐射，使大爆炸学说成为目前为止最可信的宇宙起源理论。”\n\n　　“胡说！”绍琳大叫起来，又接着滔滔不绝地讲起了宇宙大爆炸，自然不忘深刻地剖析其反动本质。但这理论的超级新奇吸引了四个小女孩儿中最聪明的那一个，她不由自主地问道：“连时间都是从那个奇点开始的！？那奇点以前有什么？”\n\n　　“什么都没有。”叶哲泰说，像回答任何一个小女孩儿的问题那样，他转头慈祥地看着她，铁高帽和已受的重伤，使他这动作很艰难。\n\n　　“什么……都没有？！反动！反动透顶！！”那女孩儿惊恐万状地大叫起来，她不知所措地转向绍琳寻求帮助，立刻得到了。\n\n　　“这给上帝的存在留下了位置。”绍琳对女孩儿点点头提示说。\n\n　　小红卫兵那茫然的思路立刻找到了立脚点，她举起紧握皮带的手指着叶哲泰，“你，是想说有上帝？！”\n\n　　“我不知道。”\n\n　　“你说什么！”\n\n　　“我是说不知道，如果上帝是指宇宙之外的超意识的话，我不知道它是不是存在；正反两方面，科学都没给出确实的证据。”其实，在这噩梦般的时刻，叶哲泰已倾向于相信它不存在了。\n\n　　这句大逆不道的话在整个会场引起了骚动，在台上一名红卫兵的带领下，又爆发了一波波的口号声。\n\n　　“打倒反动学术权威叶哲泰！！”\n\n　　“打倒一切反动学术权威！！”\n\n　　“打倒一切反动学说！！”\n\n　　……\n\n　　“上帝是不存在的，一切宗教，都是统治阶级编造出来的麻痹人民的精神工具！”口号平息后，那个小女孩儿大声说。\n\n　　“这种看法是片面的。”叶哲泰平静地说。\n\n　　恼羞成怒的小红卫兵立刻做出了判断，对于眼前这个危险的敌人，一切语言都无意义了。她抡起皮带冲上去，她的三个小同志立刻跟上，叶哲泰的个子很高，这四个十四岁的女孩儿只能朝上抡皮带才能打到他那不肯低下的头，在开始的几下打击后，他头上能起一定保护作用的铁高帽被打掉了，接下来带铜扣的宽皮带如雨点般打在他的头上和身上——他终于倒下了，这鼓舞了小红卫兵们，她们更加投入地继续着这“崇高”的战斗，她们在为信念而战，为理想而战，她们为历史给予自己的光辉使命所陶醉，为自己的英勇而自豪……\n\n　　“最高指示：要文斗不要武斗！”叶哲泰的两名学生终于下定了决心，喊出了这句话，两人同时冲过去，拉开了已处于半疯狂状态的四个小女孩儿。\n\n　　但已经晚了，物理学家静静地躺在地上，半睁的双眼看着从他的头颅上流出的血迹，疯狂的会场瞬间陷入了一片死寂，那条血迹是唯一在动的东西，它像一条红蛇缓慢地蜿蜒爬行着，到达台沿后一滴滴地滴在下面一个空箱子上，发出有节奏的\"哒哒\"声，像渐行渐远的脚步。\n\n　　一阵怪笑声打破了寂静，这声音是精神已彻底崩溃的绍琳发出的，听起来十分恐怖。人们开始离去，最后发展成一场大溃逃，每个人想都尽快逃离这个地方。会场很快空了下来，只剩下一个姑娘站在台下。\n\n　　她是叶哲泰的女儿叶文洁。\n\n　　当那四个女孩儿施暴夺去父亲生命时，她曾想冲上台去，但身边的两名老校工死死抓住她，并在耳边低声告诉她别连自己的命也不要了，当时会场已经处于彻底的癫狂，她的出现只会引出更多的暴徒。她曾声嘶力竭地哭叫，但声音淹没在会场上疯狂的口号和助威声中，当一切寂静下来时，她自己也发不出任何声音了，只是凝视台上父亲已没有生命的躯体，那没有哭出和喊出的东西在她的血液中弥漫、溶解，将伴她一生。人群散去后，她站在那里，身体和四肢仍保持着老校工抓着她时的姿态，一动不动，像石化了一般。过了好久，她才将悬空的手臂放下来，缓缓起身走上台，坐在父亲的遗体边，握起他的一只已凉下来的手，两眼失神地看着远方。当遗体要被抬走时，叶文洁从衣袋中拿出一样东西放到父亲的那只手中，那是父亲的烟斗。\n\n　　文洁默默地离开了已经空无一人一片狼藉的操场，走上回家的路。当她走到教工宿舍楼下时，听到了从二楼自家窗口传出的一阵阵痴笑声，这声音是那个她曾叫做妈妈的女人发出的。文洁默默地转身走去，任双脚将她带向别处。\n\n　　她最后发现自己来到了阮雯的家门前，在大学四年中，阮老师一直是她的班主任，也是她最亲密的朋友。在叶文洁读天体物理专业研究生的两年里，再到后来停课闹革命至今，阮老师一直是她除父亲外最亲近的人。阮雯曾留学剑桥，她的家曾对叶文洁充满了吸引力，那里有许多从欧洲带回来的精致的书籍、油画和唱片，一架钢琴；还有一排放在精致小木架上的欧式烟斗，父亲那只就是她送的，这些烟斗有地中海石楠根的，有土耳其海泡石的，每一个都仿佛浸透了曾将它们拿在手中和含在嘴里深思的那个男人的智慧，但阮雯从未提起过他。这个雅致温暖的小世界成为文洁逃避尘世风暴的港湾。但那是阮雯的家被抄之前的事，她在运动中受到的冲击和文洁父亲一样重，在批斗会上，红卫兵把高跟鞋挂到她脖子上，用口红在她的脸上划出许多道子，以展示她那腐朽的资产阶级生活方式。\n\n　　叶文洁推开阮雯的家门，发现抄家后混乱的房间变得整洁了，那几幅被撕的油画又贴糊好挂在墙上，歪倒的钢琴也端正地立在原位，虽然已被砸坏不能弹了，但还是擦得很干净，残存的几本精装书籍也被整齐地放回书架上……阮雯端坐在写字台前的那把转椅上，安详地闭着双眼。叶文洁站在她身边，摸摸她的额头、脸和手，都是冰凉的，其实文洁在进门后就注意到了写字台上倒放着的那个已空的安眠药瓶。她默默地站了一会儿，转身走去，悲伤已感觉不到了，她现在就像一台盖革计数仪，当置身于超量的辐射中时，反而不再有任何反应，没有声响，读数为零。但当她就要出门时，还是回过头来最后看了阮雯一眼，她发现阮老师很好地上了妆，她抹了口红，也穿上了高跟鞋。'),
(35, 1, '1', '2'),
(35, 2, 'tet', '123123'),
(35, 3, '123', '123123'),
(35, 4, '测试', '123'),
(35, 5, 'test5', '12123123123'),
(35, 6, 'test6', 'hahahaha'),
(35, 7, 'biaoti7', '123'),
(35, 8, 'test8', '在吃辣了放得开'),
(35, 9, 'try', 'try catch'),
(35, 10, 'hello,world', 'context'),
(35, 11, 'final', ' 结束了'),
(35, 12, '连载再开', '哈哈哈哈'),
(35, 13, '鹅鹅鹅饿饿', '敲敲敲去'),
(35, 14, '呆', '随意'),
(35, 15, 'Hello, world again.', 'Hello'),
(35, 16, 'real final', 'end'),
(35, 17, '删除测试', '测试'),
(35, 18, '测试2', '奥术大师多'),
(35, 19, '很气', '再来一次'),
(35, 20, '乏了', '啊啊啊啊啊啊'),
(35, 21, 'again', 'again'),
(35, 22, 'again3', 'again3'),
(35, 23, 'resetformtest1', 'resetformtest1'),
(35, 24, 'resettest2', 'resettest2'),
(35, 25, 'resettest4', 'resettest4'),
(36, 1, 'Test', 'hello, world'),
(36, 2, 'title2', 'hkjahskdjasd'),
(36, 3, '标题3', 'nothing'),
(36, 4, '跨行测试', '123');

--
-- 触发器 `bookChapters`
--
DELIMITER $$
CREATE TRIGGER `author_auto_order_chapter` AFTER INSERT ON `bookChapters` FOR EACH ROW BEGIN

   DECLARE uid varchar(16);

      SELECT author FROM book WHERE book.bid = NEW.bid INTO uid;

   INSERT INTO chapterOrder (uid, bid, chapterIndex, uuid) VALUES (uid, NEW.bid, NEW.chapterIndex, NULL);

	UPDATE bookDetail set chapters = chapters + 1 WHERE bid = new.bid;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delBookChapters` AFTER DELETE ON `bookChapters` FOR EACH ROW UPDATE bookDetail set chapters = chapters - 1 WHERE bid = old.bid
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `bookDetail`
--

CREATE TABLE `bookDetail` (
  `bid` int(11) NOT NULL,
  `chapters` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `bookDetail`
--

INSERT INTO `bookDetail` (`bid`, `chapters`, `clicks`) VALUES
(20, 6, 8369),
(21, 0, 6654),
(22, 0, 5),
(23, 0, 0),
(24, 0, 6912),
(25, 0, 42),
(30, 0, 0),
(35, 25, 0),
(36, 4, 0);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `category` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`category`) VALUES
('传记'),
('文学'),
('玄幻'),
('科学'),
('科幻'),
('纪实'),
('绘本'),
('自传'),
('言情'),
('计算机'),
('都市'),
('魔幻');

-- --------------------------------------------------------

--
-- 表的结构 `chapterOrder`
--

CREATE TABLE `chapterOrder` (
  `uid` varchar(16) NOT NULL,
  `bid` int(5) NOT NULL,
  `chapterIndex` int(5) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `chapterOrder`
--

INSERT INTO `chapterOrder` (`uid`, `bid`, `chapterIndex`, `uuid`) VALUES
('admin', 35, 17, 'dd12f9d8-4bf5-11e7-be77-52540018d8d0'),
('Patrick', 20, 5, '0f1c40e6-41f8-11e7-be77-52540018d8d0'),
('Patrick', 20, 6, '6092fc25-49df-11e7-be77-52540018d8d0'),
('Patrick', 35, 1, '7d64c575-41f5-11e7-be77-52540018d8d0'),
('Patrick', 35, 2, 'a3177305-41f5-11e7-be77-52540018d8d0'),
('Patrick', 35, 3, 'd3e8e815-41f7-11e7-be77-52540018d8d0'),
('Patrick', 35, 4, '85ff4cfa-42a4-11e7-be77-52540018d8d0'),
('Patrick', 35, 5, '8b870f72-42a4-11e7-be77-52540018d8d0'),
('Patrick', 35, 6, 'cb74c3c0-42a4-11e7-be77-52540018d8d0'),
('Patrick', 35, 7, 'd22f8912-42a4-11e7-be77-52540018d8d0'),
('Patrick', 35, 8, '0f43c2ec-42a5-11e7-be77-52540018d8d0'),
('Patrick', 35, 9, '31e83a42-42a5-11e7-be77-52540018d8d0'),
('Patrick', 35, 10, '46290196-42a5-11e7-be77-52540018d8d0'),
('Patrick', 35, 11, '768c00a8-42a5-11e7-be77-52540018d8d0'),
('Patrick', 35, 12, '815ad85d-42a5-11e7-be77-52540018d8d0'),
('Patrick', 35, 13, '0fa038c1-42a6-11e7-be77-52540018d8d0'),
('Patrick', 35, 14, '16c52aeb-42a6-11e7-be77-52540018d8d0'),
('Patrick', 35, 15, '61d050fe-42a6-11e7-be77-52540018d8d0'),
('Patrick', 35, 16, '66400175-42a6-11e7-be77-52540018d8d0'),
('Patrick', 35, 17, '819c5432-42a6-11e7-be77-52540018d8d0'),
('Patrick', 35, 18, '85a214a2-42a6-11e7-be77-52540018d8d0'),
('Patrick', 35, 19, '97452ba0-42a6-11e7-be77-52540018d8d0'),
('Patrick', 35, 20, 'dc0b2d00-42a6-11e7-be77-52540018d8d0'),
('Patrick', 35, 21, '0ea1b1ab-42a7-11e7-be77-52540018d8d0'),
('Patrick', 35, 22, '2c05c3b0-42a7-11e7-be77-52540018d8d0'),
('Patrick', 35, 23, '8c6696b5-42a7-11e7-be77-52540018d8d0'),
('Patrick', 35, 24, 'b1677a95-42a7-11e7-be77-52540018d8d0'),
('Patrick', 35, 25, 'c1812bd4-42a7-11e7-be77-52540018d8d0'),
('Patrick', 36, 1, '96663909-4214-11e7-be77-52540018d8d0'),
('Patrick', 36, 2, '2c1ac44e-42a4-11e7-be77-52540018d8d0'),
('Patrick', 36, 3, '328e8c7c-42a4-11e7-be77-52540018d8d0'),
('Patrick', 36, 4, '389480c7-42a4-11e7-be77-52540018d8d0');

--
-- 触发器 `chapterOrder`
--
DELIMITER $$
CREATE TRIGGER `generate_uuid_on_chapterOrder` BEFORE INSERT ON `chapterOrder` FOR EACH ROW BEGIN
   SET NEW.uuid = uuid();

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `favorite`
--

CREATE TABLE `favorite` (
  `uid` varchar(16) NOT NULL,
  `bid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `favorite`
--

INSERT INTO `favorite` (`uid`, `bid`) VALUES
('Patrick', 1),
('Patrick', 2),
('wjw', 2),
('Patrick', 3),
('admin', 5),
('Patrick', 5),
('Patrick', 6),
('admin', 8),
('Patrick', 8),
('admin', 9),
('admin', 11),
('admin', 12),
('Patrick', 15),
('Patrick', 18),
('Patrick', 19),
('Patrick', 35);

-- --------------------------------------------------------

--
-- 表的结构 `qidianbi`
--

CREATE TABLE `qidianbi` (
  `uid` varchar(16) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `qidianbi`
--

INSERT INTO `qidianbi` (`uid`, `balance`) VALUES
('admin', 19990),
('Patrick', 310);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `password`) VALUES
('admin', 'admin'),
('Patrick', 'Patrick'),
('wjw', 'wjw');

-- --------------------------------------------------------

--
-- 表的结构 `vip`
--

CREATE TABLE `vip` (
  `uid` varchar(16) NOT NULL,
  `expiration` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `vipOrder`
--

CREATE TABLE `vipOrder` (
  `uid` varchar(16) NOT NULL,
  `mid` varchar(16) NOT NULL,
  `generateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL,
  `uuid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `vipOrder`
--

INSERT INTO `vipOrder` (`uid`, `mid`, `generateTime`, `completed`, `money`, `uuid`) VALUES
('admin', 'qidian', '2017-05-26 11:49:30', 1, 3, '6110f8e8-4209-11e7-be77-52540018d8d0'),
('admin', 'qidian', '2017-05-27 06:00:18', 1, 2, 'c0c168dd-42a1-11e7-be77-52540018d8d0'),
('admin', 'qidian', '2017-06-08 02:54:11', 0, 1, 'b8665165-4bf5-11e7-be77-52540018d8d0'),
('Patrick', 'qidian', '2017-06-05 10:46:54', 1, 1, '47267f39-49dc-11e7-be77-52540018d8d0'),
('Patrick', 'qidian', '2017-06-05 11:06:17', 0, 1, 'fcc00f5c-49de-11e7-be77-52540018d8d0'),
('Patrick', 'qidian', '2017-06-08 02:52:12', 0, 4, '71835508-4bf5-11e7-be77-52540018d8d0'),
('Patrick', 'qidian', '2017-06-08 02:53:04', 0, 1, '903304a4-4bf5-11e7-be77-52540018d8d0'),
('Patrick', 'qidian', '2017-06-08 02:53:37', 0, 1, 'a3ca4e91-4bf5-11e7-be77-52540018d8d0'),
('Patrick', 'qidian', '2017-06-13 00:49:04', 0, 1, '12863aea-4fd2-11e7-be77-52540018d8d0');

--
-- 触发器 `vipOrder`
--
DELIMITER $$
CREATE TRIGGER `generate_uuid_on_vipOrder` BEFORE INSERT ON `vipOrder` FOR EACH ROW BEGIN
	SET NEW.uuid = uuid();

END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bankAccount`
--
ALTER TABLE `bankAccount`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `category` (`category`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `bookChapters`
--
ALTER TABLE `bookChapters`
  ADD PRIMARY KEY (`bid`,`chapterIndex`) USING BTREE;

--
-- Indexes for table `bookDetail`
--
ALTER TABLE `bookDetail`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category`);

--
-- Indexes for table `chapterOrder`
--
ALTER TABLE `chapterOrder`
  ADD PRIMARY KEY (`uid`,`bid`,`chapterIndex`) USING BTREE,
  ADD KEY `chapterOrder_ibfk_1` (`bid`,`chapterIndex`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`uid`,`bid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `bid` (`bid`);

--
-- Indexes for table `qidianbi`
--
ALTER TABLE `qidianbi`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `vip`
--
ALTER TABLE `vip`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `vipOrder`
--
ALTER TABLE `vipOrder`
  ADD PRIMARY KEY (`uid`,`generateTime`,`mid`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `bid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- 限制导出的表
--

--
-- 限制表 `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`category`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- 限制表 `bookChapters`
--
ALTER TABLE `bookChapters`
  ADD CONSTRAINT `bookChapters_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `bookDetail`
--
ALTER TABLE `bookDetail`
  ADD CONSTRAINT `bookDetail_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `chapterOrder`
--
ALTER TABLE `chapterOrder`
  ADD CONSTRAINT `chapterOrder_ibfk_1` FOREIGN KEY (`bid`,`chapterIndex`) REFERENCES `bookChapters` (`bid`, `chapterIndex`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chapterOrder_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`) ON DELETE CASCADE,
  ADD CONSTRAINT `uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE;

--
-- 限制表 `qidianbi`
--
ALTER TABLE `qidianbi`
  ADD CONSTRAINT `qidianbi_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `vip`
--
ALTER TABLE `vip`
  ADD CONSTRAINT `vip_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `vipOrder`
--
ALTER TABLE `vipOrder`
  ADD CONSTRAINT `vipOrder_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- 事件
--
CREATE DEFINER=`root`@`localhost` EVENT `delete_expired_vip` ON SCHEDULE EVERY 1 DAY STARTS '2017-05-23 22:07:08' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM vip WHERE vip.expiration < now()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
