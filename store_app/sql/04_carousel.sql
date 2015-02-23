CREATE TABLE `store`.`carousel` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `position` INT NULL,
  `product` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_carousel_1_idx` (`product` ASC),
  CONSTRAINT `fk_carousel_1`
    FOREIGN KEY (`product`)
    REFERENCES `store`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `store`.`carousel` (`position`, `product`) VALUES ('1', '1');
INSERT INTO `store`.`carousel` (`position`, `product`) VALUES ('2', '3');
INSERT INTO `store`.`carousel` (`position`, `product`) VALUES ('3', '2');

