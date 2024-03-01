-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Tipos de Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipos de Tarifa` (
  `idTarifas` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`idTarifas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cine` (
  `Nom` VARCHAR(45) NULL,
  `Adreca` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `Poblacio` VARCHAR(45) NULL,
  `Num de sales` VARCHAR(45) NULL,
  `Nif` INT NULL,
  `Codig postal` VARCHAR(45) NULL,
  `Localitat` VARCHAR(45) NULL,
  PRIMARY KEY (`Nif`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pelicula` (
  `Isbn` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Directori` VARCHAR(45) NULL,
  `Protagonista` VARCHAR(45) NULL,
  `Actor secundari` VARCHAR(45) NULL,
  PRIMARY KEY (`Isbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projeccio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Projeccio` (
  `idprojecció` INT NOT NULL AUTO_INCREMENT,
  `sala` VARCHAR(45) NULL,
  `hora inici` TIME NULL,
  `hora final` TIME NULL,
  `Cine_Nif` INT(9) NULL,
  `Pelicula_Isbn` INT(20) NULL,
  `Tipos de Tarifa_idTarifas` INT NULL,
  PRIMARY KEY (`idprojecció`),
  INDEX `fk_Projeccio_Cine_idx` (`Cine_Nif` ASC) VISIBLE,
  INDEX `fk_Projeccio_Pelicula1_idx` (`Pelicula_Isbn` ASC) VISIBLE,
  INDEX `fk_Projeccio_Tipos de Tarifa1_idx` (`Tipos de Tarifa_idTarifas` ASC) VISIBLE,
  CONSTRAINT `fk_Projeccio_Cine`
    FOREIGN KEY (`Cine_Nif`)
    REFERENCES `mydb`.`Cine` (`Nif`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Pelicula1`
    FOREIGN KEY (`Pelicula_Isbn`)
    REFERENCES `mydb`.`Pelicula` (`Isbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Projeccio_Tipos de Tarifa1`
    FOREIGN KEY (`Tipos de Tarifa_idTarifas`)
    REFERENCES `mydb`.`Tipos de Tarifa` (`idTarifas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
