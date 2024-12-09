-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: login_regyster_system
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(120) NOT NULL,
  `admin_email` varchar(120) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_date` datetime NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'Duda','duda@30.com','Dudalinda123@','2024-08-27 11:40:49'),(2,'Sara','sara@30.com','Saralinda123@','2024-08-27 11:40:49'),(3,'Eric','gregroio@gregorio.com','FR$5tghy6','2024-12-05 11:46:19'),(4,'Eric','gregorio@gregorio.com','FR$5tghy6','2024-12-05 11:47:29');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comment_content` longtext,
  `users_user_id` int NOT NULL,
  `posts_post_id` int NOT NULL,
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comments_users1_idx` (`users_user_id`),
  KEY `fk_comments_posts1_idx` (`posts_post_id`),
  CONSTRAINT `fk_comments_posts1` FOREIGN KEY (`posts_post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'sdfgsdfg sdfgsdfg sdfgsdfgsdfg',4,9,'2024-12-09 17:25:54'),(2,'aerywertywsdhy',1,9,'2024-12-09 17:46:34'),(3,'wrestysdtyh',1,9,'2024-12-09 17:47:05'),(4,'sdfghfsdhgfdgsh',1,9,'2024-12-09 17:47:18'),(5,'adsfgdsfgdgf',1,9,'2024-12-09 17:50:29'),(6,'sdfgsdfgsdfghghhhhhhsdfghsdfhgdsfgsdfgsdfgsdfgsdfg',1,9,'2024-12-09 17:51:01'),(7,'zdfgadsfgsdgsadf',1,9,'2024-12-09 17:56:25'),(8,'asdfasfdgasgf',1,9,'2024-12-09 17:57:47'),(9,'awerytweryqweryhwetuwretl;ewkjgh;ledwkgfjh;lsdkjgh;lksjdgf;lkhjds;lkgjljsdhlfgkjhdws',1,9,'2024-12-09 17:58:41'),(10,'asfdgasfgasdfg',1,9,'2024-12-09 18:05:18'),(11,'Criando comentario',1,9,'2024-12-09 18:05:57');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `page_title` varchar(180) NOT NULL,
  `page_status` tinyint NOT NULL,
  `page_content` longtext NOT NULL,
  `page_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position_position_id` int NOT NULL,
  PRIMARY KEY (`page_id`),
  KEY `fk_pages_position_idx` (`position_position_id`),
  CONSTRAINT `fk_pages_position` FOREIGN KEY (`position_position_id`) REFERENCES `position` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,'Conheça um pouco mais sobre Ansiedade',1,'<div class=\"content-artigo\">\r\n<div id=\"artigo\" class=\"artigo\">\r\n<h1><span style=\"font-family: impact, sans-serif; color: #236fa1; font-size: 24pt;\">Oque &eacute; a ansiedade?</span></h1>\r\n<p style=\"text-align: left;\"><span style=\"font-size: 14pt; font-family: \'book antiqua\', palatino, serif;\">Ansiedade &eacute; aquela sensa&ccedil;&atilde;o de nervosismo e preocupa&ccedil;&atilde;o que a gente sente em momentos de estresse. </span></p>\r\n<p style=\"text-align: left;\"><span style=\"font-size: 14pt; font-family: \'book antiqua\', palatino, serif;\">Todo mundo fica ansioso de vez em quando, mas se isso se torna frequente e atrapalha sua vida, pode ser um sinal de que algo mais s&eacute;rio est&aacute; acontecendo.</span></p>\r\n<p style=\"text-align: left;\">&nbsp;</p>\r\n<p><span style=\"font-size: 12pt;\"><img style=\"float: right;\" src=\"/1733315804594-124750632_images.jpg\" alt=\"\" width=\"472\" height=\"314\"></span></p>\r\n<p><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">Algumas coisas podem contribuir para a ansiedade, como:</span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>1. Gen&eacute;tica:</strong> Se algu&eacute;m na sua fam&iacute;lia j&aacute; teve problemas de ansiedade, voc&ecirc;&nbsp;</span><span style=\"font-family: \'book antiqua\', palatino, serif;\">pode estar mais propenso a isso.</span></span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>2. Qu&iacute;mica do C&eacute;rebro:</strong> &Agrave;s vezes, o c&eacute;rebro n&atilde;o est&aacute; equilibrado, e isso afeta </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">seu humor.</span></span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>3. Situa&ccedil;&otilde;es Estressantes:</strong> Problemas no trabalho, grana curta ou mudan&ccedil;as&nbsp;</span><span style=\"font-family: \'book antiqua\', palatino, serif;\">na vida podem ser gatilhos.</span></span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>4. Pensamentos Negativos: </strong>Se voc&ecirc; tende a se preocupar demais ou ver o&nbsp;</span><span style=\"font-family: \'book antiqua\', palatino, serif;\">lado negativo das coisas, isso pode piorar a ansiedade.</span></span></p>\r\n<p><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">Quais s&atilde;o os sinais?</span></p>\r\n<p><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">Os sinais de ansiedade podem variar, mas alguns dos mais comuns s&atilde;o:</span><br><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">● Preocupa&ccedil;&atilde;o excessiva com coisas do dia a dia</span><br><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">● Sensa&ccedil;&atilde;o de que algo ruim est&aacute; prestes a acontecer</span><br><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">● Dificuldade para relaxar</span><br><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">● Dificuldade de concentra&ccedil;&atilde;o</span><br><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">● Sintomas f&iacute;sicos, como cora&ccedil;&atilde;o acelerado ou tens&atilde;o muscular</span></p>\r\n<p><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">Como &eacute; feito o diagn&oacute;stico?</span><br><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\">Os profissionais de sa&uacute;de mental normalmente diagnosticam a ansiedade </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">conversando com voc&ecirc; e, &agrave;s vezes, usando question&aacute;rios para entender&nbsp;</span></span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\">como voc&ecirc; </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">est&aacute; se sentindo e como isso est&aacute; afetando sua vida.</span></span></p>\r\n<p><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">Como tratar?</span><br><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>1. Terapia:</strong> Conversar com um terapeuta pode ajudar bastante. A terapia </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">cognitivo-comportamental (TCC) &eacute; bem eficaz.</span></span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>2. Rem&eacute;dios:</strong> Antidepressivos e ansiol&iacute;ticos podem ser &uacute;teis para controlar os&nbsp;</span><span style=\"font-family: \'book antiqua\', palatino, serif;\">sintomas.</span></span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>3. Mudan&ccedil;as no Dia a Dia: </strong>Exercitar-se, comer bem e relaxar com medita&ccedil;&atilde;o&nbsp;</span><span style=\"font-family: \'book antiqua\', palatino, serif;\">ou t&eacute;cnicas de respira&ccedil;&atilde;o podem fazer uma grande diferen&ccedil;a.</span></span></p>\r\n<p><span style=\"font-size: 12pt;\"><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>4. Apoio dos Amigos e Fam&iacute;lia:</strong> Ter pessoas queridas por perto &eacute; essencial&nbsp;</span><span style=\"font-family: \'book antiqua\', palatino, serif;\">para se sentir mais seguro.</span></span></p>\r\n<button>Continuar Lendo</button></div>\r\n</div>','2024-12-06 11:20:51',4),(3,'Conheça um pouco mais sobre Depressão',1,'<div class=\"content-artigo\">\r\n<div id=\"artigo\" class=\"artigo\">\r\n<h1><span style=\"font-family: impact, sans-serif; color: #236fa1; font-size: 24pt;\">Oque &eacute; a Depress&atilde;o?</span></h1>\r\n<p style=\"text-align: left;\"><span style=\"font-family: \'book antiqua\', palatino, serif; font-size: 14pt;\">A depress&atilde;o &eacute; um estado de humor complicado, onde a pessoa se sente muito triste e perde o interesse em tudo, at&eacute; nas coisas que costumava gostar. N&atilde;o &eacute; s&oacute; um dia</span><br><span style=\"font-family: \'book antiqua\', palatino, serif; font-size: 14pt;\">ruim, &eacute; uma condi&ccedil;&atilde;o s&eacute;ria que precisa de aten&ccedil;&atilde;o.</span></p>\r\n<p style=\"text-align: left;\"><span style=\"font-family: \'book antiqua\', palatino, serif; font-size: 14pt;\"><img style=\"float: right;\" src=\"/1733315800070-701499688_download_(1).jpg\" alt=\"\" width=\"414\" height=\"275\"></span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Fatores que podem levar &agrave; depress&atilde;o, como:</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>1. Gen&eacute;tica: </strong>Se algu&eacute;m na sua fam&iacute;lia j&aacute; teve depress&atilde;o, voc&ecirc; pode estar mais suscet&iacute;vel.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>2. Mudan&ccedil;as Qu&iacute;micas:</strong> &Agrave;s vezes, os neurotransmissores do c&eacute;rebro, como serotonina e dopamina, est&atilde;o desregulados, afetando seu humor.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>3. Estresse da Vida: </strong>Coisas dif&iacute;ceis, como a perda de algu&eacute;m querido ou problemas financeiros, podem desencadear a depress&atilde;o.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>4. Padr&otilde;es de Pensamento:</strong> Pensar de forma negativa ou ter experi&ecirc;ncias ruins na inf&acirc;ncia pode aumentar o risco.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Quais s&atilde;o os sinais?</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Os sintomas podem variar bastante, mas geralmente incluem:</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Sentir-se triste ou vazio por um longo tempo</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Perder o interesse nas coisas que voc&ecirc; gostava</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Fadiga e falta de energia</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Dificuldade para se concentrar</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Altera&ccedil;&otilde;es no apetite ou no peso</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Problemas para dormir (dormir demais ou de menos)</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Sensa&ccedil;&atilde;o de culpa ou inutilidade</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Pensamentos sobre suic&iacute;dio</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Como &eacute; feito o diagn&oacute;stico?</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">Os profissionais de sa&uacute;de mental fazem o diagn&oacute;stico conversando com voc&ecirc; e, &agrave;s vezes, usando question&aacute;rios para entender como voc&ecirc; est&aacute; se sentindo e como</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">isso est&aacute; afetando sua vida.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Como tratar?</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">A boa not&iacute;cia &eacute; que a depress&atilde;o tem tratamento! Aqui est&atilde;o algumas op&ccedil;&otilde;es:</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>1. Terapia:</strong> Conversar com um terapeuta pode ajudar muito. A terapia</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">cognitivo-comportamental (TCC) &eacute; uma das mais usadas.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>2. Rem&eacute;dios: </strong>Antidepressivos podem equilibrar os neurotransmissores e ajudar</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">a aliviar os sintomas.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>3. Mudan&ccedil;as no Dia a Dia:</strong> Exerc&iacute;cios, uma alimenta&ccedil;&atilde;o melhor e t&eacute;cnicas de</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">relaxamento podem fazer uma grande diferen&ccedil;a.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>4. Apoio dos Amigos e Fam&iacute;lia: </strong>Ter pessoas queridas por perto &eacute; fundamental</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">para a recupera&ccedil;&atilde;o.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">Se voc&ecirc; ou algu&eacute;m que voc&ecirc; conhece est&aacute; lidando com a depress&atilde;o, buscar</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">ajuda profissional &eacute; super importante. A recupera&ccedil;&atilde;o &eacute; poss&iacute;vel, e com o tratamento</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">certo, &eacute; poss&iacute;vel levar uma vida mais feliz e plena.</span></p>\r\n<button>Continuar Lendo</button></div>\r\n</div>','2024-12-06 13:15:46',4),(4,'Conheça um pouco mais sobre TDAH',1,'<div class=\"content-artigo\">\r\n<div id=\"artigo\" class=\"artigo\">\r\n<h1><span style=\"font-family: impact, sans-serif; color: #236fa1; font-size: 24pt;\">Oque &eacute; TDAH?</span></h1>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif; font-size: 14pt;\">O Transtorno do D&eacute;ficit de Aten&ccedil;&atilde;o e Hiperatividade (TDAH) &eacute; uma condi&ccedil;&atilde;o que pode atingir tanto crian&ccedil;as quanto adultos. Basicamente, quem tem TDAH pode ter dificuldade para se concentrar, pode ser hiperativo e agir de forma impulsiva. Isso pode complicar a rotina, o desempenho na escola ou trabalho e at&eacute; os relacionamentos.</span></p>\r\n<p><img style=\"float: right;\" src=\"/1733315787045-123299967_images_(1).jpg\" alt=\"\" width=\"324\" height=\"208\"></p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Os sintomas do TDAH costumam ser divididos em tr&ecirc;s tipos:</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>1. Desaten&ccedil;&atilde;o</strong>: Dificuldade para focar, esquecer compromissos e n&atilde;o seguir </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">bem as instru&ccedil;&otilde;es.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>2. Hiperatividade:</strong> Agita&ccedil;&atilde;o, dificuldade para ficar parado, falar demais e ter </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">problemas em esperar a sua vez.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>3. Impulsividade: </strong>Tomar decis&otilde;es sem pensar muito, interromper os outros e&nbsp;</span><span style=\"font-family: \'book antiqua\', palatino, serif;\">n&atilde;o saber esperar.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">As causas do TDAH ainda n&atilde;o est&atilde;o totalmente claras, mas parece que a </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">gen&eacute;tica, o ambiente e algumas quest&otilde;es neurol&oacute;gicas influenciam. Tem muitos</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">casos em fam&iacute;lias, ent&atilde;o a hereditariedade &eacute; um fator importante.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">Para diagnosticar TDAH, os profissionais usam crit&eacute;rios cl&iacute;nicos, observa&ccedil;&otilde;es e </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">relatos de pais e professores. N&atilde;o existe um exame espec&iacute;fico que possa confirmar</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">o TDAH, por isso &eacute; importante fazer uma avalia&ccedil;&atilde;o completa.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">O tratamento pode envolver:</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Medicamentos:</strong> Normalmente, s&atilde;o usados estimulantes, como metilfenidato</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">e anfetaminas, que ajudam a melhorar a concentra&ccedil;&atilde;o e controlar a </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">hiperatividade. Tamb&eacute;m existem op&ccedil;&otilde;es n&atilde;o estimulantes.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Terapia Comportamental:</strong> A terapia pode ajudar a desenvolver habilidades </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">sociais e de organiza&ccedil;&atilde;o, al&eacute;m de dar estrat&eacute;gias para lidar com a </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">impulsividade.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Educa&ccedil;&atilde;o e Apoio: </strong>A fam&iacute;lia e a escola t&ecirc;m um papel importante. Programas </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">de interven&ccedil;&atilde;o podem ser criados para ajudar a adaptar o ambiente escolar e</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">social.</span></p>\r\n<button>Continuar Lendo</button></div>\r\n</div>','2024-12-06 13:25:04',4),(5,'Conheça um pouco mais sobre Transtornos Alimentares',1,'<div class=\"content-artigo\">\r\n<div id=\"artigo\" class=\"artigo\">\r\n<h1><span style=\"font-family: impact, sans-serif; font-size: 24pt; color: #236fa1;\">Oque &eacute; t.a (transtorno alimentar?)</span></h1>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif; font-size: 14pt;\">Os transtornos alimentares s&atilde;o problemas s&eacute;rios que afetam a forma como&nbsp;algu&eacute;m v&ecirc; a comida e o pr&oacute;prio corpo. Eles podem ter um grande impacto na sa&uacute;de f&iacute;sica e mental. Vamos dar uma olhada nos tipos mais comuns e em como lidar com&nbsp;eles.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif; font-size: 14pt;\"><img style=\"float: right;\" src=\"/1733315794797-537858878_download_(3).jpg\" alt=\"\" width=\"332\" height=\"332\"></span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Tipos Comuns de Transtornos Alimentares</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>1. Anorexia Nervosa:</strong> Isso acontece quando a pessoa restringe muito a </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">alimenta&ccedil;&atilde;o e se preocupa demais com o peso e a apar&ecirc;ncia. Muitas vezes,</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">quem tem anorexia se v&ecirc; como acima do peso, mesmo estando bem abaixo </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">do ideal.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>2. Bulimia Nervosa:</strong> Esse transtorno envolve comer muito em um curto per&iacute;odo </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">e, em seguida, tentar eliminar a comida de alguma forma, seja vomitando,</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">usando laxantes ou se exercitando em excesso. As pessoas costumam sentir </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">culpa e vergonha ap&oacute;s esses epis&oacute;dios.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>3. Transtorno da Compuls&atilde;o Alimentar:</strong> Aqui, a pessoa come em excesso, </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">mas n&atilde;o faz nada para &ldquo;compensar&rdquo; isso, como na bulimia. Muitas vezes,</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">elas se sentem envergonhadas por comer tanto, mesmo quando n&atilde;o est&atilde;o </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">com fome.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>4. Pica:</strong> Isso &eacute; quando algu&eacute;m come coisas n&atilde;o alimentares, como terra ou </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">papel. &Eacute; mais comum em crian&ccedil;as, mas tamb&eacute;m pode acontecer em outras</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">situa&ccedil;&otilde;es.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>5. Ortorexia:</strong> Embora n&atilde;o seja oficialmente reconhecida, a ortorexia &eacute; uma </span><span style=\"font-family: \'book antiqua\', palatino, serif;\">obsess&atilde;o por comer apenas alimentos saud&aacute;veis, levando a pessoa a excluir</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">muitos outros tipos de comida.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">Os transtornos alimentares podem surgir por v&aacute;rios motivos:</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Gen&eacute;ticos:</strong> Algumas pessoas podem ter uma predisposi&ccedil;&atilde;o gen&eacute;tica.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Psicol&oacute;gicos:</strong> Quest&otilde;es como baixa autoestima e ansiedade podem</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">contribuir.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Sociais e Culturais: </strong>Press&otilde;es da sociedade e padr&otilde;es de beleza podem</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">afetar a forma como algu&eacute;m v&ecirc; o pr&oacute;prio corpo.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">Sinais de Alerta</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">Fique atento a alguns sinais que podem indicar um transtorno alimentar:</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Mudan&ccedil;as bruscas de peso.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Preocupa&ccedil;&atilde;o excessiva com dietas e exerc&iacute;cios.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Evitar refei&ccedil;&otilde;es ou sair para comer.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Isolamento social e mudan&ccedil;as de comportamento.</span><br><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">O tratamento geralmente envolve:</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Terapia:</strong> A terapia cognitivo-comportamental (TCC) &eacute; uma abordagem</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">comum que ajuda a pessoa a mudar a forma como pensa e se comporta em</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">rela&ccedil;&atilde;o &agrave; comida e &agrave; imagem corporal.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Medicamentos:</strong> &Agrave;s vezes, antidepressivos ou outros rem&eacute;dios podem ser</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">usados para ajudar a lidar com sintomas.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Nutri&ccedil;&atilde;o:</strong> Trabalhar com nutricionistas pode ajudar a restabelecer uma</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">alimenta&ccedil;&atilde;o saud&aacute;vel e uma rela&ccedil;&atilde;o mais positiva com a comida.</span></p>\r\n<br>\r\n<p>&nbsp;</p>\r\n<button>Continuar Lendo</button></div>\r\n</div>','2024-12-06 13:30:37',4),(6,'Conheça um pouco mais sobre Transtorno Bipolar',1,'<div class=\"content-artigo\">\r\n<div id=\"artigo\" class=\"artigo\">\r\n<h1><span style=\"font-family: impact, sans-serif; color: #236fa1; font-size: 24pt;\">Oque &eacute; transtorno bipolar?</span></h1>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif; font-size: 14pt;\">O transtorno bipolar &eacute; uma condi&ccedil;&atilde;o de sa&uacute;de mental que faz com que a&nbsp;pessoa tenha mudan&ccedil;as extremas de humor. Isso significa que ela pode passar de&nbsp;momentos de euforia (mania ou hipomania) para per&iacute;odos de depress&atilde;o. Essas&nbsp;oscila&ccedil;&otilde;es podem afetar o dia a dia e as rela&ccedil;&otilde;es pessoais.</span></p>\r\n<p><img style=\"float: right;\" src=\"/1733315791611-874812738_download_(5).jpg\" alt=\"\" width=\"318\" height=\"223\"></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Tipos de Transtorno Bipolar</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>1. Transtorno Bipolar Tipo I:</strong> Aqui, a pessoa tem epis&oacute;dios man&iacute;acos que duram pelo menos uma semana, muitas vezes seguidos de epis&oacute;dios</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">depressivos. Os epis&oacute;dios de mania podem ser t&atilde;o intensos que a pessoa&nbsp;pode precisar de hospitaliza&ccedil;&atilde;o.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>2. Transtorno Bipolar Tipo II:</strong> Neste tipo, a pessoa tem epis&oacute;dios de hipomania&nbsp;(menos intensa que a mania) e depress&atilde;o. Embora a depress&atilde;o possa ser</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">bem severa, a hipomania n&atilde;o chega a ser t&atilde;o grave quanto na Tipo I.</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>3. Ciclomania:</strong> Envolve mudan&ccedil;as de humor mais leves, mas que duram mais&nbsp;tempo, com per&iacute;odos de hipomania e depress&atilde;o que duram pelo menos dois</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">anos (um ano em crian&ccedil;as e adolescentes).</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Sintomas</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Mania/Hipomania:</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Energia alta e muita atividade.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Euforia ou irritabilidade.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Menos necessidade de dormir.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Fala r&aacute;pido e muitas ideias ao mesmo tempo.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">● Comportamentos impulsivos, como gastar demais ou tomar decis&otilde;es</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">arriscadas.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Causas</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">As causas do transtorno bipolar n&atilde;o s&atilde;o totalmente claras, mas acredita-se que sejam uma mistura de fatores gen&eacute;ticos, bioqu&iacute;micos e ambientais. Ter algu&eacute;m na</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">fam&iacute;lia com transtornos de humor pode aumentar o risco.</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Diagn&oacute;stico</span></p>\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">O diagn&oacute;stico &eacute; feito por um profissional de sa&uacute;de mental, que avalia os sintomas e</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">o hist&oacute;rico da pessoa. N&atilde;o existe um exame &uacute;nico que confirme o transtorno bipolar.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">Tratamento</span></p>\r\n<p><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">O tratamento normalmente combina:</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Medicamentos:</strong> Estabilizadores de humor, antipsic&oacute;ticos e antidepressivos</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">podem ser usados para ajudar a controlar os sintomas.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Terapia: </strong>A terapia cognitivo-comportamental (TCC) e outras abordagens</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">ajudam a pessoa a entender melhor sua condi&ccedil;&atilde;o e a encontrar formas de</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">lidar com isso.</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\"><strong>● Educa&ccedil;&atilde;o e Apoio:</strong> Saber mais sobre o transtorno e contar com uma rede de</span><br><span style=\"font-family: \'book antiqua\', palatino, serif;\">apoio, como grupos de ajuda, pode ser super &uacute;til.</span></p>\r\n<button>Continuar Lendo</button></div>\r\n</div>','2024-12-06 13:39:09',4),(8,'home',1,'<div class=\"content-post\">\r\n<div class=\"article-post\">\r\n<div class=\"img-post\"><img src=\"/1733489357746-89495627_7192150-duas-pessoas-conversando-sobre-problemas-de-saude-mental-vetor.jpg\" alt=\"\" width=\"626\" height=\"493\"></div>\r\n<div class=\"img-post\">&nbsp;</div>\r\n<div class=\"img-post\"><span style=\"font-size: 12pt; font-family: \'book antiqua\', palatino, serif;\">Somos um site dedicado a oferecer apoio mental, fornecendo artigos e recursos &uacute;teis. Embora n&atilde;o sejamos profissionais da &aacute;rea, nosso objetivo &eacute; ajudar voc&ecirc; a encontrar informa&ccedil;&otilde;es e ferramentas que promovam o bem-estar emocional.</span></div>\r\n</div>\r\n<div class=\"article-post\">\r\n<div class=\"img-post\"><img src=\"/1733489361535-928500633_m&Atilde;&pound;e-dando-suporte-emocional-para-filha-regula&Atilde;&sect;&Atilde;&pound;o-emocional-como-pais-ajudam-filhos-lidar-com-as-emo&Atilde;&sect;&Atilde;&micro;es.png\" alt=\"\"></div>\r\n<div class=\"img-post\">&nbsp;</div>\r\n<div class=\"desc\"><a href=\"#\">\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Nosso site &eacute; um espa&ccedil;o seguro onde voc&ecirc; pode compartilhar seus pensamentos e sentimentos.&nbsp; Sinta-se &agrave; vontade para explorar nossos artigos e encontrar o que pode fazer a diferen&ccedil;a para voc&ecirc;.</span></p>\r\n</a></div>\r\n</div>\r\n<div class=\"article-post\">\r\n<div class=\"img-post\"><img src=\"/1733489365102-641834542_image-from-rawpixel-id-469985-jpeg.jpg\" alt=\"\" width=\"624\" height=\"499\"></div>\r\n<div class=\"img-post\">&nbsp;</div>\r\n<div class=\"desc\"><a href=\"#\">\r\n<p><span style=\"font-family: \'book antiqua\', palatino, serif;\">Baseado nas publica&ccedil;&otilde;es e no feedback recebido, estamos constantemente atualizando nossos artigos para oferecer conte&uacute;dos cada vez mais relevantes e &uacute;teis. Nosso objetivo &eacute; garantir que voc&ecirc; encontre informa&ccedil;&otilde;es atualizadas e de apoio para seu bem-estar mental.</span></p>\r\n</a></div>\r\n</div>\r\n</div>','2024-12-06 14:04:46',5);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) NOT NULL,
  `position_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (4,'Artigos','2024-12-03 12:22:09'),(5,'Home text one','2024-12-04 12:25:28'),(6,'Home','2024-12-04 13:53:24');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL,
  `post_content` longtext NOT NULL,
  `post_slug` varchar(255) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `users_user_id` int NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_posts_users1_idx` (`users_user_id`),
  CONSTRAINT `fk_posts_users1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (8,'Meu Primeiro Post','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed molestie a lacus eget mollis. Duis pharetra lacinia magna eget finibus. Curabitur suscipit dignissim mi, et luctus elit lacinia sit amet. Mauris ut dui at lectus tempus aliquam. Vestibulum sed elit facilisis, dapibus justo vel, rhoncus mauris. Nulla porttitor aliquam cursus. Quisque vehicula mi ut suscipit finibus. Aliquam erat volutpat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\r\n\r\nSed sit amet lacus ante. Nulla eget imperdiet lacus. Suspendisse rutrum ante at magna lobortis, nec iaculis neque ultrices. Maecenas ultricies enim tempor, convallis quam at, sodales nisl. Sed in sapien pharetra, consectetur purus eleifend, semper magna. Maecenas commodo sodales lacus, vestibulum tincidunt dolor posuere nec. Suspendisse efficitur libero lectus, in rhoncus metus lobortis sed. Cras tincidunt eros sapien, vitae faucibus ligula efficitur vitae.','Meu-Primeiro-Post','2024-12-09 12:28:10',2),(9,'teste','olá\r\n                        ','teste','2024-12-09 13:20:06',4);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_images`
--

DROP TABLE IF EXISTS `user_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_images` (
  `user_image_id` int NOT NULL AUTO_INCREMENT,
  `user_image_name` varchar(255) NOT NULL,
  `user_image_data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_images`
--

LOCK TABLES `user_images` WRITE;
/*!40000 ALTER TABLE `user_images` DISABLE KEYS */;
INSERT INTO `user_images` VALUES (1,'/1732024473103-623834979_tranca.jfif','2024-11-19 13:54:33'),(2,'/1732024596817-291379261__Plano_de_aÃ§Ã£o_(2).png','2024-11-19 13:56:36'),(3,'/1732024637980-414085239_download.jpg','2024-11-19 13:57:17'),(4,'/1733315787045-123299967_images_(1).jpg','2024-12-04 12:36:27'),(5,'/1733315791611-874812738_download_(5).jpg','2024-12-04 12:36:31'),(6,'/1733315794797-537858878_download_(3).jpg','2024-12-04 12:36:34'),(7,'/1733315800070-701499688_download_(1).jpg','2024-12-04 12:36:40'),(8,'/1733315804594-124750632_images.jpg','2024-12-04 12:36:44'),(9,'/1733489357746-89495627_7192150-duas-pessoas-conversando-sobre-problemas-de-saude-mental-vetor.jpg','2024-12-06 12:49:17'),(10,'/1733489361535-928500633_mÃ£e-dando-suporte-emocional-para-filha-regulaÃ§Ã£o-emocional-como-pais-ajudam-filhos-lidar-com-as-emoÃ§Ãµes.png','2024-12-06 12:49:21'),(11,'/1733489365102-641834542_image-from-rawpixel-id-469985-jpeg.jpg','2024-12-06 12:49:25'),(12,'/1733756001462-701151099_azul-escuro5.webp','2024-12-09 14:53:21');
/*!40000 ALTER TABLE `user_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(120) NOT NULL,
  `user_email` varchar(120) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_img_profile` varchar(255) DEFAULT NULL,
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jane margolis ☆','duda@duda.com','$2a$10$oJAnik6M./fnoTzl2Y3Zqe5nwLg8Oy/G4SxaOkbGqL7aWAwOJlP3a','/1733496306987-477915137_Jane_El_Camino_infobox.webp','2024-12-03 11:42:27'),(2,'Eric Gregorio','gregorio@gregorio.com','$2a$10$CMBRrZC4R9P.cefptHaEkOCpAEAg6BabDSOOHhEcRi.maYhZe5qXu','/1733747238164-405219688_anime-8647945_1280.jpg','2024-12-03 14:48:30'),(3,'walter white','sara@30.com','$2a$10$YcRR5I2bR/rJQC61h.zaJONHvORlY7UDSMGZdAxzHHD9td9XDAgNG','/1733496028902-69467268_WhatsApp_Image_2024-12-06_at_11.38.38.jpeg','2024-12-06 14:37:04'),(4,'higashikata felps','cocomijopintobunda@laele.com','$2a$10$fN2YrRX5xr5Fxm9fLSlaSOHL1SyIwIyGS35Jmgz3/pZljLoBUvulS','/1733496882174-755122117_WhatsApp_Image_2024-12-06_at_11.21.53.jpeg','2024-12-06 14:54:12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-09 15:50:31
