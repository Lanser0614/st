SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Структура таблицы `geoip_city`
--

DROP TABLE IF EXISTS `geoip_city`;
CREATE TABLE IF NOT EXISTS `geoip_city` (
  `geoip_city_id` int(11) NOT NULL AUTO_INCREMENT,
  `fias_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`geoip_city_id`),
  UNIQUE KEY `fias_id` (`fias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `geoip_city`
--

INSERT INTO `geoip_city` (`geoip_city_id`, `fias_id`, `name`) VALUES
(1, 41, 'Москва'),
(2, 3145, 'Воронеж'),
(3, 4187, 'Ростов-на-Дону'),
(4, 3737, 'Саратов'),
(5, 3187, 'Екатеринбург'),
(6, 5033, 'Владивосток'),
(7, 2638, 'Хабаровск'),
(8, 86, 'Санкт-Петербург'),
(9, 5147, 'Новосибирск'),
(10, 2990, 'Нижний Новгород'),
(11, 4006, 'Казань'),
(12, 2782, 'Самара'),
(13, 3704, 'Омск'),
(14, 4778, 'Челябинск'),
(15, 6125, 'Уфа'),
(16, 3734, 'Волгоград'),
(17, 3753, 'Красноярск'),
(18, 4131, 'Пермь');

-- --------------------------------------------------------

--
-- Структура таблицы `geoip_redirect`
--

DROP TABLE IF EXISTS `geoip_redirect`;
CREATE TABLE IF NOT EXISTS `geoip_redirect` (
  `geoip_redirect_id` int(11) NOT NULL AUTO_INCREMENT,
  `fias_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`geoip_redirect_id`),
  KEY `fias_id` (`fias_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `geoip_rule`
--

DROP TABLE IF EXISTS `geoip_rule`;
CREATE TABLE IF NOT EXISTS `geoip_rule` (
  `geoip_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `fias_id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`geoip_rule_id`),
  KEY `fias_id` (`fias_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `geoip_currency`
--

DROP TABLE IF EXISTS `geoip_currency`;
CREATE TABLE IF NOT EXISTS `geoip_currency` (
  `geoip_currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`geoip_currency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
