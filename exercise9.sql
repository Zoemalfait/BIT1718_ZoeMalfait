-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exercise9
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise9
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise9` DEFAULT CHARACTER SET utf8 ;
USE `exercise9` ;

-- -----------------------------------------------------
-- Table `exercise9`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`Gene` (
  `idGene` INT NOT NULL AUTO_INCREMENT,
  `GeneName` VARCHAR(45) NULL,
  `GeneDescription` VARCHAR(45) NULL,
  PRIMARY KEY (`idGene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise9`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`Syndrome` (
  `idSyndrome` INT NOT NULL AUTO_INCREMENT,
  `SyndromeName` VARCHAR(45) NULL,
  `SyndromeDescription` VARCHAR(150) NULL,
  PRIMARY KEY (`idSyndrome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise9`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT,
  `PatientName` VARCHAR(45) NULL,
  `ID_Syndroom` INT NULL,
  `Gender` ENUM('M', 'F') NULL,
  `DiagnosisAge` INT NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `ID_syndroom_idx` (`ID_Syndroom` ASC),
  CONSTRAINT `ID_syndroom`
    FOREIGN KEY (`ID_Syndroom`)
    REFERENCES `exercise9`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise9`.`Mutations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise9`.`Mutations` (
  `idMutation` INT NOT NULL,
  `idPatient` INT NULL,
  `idGene` INT NULL,
  `MutStart` INT NULL,
  `MutStop` INT NULL,
  `MutChrom` ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', 'X', 'Y') NULL,
  PRIMARY KEY (`idMutation`),
  INDEX `id_Gene_idx` (`idGene` ASC),
  INDEX `id_Patient_idx` (`idPatient` ASC),
  CONSTRAINT `id_Gene`
    FOREIGN KEY (`idGene`)
    REFERENCES `exercise9`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Patient`
    FOREIGN KEY (`idPatient`)
    REFERENCES `exercise9`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
