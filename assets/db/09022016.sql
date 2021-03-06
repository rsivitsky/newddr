-- MySQL Script generated by MySQL Workbench
-- 02/09/16 23:33:56
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema offersdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `offersdb` ;

-- -----------------------------------------------------
-- Schema offersdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `offersdb` DEFAULT CHARACTER SET utf8 ;
USE `offersdb` ;

-- -----------------------------------------------------
-- Table `offersdb`.`vendor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`vendor` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`vendor` (
  `vendor_id` INT(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  UNIQUE INDEX `idvendor_UNIQUE` (`vendor_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'vendor of goods';


-- -----------------------------------------------------
-- Table `offersdb`.`contact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`contact` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`contact` (
  `contact_id` INT(11) NOT NULL AUTO_INCREMENT,
  `contact_adr` VARCHAR(45) NULL DEFAULT NULL,
  `contact_site` VARCHAR(45) NULL DEFAULT NULL,
  `vendor_id` INT(11) NOT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE INDEX `contact_id_UNIQUE` (`contact_id` ASC),
  INDEX `fk_contact_vendor1_idx` (`vendor_id` ASC),
  CONSTRAINT `fk_contact_vendor1`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `offersdb`.`vendor` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`manufactur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`manufactur` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`manufactur` (
  `manufactur_id` INT(11) NOT NULL AUTO_INCREMENT,
  `manufactur_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`manufactur_id`),
  UNIQUE INDEX `idmanufactur_id_UNIQUE` (`manufactur_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`part`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`part` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`part` (
  `part_id` INT(11) NOT NULL AUTO_INCREMENT,
  `part_name` VARCHAR(45) NULL,
  `manufactur_id` INT(11) NULL DEFAULT NULL,
  `photo` BLOB NULL,
  PRIMARY KEY (`part_id`),
  UNIQUE INDEX `id_part_UNIQUE` (`part_id` ASC),
  INDEX `fk_part_manufactur1_idx` (`manufactur_id` ASC),
  CONSTRAINT `fk_part_manufactur1`
    FOREIGN KEY (`manufactur_id`)
    REFERENCES `offersdb`.`manufactur` (`manufactur_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COMMENT = 'type of computer part (computer accessory)';


-- -----------------------------------------------------
-- Table `offersdb`.`typeofspec`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`typeofspec` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`typeofspec` (
  `tspec_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tspec_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`tspec_id`),
  UNIQUE INDEX `id_typeofspec_UNIQUE` (`tspec_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'type of specification';


-- -----------------------------------------------------
-- Table `offersdb`.`measure`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`measure` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`measure` (
  `measure_id` INT(11) NOT NULL AUTO_INCREMENT,
  `measure_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`measure_id`),
  UNIQUE INDEX `id_measure_UNIQUE` (`measure_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`specification`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`specification` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`specification` (
  `spec_id` INT NOT NULL AUTO_INCREMENT,
  `spec_name` VARCHAR(45) NULL,
  `tspec_id` INT(11) NOT NULL,
  `measure_id` INT(11) NOT NULL,
  PRIMARY KEY (`spec_id`),
  INDEX `fk_specification_typeofspec1_idx` (`tspec_id` ASC),
  INDEX `fk_specification_measure1_idx` (`measure_id` ASC),
  CONSTRAINT `fk_specification_typeofspec1`
    FOREIGN KEY (`tspec_id`)
    REFERENCES `offersdb`.`typeofspec` (`tspec_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_specification_measure1`
    FOREIGN KEY (`measure_id`)
    REFERENCES `offersdb`.`measure` (`measure_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `offersdb`.`description`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`description` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`description` (
  `descript_id` INT(11) NOT NULL AUTO_INCREMENT,
  `descript_name` VARCHAR(45) NULL DEFAULT NULL,
  `descript_value` VARCHAR(45) NULL DEFAULT NULL,
  `part_id` INT(11) NOT NULL,
  `spec_id` INT NOT NULL,
  PRIMARY KEY (`descript_id`),
  INDEX `fk_description_part1_idx` (`part_id` ASC),
  INDEX `fk_description_specification2_idx` (`spec_id` ASC),
  CONSTRAINT `fk_description_part1`
    FOREIGN KEY (`part_id`)
    REFERENCES `offersdb`.`part` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_description_specification2`
    FOREIGN KEY (`spec_id`)
    REFERENCES `offersdb`.`specification` (`spec_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`valuta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`valuta` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`valuta` (
  `valuta_id` INT(11) NOT NULL AUTO_INCREMENT,
  `valuta_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`valuta_id`),
  UNIQUE INDEX `id_valuta_UNIQUE` (`valuta_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`offer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`offer` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`offer` (
  `offer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `offer_date` DATETIME NULL DEFAULT NULL,
  `offer_price` FLOAT NOT NULL,
  `valuta_id` INT(11) NOT NULL,
  `part_id` INT(11) NOT NULL,
  `vendor_id` INT(11) NOT NULL,
  `offer_num` DECIMAL(10,0) NOT NULL,
  `offer_sum` FLOAT NOT NULL,
  PRIMARY KEY (`offer_id`, `part_id`, `vendor_id`),
  UNIQUE INDEX `id_offer_UNIQUE` (`offer_id` ASC),
  INDEX `fk_offer_valuta1_idx` (`valuta_id` ASC),
  INDEX `fk_offer_part1_idx` (`part_id` ASC),
  INDEX `fk_offer_vendor1_idx` (`vendor_id` ASC),
  CONSTRAINT `fk_offer_part1`
    FOREIGN KEY (`part_id`)
    REFERENCES `offersdb`.`part` (`part_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_valuta1`
    FOREIGN KEY (`valuta_id`)
    REFERENCES `offersdb`.`valuta` (`valuta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offer_vendor1`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `offersdb`.`vendor` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`role` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`role` (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_id_UNIQUE` (`role_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`user` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `firstname` VARCHAR(255) NULL DEFAULT NULL,
  `lastname` VARCHAR(255) NULL DEFAULT NULL,
  `role_id` INT(11) NOT NULL,
  `vendor_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  INDEX `fk_user_role1_idx` (`role_id` ASC),
  INDEX `fk_user_vendor1_idx` (`vendor_id` ASC),
  CONSTRAINT `fk_user_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `offersdb`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_vendor1`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `offersdb`.`vendor` (`vendor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`order` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_num` DECIMAL(10,0) NULL,
  `order_date` DATETIME NULL,
  `user_id` INT(11) NOT NULL,
  `offer_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC),
  INDEX `fk_order_user1_idx` (`user_id` ASC),
  INDEX `fk_order_offer1_idx` (`offer_id` ASC),
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `offersdb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_offer1`
    FOREIGN KEY (`offer_id`)
    REFERENCES `offersdb`.`offer` (`offer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `offersdb`.`phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `offersdb`.`phone` ;

CREATE TABLE IF NOT EXISTS `offersdb`.`phone` (
  `phone_id` INT(11) NOT NULL AUTO_INCREMENT,
  `contact_id` INT(11) NOT NULL,
  PRIMARY KEY (`phone_id`),
  UNIQUE INDEX `phone_id_UNIQUE` (`phone_id` ASC),
  INDEX `fk_phone_contact1_idx` (`contact_id` ASC),
  CONSTRAINT `fk_phone_contact1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `offersdb`.`contact` (`contact_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
