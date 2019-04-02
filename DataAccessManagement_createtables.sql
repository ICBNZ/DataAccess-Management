-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema data_project1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema data_project1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `data_project1` DEFAULT CHARACTER SET utf8 ;
USE `data_project1` ;

-- -----------------------------------------------------
-- Table `data_project1`.`Subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_project1`.`Subject` (
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_project1`.`Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_project1`.`Type` (
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_project1`.`Article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_project1`.`Article` (
  `id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `about` MEDIUMTEXT NULL,
  `Subject_name` VARCHAR(45) NOT NULL,
  `Type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Article_Subject_idx` (`Subject_name` ASC) VISIBLE,
  INDEX `fk_Article_Type1_idx` (`Type_name` ASC) VISIBLE,
  CONSTRAINT `fk_Article_Subject`
    FOREIGN KEY (`Subject_name`)
    REFERENCES `data_project1`.`Subject` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Article_Type1`
    FOREIGN KEY (`Type_name`)
    REFERENCES `data_project1`.`Type` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_project1`.`Programming`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_project1`.`Programming` (
  `designed` VARCHAR(45) NULL,
  `developed` VARCHAR(45) NULL,
  `Article_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Article_id`),
  CONSTRAINT `fk_Programming_Article1`
    FOREIGN KEY (`Article_id`)
    REFERENCES `data_project1`.`Article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_project1`.`Painting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_project1`.`Painting` (
  `year` VARCHAR(45) NULL,
  `medium` VARCHAR(45) NULL,
  `dimensions` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `Article_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Article_id`),
  CONSTRAINT `fk_Painting_Article1`
    FOREIGN KEY (`Article_id`)
    REFERENCES `data_project1`.`Article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `data_project1`.`Biography`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `data_project1`.`Biography` (
  `born_date` VARCHAR(15) NOT NULL,
  `died_date` VARCHAR(15) NULL,
  `nationality` VARCHAR(45) NULL,
  `known_for` VARCHAR(455) NULL,
  `notable` VARCHAR(455) NULL,
  `Article_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Article_id`),
  CONSTRAINT `fk_Biography_Article1`
    FOREIGN KEY (`Article_id`)
    REFERENCES `data_project1`.`Article` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
