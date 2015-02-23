SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `store` ;
CREATE SCHEMA IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `store` ;

-- -----------------------------------------------------
-- Table `store`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`customer` ;

CREATE TABLE IF NOT EXISTS `store`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `store`.`sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`sessions` ;

CREATE TABLE IF NOT EXISTS `store`.`sessions` (
  `id` INT NOT NULL,
  `expires` VARCHAR(45) NULL,
  `data` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`manufacturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`manufacturer` ;

CREATE TABLE IF NOT EXISTS `store`.`manufacturer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(450) NULL,
  `details` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`type` ;

CREATE TABLE IF NOT EXISTS `store`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `details` VARCHAR(450) NULL,
  `name` VARCHAR(450) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`product` ;

CREATE TABLE IF NOT EXISTS `store`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` FLOAT NULL,
  `description` MEDIUMTEXT NULL,
  `name` VARCHAR(450) NULL,
  `stock` SMALLINT NULL DEFAULT 0,
  `material` VARCHAR(450) NULL,
  `color` VARCHAR(45) NULL,
  `manufacturer` INT NULL,
  `type` INT NULL,
  `created_date` DATETIME NULL,
  `last_updated` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_1_idx` (`manufacturer` ASC),
  INDEX `fk_product_2_idx` (`type` ASC),
  CONSTRAINT `fk_product_1`
    FOREIGN KEY (`manufacturer`)
    REFERENCES `store`.`manufacturer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_2`
    FOREIGN KEY (`type`)
    REFERENCES `store`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`invoice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`invoice` ;

CREATE TABLE IF NOT EXISTS `store`.`invoice` (
  `id` INT NOT NULL,
  `customer` INT NULL,
  `date` DATETIME NULL,
  `address` TEXT NULL,
  `total` FLOAT NULL,
  `delivered` TINYINT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoice_1_idx` (`customer` ASC),
  CONSTRAINT `fk_invoice_1`
    FOREIGN KEY (`customer`)
    REFERENCES `store`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `store`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `store`.`order` ;

CREATE TABLE IF NOT EXISTS `store`.`order` (
  `id` INT NOT NULL,
  `product` INT NULL,
  `price` FLOAT NULL,
  `invoice` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_invoice_2_idx` (`product` ASC),
  INDEX `fk_order_1_idx` (`invoice` ASC),
  CONSTRAINT `fk_invoice_2`
    FOREIGN KEY (`product`)
    REFERENCES `store`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_1`
    FOREIGN KEY (`invoice`)
    REFERENCES `store`.`invoice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
