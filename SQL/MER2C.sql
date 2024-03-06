-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2C` ;
USE `MER2C` ;

-- -----------------------------------------------------
-- Table `MER2C`.`departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`departament` (
  `nom` INT NOT NULL,
  PRIMARY KEY (`nom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`professor` (
  `NIF` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `titulacio` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `cap_de_departament` VARCHAR(45) NULL,
  `departament_nom` INT NOT NULL,
  PRIMARY KEY (`NIF`, `departament_nom`),
  INDEX `fk_professor_departament1_idx` (`departament_nom` ASC) VISIBLE,
  CONSTRAINT `fk_professor_departament1`
    FOREIGN KEY (`departament_nom`)
    REFERENCES `MER2C`.`departament` (`nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`assignatura` (
  `ID` INT(45) NOT NULL,
  `nom` INT NULL,
  `credits` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `professor` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`alumne` (
  `dni` INT NULL,
  `nom` VARCHAR(30) NULL,
  `cognom` VARCHAR(20) NULL,
  `email` VARCHAR(45) NULL,
  `telefono` INT(9) NULL,
  `adreça` VARCHAR(50) NULL,
  `expedient` VARCHAR(45) NOT NULL,
  `data_neixement` VARCHAR(45) NULL,
  PRIMARY KEY (`expedient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`assignaturaMatricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`assignaturaMatricula` (
  `ID` VARCHAR(45) NOT NULL,
  `matricula_data` INT NOT NULL,
  `professor_NIF` INT NOT NULL,
  `assignatura_ID` INT(45) NOT NULL,
  PRIMARY KEY (`ID`, `professor_NIF`, `assignatura_ID`),
  INDEX `fk_assignaturaMatricula_professor1_idx` (`professor_NIF` ASC) VISIBLE,
  INDEX `fk_assignaturaMatricula_assignatura1_idx` (`assignatura_ID` ASC) VISIBLE,
  CONSTRAINT `fk_assignaturaMatricula_professor1`
    FOREIGN KEY (`professor_NIF`)
    REFERENCES `MER2C`.`professor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assignaturaMatricula_assignatura1`
    FOREIGN KEY (`assignatura_ID`)
    REFERENCES `MER2C`.`assignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`matricula` (
  `data` INT NOT NULL,
  `alumne` VARCHAR(45) NULL,
  `assignatura` VARCHAR(45) NULL,
  `nivell` VARCHAR(45) NULL,
  `curs` VARCHAR(45) NULL,
  `grup` VARCHAR(45) NULL,
  `alumne_expedient` VARCHAR(45) NOT NULL,
  `assignaturaMatricula_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`data`, `alumne_expedient`, `assignaturaMatricula_ID`),
  INDEX `fk_matricula_alumne1_idx` (`alumne_expedient` ASC) VISIBLE,
  INDEX `fk_matricula_assignaturaMatricula1_idx` (`assignaturaMatricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_matricula_alumne1`
    FOREIGN KEY (`alumne_expedient`)
    REFERENCES `MER2C`.`alumne` (`expedient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_matricula_assignaturaMatricula1`
    FOREIGN KEY (`assignaturaMatricula_ID`)
    REFERENCES `MER2C`.`assignaturaMatricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
