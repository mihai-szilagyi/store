CREATE DATABASE `store` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext,
  `price` float DEFAULT NULL,
  `stock` smallint(6) DEFAULT '0',
  `created_date` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `invoice` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_2_idx` (`product`),
  KEY `fk_order_1_idx` (`invoice`),
  CONSTRAINT `fk_invoice_2` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_1` FOREIGN KEY (`invoice`) REFERENCES `invoice` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `customer` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `address` text,
  `total` float DEFAULT NULL,
  `delivered` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_1_idx` (`customer`),
  CONSTRAINT `fk_invoice_1` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `expires` varchar(45) DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;