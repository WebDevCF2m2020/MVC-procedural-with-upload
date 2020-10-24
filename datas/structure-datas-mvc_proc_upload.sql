-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mvc_proc_upload
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mvc_proc_upload
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mvc_proc_upload` DEFAULT CHARACTER SET utf8 ;
USE `mvc_proc_upload` ;

-- -----------------------------------------------------
-- Table `mvc_proc_upload`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mvc_proc_upload`.`permissions` (
  `idpermissions` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `permissions_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idpermissions`),
  UNIQUE INDEX `droit_name_UNIQUE` (`permissions_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mvc_proc_upload`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mvc_proc_upload`.`users` (
  `idusers` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_name` VARCHAR(45) NULL,
  `users_pwd` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL COMMENT 'Le binaire permet au mot de passe d\'être sensible à la casse (minuscule, majuscule)',
  `permissions_idpermissions` INT UNSIGNED NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `users_name_UNIQUE` (`users_name` ASC),
  INDEX `fk_users_permissions_id` (`permissions_idpermission` ASC),
  CONSTRAINT `fk_users_permission`
    FOREIGN KEY (`permissions_idpermission`)
    REFERENCES `mvc_proc_upload`.`permissions` (`idpermissions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mvc_proc_upload`.`articles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mvc_proc_upload`.`articles` (
  `idarticles` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `articles_title` VARCHAR(150) NOT NULL,
  `articles_text` TEXT NOT NULL,
  `articles_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `users_idusers` INT UNSIGNED NULL,
  PRIMARY KEY (`idarticles`),
  UNIQUE INDEX `titre_UNIQUE` (`articles_tilte` ASC),
  INDEX `fk_articles_users_idx` (`users_idusers` ASC),
  CONSTRAINT `fk_articles_users`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mvc_proc_upload`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mvc_proc_upload`.`theimages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mvc_proc_upload`.`theimages` (
  `idtheimages` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `theimages_title` VARCHAR(150) NULL,
  `theimages_name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idtheimages`),
  UNIQUE INDEX `theimages_name_UNIQUE` (`theimages_name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mvc_proc_upload`.`articles_has_theimages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mvc_proc_upload`.`articles_has_theimages` (
  `articles_idarticles` INT UNSIGNED NOT NULL,
  `theimages_idtheimages` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`articles_idarticles`, `theimages_idtheimages`),
  INDEX `fk_articles_has_theimages_theimages1_idx` (`theimages_idtheimages` ASC),
  INDEX `fk_articles_has_theimages_articles1_idx` (`articles_idarticles` ASC),
  CONSTRAINT `fk_articles_has_theimages_articles1`
    FOREIGN KEY (`articles_idarticles`)
    REFERENCES `mvc_proc_upload`.`articles` (`idarticles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articles_has_theimages_theimages1`
    FOREIGN KEY (`theimages_idtheimages`)
    REFERENCES `mvc_proc_upload`.`theimages` (`idtheimages`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mvc_proc_upload`.`rubriques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mvc_proc_upload`.`rubriques` (
  `idrubriques` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rubriques_titre` VARCHAR(120) NOT NULL,
  `rubriques_text` VARCHAR(500) NULL,
  `rubriques_idrubriques` INT UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`idrubriques`),
  INDEX `fk_rubriques_rubriques1_idx` (`rubriques_idrubriques` ASC),
  CONSTRAINT `fk_rubriques_rubriques1`
    FOREIGN KEY (`rubriques_idrubriques`)
    REFERENCES `mvc_proc_upload`.`rubriques` (`idrubriques`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mvc_proc_upload`.`articles_has_rubriques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mvc_proc_upload`.`articles_has_rubriques` (
  `articles_idarticles` INT UNSIGNED NOT NULL,
  `rubriques_idrubriques` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`articles_idarticles`, `rubriques_idrubriques`),
  INDEX `fk_articles_has_rubriques_rubriques1_idx` (`rubriques_idrubriques` ASC),
  INDEX `fk_articles_has_rubriques_articles1_idx` (`articles_idarticles` ASC),
  CONSTRAINT `fk_articles_has_rubriques_articles1`
    FOREIGN KEY (`articles_idarticles`)
    REFERENCES `mvc_proc_upload`.`articles` (`idarticles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articles_has_rubriques_rubriques1`
    FOREIGN KEY (`rubriques_idrubriques`)
    REFERENCES `mvc_proc_upload`.`rubriques` (`idrubriques`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
