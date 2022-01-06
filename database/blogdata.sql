-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 06, 2022 at 07:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogdata`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `author_name` varchar(55) NOT NULL,
  `author_password` varchar(255) NOT NULL,
  `author_image` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `author_name`, `author_password`, `author_image`) VALUES
(1, 'giraffe', 'b690b60b6260e68ef5855df31dce314edacd04d1036b5c67e179be434c9d7b3194c72109323f5bd828fdef44b45c9acee48ba3918096fe041abe951909c4ea36', './assets/img/giraffe.jpg'),
(2, 'elephant', 'b690b60b6260e68ef5855df31dce314edacd04d1036b5c67e179be434c9d7b3194c72109323f5bd828fdef44b45c9acee48ba3918096fe041abe951909c4ea36', './assets/img/elephant.jpg'),
(3, 'brownbear', 'b690b60b6260e68ef5855df31dce314edacd04d1036b5c67e179be434c9d7b3194c72109323f5bd828fdef44b45c9acee48ba3918096fe041abe951909c4ea36', './assets/img/brownbear.jpg'),
(4, 'penguin', 'b690b60b6260e68ef5855df31dce314edacd04d1036b5c67e179be434c9d7b3194c72109323f5bd828fdef44b45c9acee48ba3918096fe041abe951909c4ea36', './assets/img/penguin.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category_name`) VALUES
(1, 'PHP'),
(2, 'JavaScript'),
(3, 'Egyebek'),
(4, 'HTML'),
(5, 'CSS'),
(6, 'Linux');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_date` varchar(40) NOT NULL,
  `post_text` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_date`, `post_text`, `author_id`, `category_id`) VALUES
(2, 'Teszt', '2020-12-19 09:28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eu lobortis nisl, at pellentesque mauris. Morbi ex nunc, euismod ut euismod faucibus, ultrices nec enim. Maecenas ipsum nisi, posuere ac leo non, ornare mattis turpis. Praesent nisl felis, condimentum ut luctus vel, faucibus sed massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque rhoncus, magna et suscipit ultrices, ipsum enim finibus risus, et convallis purus orci quis elit. Etiam vel euismod neque. Maecenas suscipit est id dui malesuada mollis. Aliquam mattis purus lobortis eros vulputate, a feugiat ipsum maximus. Nulla faucibus molestie dui, sit amet rhoncus magna facilisis a. Morbi vestibulum massa id mauris fringilla, eu rhoncus ipsum fermentum. ', 1, 3),
(3, 'Hogyan készítsünk táblázatot HTML5-ben?', '2020-12-19 09:49', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed laoreet augue a lacus tempor, vel mollis ligula bibendum. Fusce ut magna at eros congue mattis id quis mi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac est vel nisl sodales varius in a lacus. Pellentesque ut est fringilla, euismod nulla a, laoreet enim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer aliquam pretium orci ut malesuada. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi pellentesque arcu nec dui vehicula tincidunt. In nec diam metus. Aliquam erat volutpat. ', 2, 4),
(6, 'Reszponzív weboldal készítése media query segítségével', '2021-12-19 12:18', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris tristique arcu id dolor ultrices sodales. Ut aliquam ipsum ut dolor efficitur, at maximus nulla commodo. Vestibulum suscipit nibh eget tortor congue maximus. Vestibulum efficitur leo nulla, maximus bibendum lorem cursus dictum. Nulla lectus erat, semper sit amet dui id, sollicitudin elementum erat. Ut eleifend at nisi in porta. Nullam hendrerit, metus et tempus tempus, odio erat mollis dolor, vitae euismod nisi mi non mauris. Proin purus mi, finibus vitae suscipit sit amet, varius nec ex. Aenean blandit sapien orci, at egestas felis mollis nec. Nullam vehicula blandit turpis vitae porta. Mauris varius malesuada sapien, eu cursus sem rhoncus eu. Nulla aliquam metus mi, quis gravida magna hendrerit sed. Ut turpis nisi, commodo vel pellentesque in, aliquet ut mi. Phasellus ac odio at ex fringilla ultricies sit amet non libero.&#13;&#10;&#13;&#10;Mauris dictum purus sit amet ex placerat ultrices. Donec non purus elementum, placerat tortor eget, lobortis ipsum. Phasellus mi lorem, condimentum viverra ullamcorper tempor, tincidunt ac diam. Quisque vel nulla ac ex commodo laoreet nec in orci. Curabitur eu dolor nec enim vestibulum hendrerit. Cras ut nisi nec sem eleifend sollicitudin vitae accumsan quam. Etiam nunc libero, sollicitudin quis luctus et, commodo eu massa. Phasellus urna eros, semper vitae mollis et, facilisis eget ex. Pellentesque congue dui vitae purus laoreet volutpat. In at erat tempor, commodo lorem dapibus, condimentum nulla. Sed euismod velit vitae nulla condimentum lacinia. In rhoncus quis ante sit amet sagittis. Morbi sit amet arcu eget nisi volutpat fringilla in non orci. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse sit amet purus et leo venenatis varius. Morbi cursus sollicitudin augue, in tempor nulla hendrerit sed.&#13;&#10;&#13;&#10;Duis interdum ullamcorper nisl, pretium consequat dui mollis sed. Phasellus a tortor varius, faucibus nulla sit amet, molestie nisl. Nullam vitae orci a erat sodales bibendum. Mauris elit nunc, lacinia quis nisi vitae, tincidunt dictum metus. Sed aliquam gravida metus id dictum. Donec posuere id dolor id aliquam. Nam eu eros ultrices, ultricies nulla feugiat, commodo metus. Proin pharetra mauris finibus fermentum eleifend. Donec ultricies, lacus non dapibus maximus, eros orci pulvinar arcu, a mollis sem elit ut lacus. Mauris velit elit, consequat sed sodales vel, blandit nec velit. Nam eu felis quis neque eleifend tristique et sed nunc. Etiam ante metus, consequat eu turpis ac, dictum suscipit turpis. Proin laoreet a ligula vel molestie. Maecenas nec pulvinar sem. ', 2, 5),
(7, 'Objektum-orientált programozás JavaScriptben', '2021-12-19 12:29', 'Ebben a cikkben a JavaScript-ben is használatos objektumokról lesz szó: először is megismerkedünk az objektumorientált programozás fogalmával, majd az objektumokkal. Ezekután bemutatjuk, hogy hogyan kell létrehozni egy objektumot a JavaScript-en belül, illetve azt, hogy hogyan hozhatunk létre tulajdonságokat és függvényeket, metódusokat az objektumunk számára.&#13;&#10;&#13;&#10;Az objektumorientált programozás (angolul object-oriented programming, röviden OOP) egy az objektumokra alapozott programozási elmélet vagy szemlélet. Az objektumok egységbe foglalják az adatokat és a velük kapcsolatos műveleteket. Az adatokat tulajdonságoknak, míg a műveleteket függvényeknek, illetve metódusoknak szoktuk nevezni.', 3, 2),
(8, 'A PHP programozás alapjai', '2021-12-21 18:49', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper lorem at sem efficitur eleifend. Aliquam et sapien dolor. Quisque lectus ex, placerat posuere velit ac, lacinia tempus nunc. Integer ac blandit mi, fermentum pharetra lorem. Nullam nisi augue, ornare ac tincidunt sit amet, finibus nec justo. Nulla sed magna at erat rutrum scelerisque a non odio. Aliquam quis mi nec metus lobortis faucibus. Vestibulum sollicitudin lectus eget magna posuere fermentum. Morbi non ante at est viverra mollis venenatis ut odio. Donec suscipit nisi in dolor malesuada, at dapibus urna commodo. Aliquam finibus quam sapien, in vulputate ipsum venenatis vitae. Phasellus risus lacus, tincidunt eget metus ut, blandit consectetur risus. Nam eu metus interdum, finibus ex in, ultrices turpis. Duis leo massa, tristique ut rhoncus eget, semper vel justo.&#13;&#10;&#13;&#10;Sed volutpat convallis mauris, varius finibus mi maximus nec. Nunc condimentum, diam nec porttitor dapibus, metus elit accumsan elit, hendrerit consectetur nibh elit sed nibh. Nulla venenatis ut turpis vitae cursus. Vivamus dignissim eros lorem, ac facilisis risus scelerisque nec. Nam fermentum purus ut condimentum imperdiet. Nunc massa neque, luctus quis auctor non, egestas sit amet sapien. In ac vestibulum neque. In ut risus tempor, condimentum arcu vitae, elementum ligula. Vivamus in lectus et risus consectetur volutpat. Aenean feugiat consectetur purus eu varius.&#13;&#10;&#13;&#10;Maecenas sodales interdum dolor, vitae vulputate tellus rutrum ac. Ut sit amet ipsum lacus. Aliquam eget mauris blandit, ullamcorper dui vitae, lacinia libero. Maecenas gravida lorem nec consequat tempus. Suspendisse convallis eu elit vel fringilla. Aliquam sodales mi ante, vel lacinia orci interdum in. In interdum, velit in consectetur finibus, purus libero efficitur magna, quis luctus nisi odio id ipsum. Maecenas vel dignissim mauris. Quisque accumsan posuere pellentesque. Maecenas vitae cursus dolor. Pellentesque vehicula quam ligula, pulvinar tempor dolor venenatis sed. Nam volutpat sagittis tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc eu auctor neque, eget accumsan nulla. ', 2, 1),
(9, 'Az Apache webszerver telepítése', '2021-12-21 18:57', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fringilla nisi nec mauris aliquam, nec ultricies mauris rutrum. Suspendisse potenti. In hac habitasse platea dictumst. Morbi fringilla urna leo, sit amet bibendum nulla cursus tincidunt. Cras quis augue quis ligula accumsan pretium vitae quis nibh. Vivamus eget risus sed orci sollicitudin porttitor. Ut non nunc sit amet orci auctor feugiat. Nulla commodo pellentesque dolor vel pharetra. Donec commodo, elit sodales pulvinar ornare, nisl eros ultrices enim, ac ultrices dui mi vel dolor.&#13;&#10;&#13;&#10;Praesent maximus volutpat neque. In vehicula sapien sed viverra accumsan. Etiam libero velit, malesuada et dapibus non, pretium volutpat lectus. Sed urna nisl, dictum id diam sed, facilisis viverra nibh. Proin tortor sem, ultrices a dictum nec, tincidunt at orci. Suspendisse libero magna, aliquam at est sed, malesuada rhoncus libero. Fusce sed ex sed dolor dictum viverra. Etiam vel sapien nunc.&#13;&#10;&#13;&#10;Nulla eget mollis lorem. Sed sodales vitae metus placerat ullamcorper. Quisque consectetur, tortor sed rutrum accumsan, lorem eros sodales dui, sed dictum orci nibh et sem. Etiam nibh orci, mattis vitae nisi sit amet, feugiat pretium est. Aenean accumsan facilisis ante in lacinia. Duis est mauris, sagittis eu eleifend ac, congue et ligula. Cras interdum sollicitudin tortor, ac auctor lectus blandit ut. Nam mollis consequat orci, sed pellentesque ex. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Praesent sit amet felis ac leo cursus faucibus. Vestibulum auctor sollicitudin metus vitae consequat.&#13;&#10;&#13;&#10;Mauris fermentum efficitur hendrerit. Donec fermentum, quam in viverra maximus, augue sapien sodales ex, in ultricies orci velit vitae elit. Nunc et commodo velit. Integer nec pellentesque leo. Duis felis neque, viverra non augue nec, tincidunt ultricies odio. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam dignissim orci sed aliquet porta. Vestibulum et augue sed massa cursus luctus. Nullam a lorem placerat turpis facilisis eleifend. Vestibulum dui augue, bibendum sed erat et, varius aliquet ligula. Phasellus ac nunc tellus. Donec pulvinar felis posuere justo pretium, ut auctor enim tempus. Curabitur fermentum dolor nunc, et pretium libero vestibulum vel. Nulla facilisi. In ac sagittis augue, a dapibus tellus. Mauris venenatis, massa in volutpat lobortis, odio libero posuere turpis, a accumsan dui lectus sit amet eros. ', 4, 6),
(10, 'Objektumorientált programozás PHP-ban', '2022-01-04 19:30', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer molestie mattis nunc, eu suscipit sem scelerisque in. Proin aliquam erat sed nisl tincidunt, nec vestibulum odio dictum. Phasellus at nunc sapien. Ut purus urna, finibus sit amet lacus vitae, sodales venenatis mi. Nunc sit amet consectetur turpis. Suspendisse lobortis pretium sem vel ultricies. Aliquam sollicitudin mauris id dapibus euismod. Ut turpis libero, commodo a elit maximus, sagittis facilisis nisl. Maecenas vel luctus est. Proin sollicitudin vulputate ante et efficitur.&#13;&#10;&#13;&#10;Nunc consequat semper mauris non faucibus. Fusce consequat sagittis nibh et consequat. Curabitur maximus ex at tincidunt condimentum. Quisque tristique imperdiet mauris, ac condimentum sem convallis maximus. Nulla pharetra, urna posuere pharetra pellentesque, nulla lacus congue lectus, in elementum erat erat quis lorem. Praesent et maximus mauris. Nullam nunc odio, laoreet ac laoreet a, pretium sed orci. Nam imperdiet bibendum lectus id porta.&#13;&#10;&#13;&#10;Donec vitae sodales est. Nunc commodo feugiat molestie. Fusce consequat lacus in justo viverra, sit amet feugiat urna maximus. In nec nunc commodo, gravida felis sit amet, mattis mauris. Vivamus sed elit porttitor enim mollis dapibus. Sed viverra nisl ut felis varius porttitor. Curabitur magna felis, tristique elementum varius sed, dictum ut ex. Ut velit tortor, blandit quis turpis vel, accumsan iaculis ex. Praesent odio dui, rhoncus sit amet pretium quis, placerat ut mauris. Proin ligula nisl, aliquet eu lectus quis, sollicitudin mollis magna. Mauris imperdiet feugiat ligula sed porttitor. Nullam dapibus, tortor eu efficitur fringilla, nunc mauris convallis odio, non pellentesque magna tellus eu velit. Donec venenatis ipsum vel elit venenatis malesuada. Donec interdum leo erat, sed cursus purus feugiat nec. Quisque at est purus. ', 2, 1),
(11, 'Melyik keretrendszert használjuk PHP-ban?', '2022-01-04 19:33', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse accumsan porta lectus sit amet sollicitudin. Pellentesque suscipit venenatis est a porta. Nunc odio risus, lacinia ut maximus a, facilisis non sem. Nulla facilisi. Mauris lectus orci, pulvinar fringilla gravida ut, cursus non lorem. Suspendisse libero libero, faucibus eu ornare sed, ullamcorper eu diam. Proin porttitor ultrices molestie. Quisque vel placerat purus, vitae aliquam nunc. Curabitur venenatis sem eget pharetra sagittis. Curabitur consectetur odio non neque mattis, eu efficitur magna tincidunt.&#13;&#10;&#13;&#10;Donec condimentum, justo ut ullamcorper pharetra, libero magna facilisis purus, vel faucibus metus dui eget velit. Donec vehicula magna et libero lacinia, nec faucibus nunc placerat. Aenean porta nisl ut quam feugiat, nec iaculis velit tempus. Ut at lorem pulvinar, tincidunt tellus sed, efficitur lorem. Ut malesuada pulvinar metus. Ut lacinia eros eu tincidunt feugiat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce cursus ultricies iaculis. Donec eget felis vel turpis varius auctor non sit amet mi. Ut non nisl sed odio elementum laoreet non a erat.&#13;&#10;&#13;&#10;Ut sit amet pellentesque velit. Fusce et mi imperdiet, bibendum tortor quis, commodo elit. Ut tincidunt pulvinar rutrum. Sed nec ligula et leo fermentum ultricies eu sit amet sapien. Nullam posuere sapien at laoreet tempus. Sed ornare gravida convallis. Vestibulum dignissim vulputate libero, vel rutrum orci bibendum sit amet. Quisque vel volutpat dolor, eleifend venenatis enim. Donec condimentum convallis convallis. Mauris dictum aliquet dolor eu imperdiet. Phasellus dignissim laoreet dui, id porttitor sapien luctus at.&#13;&#10;&#13;&#10;Proin sit amet laoreet odio, a tempus ligula. Duis molestie vehicula tellus, eu elementum sapien elementum sit amet. Nulla facilisis, justo sed consectetur sagittis, erat tortor accumsan augue, vel elementum mi sapien accumsan justo. Aenean iaculis justo justo, ac aliquam diam facilisis eu. Quisque dolor metus, lacinia non felis id, aliquam accumsan turpis. Morbi pellentesque pharetra dui eget porttitor. Etiam imperdiet fermentum posuere. Cras ipsum risus, eleifend sit amet aliquet at, convallis nec nisl. Pellentesque et ultricies arcu. Quisque eu urna nec arcu eleifend bibendum ut ac nibh. Donec id risus vitae ex vestibulum consectetur a imperdiet massa. Vestibulum et sem sit amet augue efficitur ornare et vitae justo. Donec laoreet urna imperdiet mollis imperdiet.&#13;&#10;&#13;&#10;Nullam euismod lacus molestie ipsum porttitor, id egestas ante congue. Nulla porta, purus nec gravida blandit, ante nulla pretium turpis, non ullamcorper sem sapien non felis. Vestibulum egestas, augue non interdum euismod, metus felis malesuada ante, vel venenatis leo lectus sit amet lorem. Mauris urna velit, hendrerit eget interdum quis, ultrices ullamcorper ipsum. Quisque elementum lacinia urna, nec fringilla nisi vulputate ac. Donec id maximus neque. Donec eu felis ut magna laoreet varius. Fusce non sapien vitae lacus suscipit sagittis vel quis enim. Suspendisse posuere massa et ante efficitur fringilla. Suspendisse ac luctus odio. Donec ac vestibulum est, quis consectetur turpis. Donec luctus tincidunt arcu, ac scelerisque justo convallis et. Donec hendrerit bibendum erat ut euismod. Sed placerat tincidunt enim vel auctor. Aenean feugiat blandit mi. ', 2, 1),
(12, 'A Bootstrap használata', '2022-01-04 19:34', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et odio vel purus scelerisque iaculis eget ut arcu. Praesent ut felis blandit, semper nisi posuere, elementum nibh. Ut molestie semper dolor, eget pretium massa auctor sit amet. Vivamus posuere nisi sit amet scelerisque congue. Phasellus porta eu tellus nec cursus. In eget faucibus felis, vitae pharetra mauris. Quisque sem nibh, faucibus eu iaculis sit amet, sagittis quis ipsum. Suspendisse potenti. Aenean nec augue sagittis, pretium turpis vel, dignissim eros. Integer enim purus, viverra quis sodales at, maximus interdum sem. Vivamus sodales, turpis sit amet cursus auctor, libero velit cursus nunc, id malesuada magna est sit amet velit.&#13;&#10;&#13;&#10;Duis sollicitudin elementum tincidunt. Curabitur nec maximus enim, vel convallis justo. Donec maximus turpis id lectus molestie, id consequat urna iaculis. Vestibulum mollis dictum ex vel tincidunt. Fusce fringilla faucibus orci a sodales. Nulla sed augue sit amet lorem dictum aliquam quis id erat. Vestibulum nec fermentum elit, sit amet vulputate turpis. Donec iaculis blandit nunc nec interdum. Donec cursus facilisis mauris. Cras semper elementum elit, sed scelerisque leo iaculis eget. Praesent condimentum sapien in tellus cursus suscipit non vitae felis. Maecenas nec lacus mauris. Pellentesque nulla velit, rutrum vel convallis vel, pretium id neque. Vestibulum a rhoncus lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vestibulum metus est, convallis at elit at, aliquet auctor neque.&#13;&#10;&#13;&#10;Nam efficitur ipsum elit, sit amet aliquam tortor semper a. Pellentesque dignissim nec velit eget iaculis. Fusce blandit mattis orci eget maximus. Aenean lorem magna, ultrices sit amet massa ut, bibendum commodo magna. Sed suscipit pellentesque augue, lobortis dignissim ante laoreet et. Donec maximus pharetra mattis. Aenean sem massa, scelerisque nec velit ut, feugiat efficitur diam.&#13;&#10;&#13;&#10;Donec eu ligula dolor. Curabitur rhoncus commodo congue. Nam vel mi rutrum, venenatis mi eu, rhoncus orci. Quisque ullamcorper eleifend commodo. Fusce luctus, lacus nec tincidunt consequat, turpis neque luctus turpis, quis vulputate quam magna eu odio. Vestibulum eu odio ac leo feugiat consectetur. In porttitor eros eget ipsum consectetur tincidunt. Donec ut nibh ultricies, rutrum est in, faucibus eros. Suspendisse ac nisi eget erat cursus tincidunt. Nam lobortis eget leo a condimentum. In in lorem sapien. Donec eget lacus vitae nisi pharetra maximus ut in nibh.&#13;&#10;&#13;&#10;Proin vitae elementum ligula, quis aliquet nisi. Fusce scelerisque dapibus felis vitae dapibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus vitae ultrices metus, aliquam lobortis nisl. Nam blandit ut ex sit amet scelerisque. Aliquam sit amet rutrum tortor. Nam sit amet eros nec dolor lobortis malesuada iaculis laoreet mi. Integer malesuada luctus faucibus. Donec sed luctus lectus. Ut rutrum risus non libero dapibus porta. Nulla fringilla sit amet massa id volutpat. Donec eu lectus nec elit vehicula blandit in quis ex. Aenean tristique rhoncus eros, et hendrerit justo varius ac. Suspendisse maximus lectus vel interdum feugiat. Etiam a rhoncus urna, sed iaculis nibh. ', 2, 3),
(13, 'A PHP 8 telepítése Ubuntura', '2022-01-05 18:31', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consectetur leo ligula, vel convallis purus auctor sed. Praesent condimentum massa at nunc condimentum, ut hendrerit lacus feugiat. Donec nec velit eu risus cursus maximus mattis nec nibh. Donec ac fringilla ex. Sed lacinia diam vitae purus accumsan, at scelerisque enim iaculis. Duis tellus augue, tincidunt in tincidunt ac, mattis eget sapien. In a venenatis leo, nec lobortis lacus. Etiam interdum metus dolor, in fringilla tortor pulvinar id. Vestibulum maximus quis diam vel consequat.&#13;&#10;&#13;&#10;Pellentesque volutpat nulla nibh, vitae finibus urna rutrum vel. Sed id gravida diam. Nunc eu quam a risus elementum porta. Phasellus et arcu dignissim, vulputate diam non, placerat neque. Vestibulum ullamcorper pharetra pellentesque. Vivamus posuere vel risus quis dignissim. Nulla facilisi.&#13;&#10;&#13;&#10;Nunc pharetra eget leo a accumsan. Sed ullamcorper varius felis dictum eleifend. Nulla egestas est ac odio rhoncus, id rhoncus nisl varius. Nullam elit nisi, bibendum non interdum non, semper ac libero. Aliquam erat volutpat. Vestibulum suscipit feugiat odio, id porta augue. Donec id porta mauris. Cras eget ornare lorem. Vivamus in tristique lacus. ', 1, 1),
(14, 'A PHP 8 újdonságai', '2022-01-05 18:33', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis neque vitae nunc consectetur condimentum. Donec eleifend, tellus sed pellentesque vulputate, libero urna auctor ipsum, id efficitur urna quam vel turpis. Integer semper pellentesque nulla et malesuada. Aenean varius diam nibh, et blandit leo scelerisque nec. Aliquam eleifend leo vitae diam dignissim interdum. Maecenas iaculis vulputate nunc. In massa tellus, euismod id euismod ut, gravida a nulla. Proin volutpat quam nec cursus lobortis. Nulla dapibus dui nibh, non pretium mi pharetra ut. In hac habitasse platea dictumst. Mauris tristique, elit ullamcorper aliquet varius, turpis diam ultricies metus, quis commodo elit lectus quis tortor. Curabitur maximus sed nulla nec pharetra. Ut purus neque, tristique at tincidunt ac, commodo sit amet libero. Aenean tempus magna non enim cursus, nec hendrerit neque eleifend. In hac habitasse platea dictumst. Donec tincidunt luctus odio, eget malesuada nunc feugiat id.&#13;&#10;&#13;&#10;Phasellus sodales vehicula tortor ac fermentum. Aliquam erat volutpat. Morbi vestibulum varius arcu, sed eleifend neque. Nam venenatis eleifend ligula, a pharetra elit pharetra in. Suspendisse pulvinar est tellus, id cursus felis pretium suscipit. Integer arcu neque, consequat in odio nec, dapibus viverra nisi. Vivamus accumsan lobortis condimentum. Aliquam massa tellus, fringilla ac ipsum sit amet, facilisis vehicula ligula. Integer eu aliquet sem. Proin non ullamcorper odio, at egestas tortor. Pellentesque efficitur sed leo eget porttitor. In ultricies mauris vel sapien congue, in ultrices urna sollicitudin. Proin aliquet lacinia mauris nec elementum. Mauris in leo molestie, commodo nulla quis, pellentesque arcu. Pellentesque libero augue, dictum nec egestas ut, porttitor a dolor. Phasellus in nunc porta, tristique nisl eget, volutpat libero.&#13;&#10;&#13;&#10;Vivamus luctus mi eget lacus consectetur, ut elementum metus volutpat. Praesent blandit at mauris ac efficitur. Duis quis convallis felis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed blandit sed dolor vestibulum commodo. Cras pretium, nisl id fringilla ornare, enim massa mattis mi, at lacinia purus nulla in dui. Fusce sed maximus ligula. Aliquam rhoncus maximus pellentesque. Ut vel enim neque. Mauris vehicula odio in nisi pretium, at tristique ante fermentum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.&#13;&#10;&#13;&#10;Curabitur sit amet suscipit risus, fringilla posuere dolor. Curabitur vitae leo sit amet dolor pellentesque sollicitudin. Ut volutpat eu turpis vitae viverra. Duis consequat tellus ligula, quis aliquet ante gravida id. Nunc cursus aliquet lacus, sit amet lacinia eros imperdiet at. Phasellus arcu erat, euismod egestas est a, aliquam egestas ligula. Proin sodales enim nisl, porttitor elementum nisl mollis et. Aliquam semper sollicitudin condimentum. Vivamus fringilla magna vitae euismod aliquet. Pellentesque vitae vehicula quam, convallis semper eros. Sed nunc massa, rhoncus ac leo eget, dictum egestas ligula. Suspendisse potenti. Mauris lobortis convallis magna.&#13;&#10;&#13;&#10;Quisque eget gravida nisi. Curabitur sagittis odio id arcu vulputate sollicitudin. Aliquam vitae nibh elit. Donec urna lacus, lacinia id efficitur in, imperdiet sed mi. Nullam ac malesuada eros. Proin tincidunt ipsum ut convallis porta. Fusce pretium risus in neque sagittis commodo. Quisque eu vulputate lorem, id gravida est. Phasellus consectetur metus est, vitae elementum arcu ultrices id. Suspendisse nunc lorem, pharetra nec tincidunt et, congue quis orci. ', 3, 1),
(15, 'Mellesleg Arch Linuxot használok', '2022-01-06 19:26', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nunc nisl, posuere non neque convallis, interdum sagittis felis. Nunc at augue id nunc hendrerit lacinia iaculis non ipsum. Donec faucibus magna ex, ut consequat nibh tincidunt consectetur. Suspendisse vel egestas enim. Fusce fringilla, lacus non varius placerat, neque lorem posuere magna, a semper turpis mauris ut nulla. Phasellus egestas consectetur pretium. Sed gravida justo sit amet lorem vestibulum porta eget vitae sapien. Cras urna tortor, semper sit amet pulvinar non, ullamcorper ac metus. Morbi tortor metus, cursus ut rutrum ac, laoreet et nibh. Phasellus in quam eget tortor porta egestas. Vestibulum in orci luctus, dictum magna nec, finibus ex. Pellentesque pulvinar rhoncus ipsum sed pellentesque. Cras mattis lectus dolor, sit amet sodales leo eleifend vitae. Integer in congue lectus. Integer eu tempus ex. Maecenas imperdiet sollicitudin arcu, sed aliquam est euismod ut.&#13;&#10;&#13;&#10;Sed eu efficitur diam. Maecenas vel lacus at ante vehicula congue at vitae magna. Vivamus bibendum dui vitae ante vulputate, eu condimentum nunc pellentesque. Phasellus faucibus ipsum at odio fringilla, in tincidunt diam volutpat. Duis molestie sem id elementum maximus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean vel magna sit amet orci egestas interdum. Etiam et pretium libero. Duis aliquam finibus consequat. Sed turpis ipsum, finibus vitae ipsum vel, mattis dignissim ipsum. Duis non nunc mauris.&#13;&#10;&#13;&#10;Mauris sed nisl in magna vehicula iaculis eu eu leo. Duis at tortor ultrices, pretium arcu eu, gravida tortor. Curabitur dignissim nunc id massa venenatis, in venenatis risus eleifend. Vivamus mi eros, vehicula at urna tempor, malesuada porttitor erat. Curabitur pharetra ac nulla nec molestie. Maecenas et nisi massa. Ut vel dignissim odio. Ut rutrum mi eros, at venenatis leo hendrerit vel. Duis sed sem elit. ', 4, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
