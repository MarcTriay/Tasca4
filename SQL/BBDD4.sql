-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER4` ;
USE `MER4` ;

-- -----------------------------------------------------
-- Table `MER4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Client` (
  `dni` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Tipos_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Tipos_Polissa` (
  `dni` INT NOT NULL,
  `automobil` VARCHAR(45) NULL,
  `vida` VARCHAR(45) NULL,
  `llar` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Vendedor` (
  `dni` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`dni`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER4`.`Polissa` (
  `num_polisa` INT NOT NULL,
  `preu_anual` VARCHAR(45) NULL,
  `tipos_pagament` VARCHAR(45) NULL,
  `data_contració` VARCHAR(45) NULL,
  `Tipos_Polissa_idTipos_Polissa` INT NOT NULL,
  `Client_dni` VARCHAR(9) NOT NULL,
  `Vendedor_dni` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`num_polisa`),
  INDEX `fk_Polissa_Tipos_Polissa_idx` (`Tipos_Polissa_idTipos_Polissa` ASC) VISIBLE,
  INDEX `fk_Polissa_Client1_idx` (`Client_dni` ASC) VISIBLE,
  INDEX `fk_Polissa_Vendedor1_idx` (`Vendedor_dni` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Tipos_Polissa`
    FOREIGN KEY (`Tipos_Polissa_idTipos_Polissa`)
    REFERENCES `MER4`.`Tipos_Polissa` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Client1`
    FOREIGN KEY (`Client_dni`)
    REFERENCES `MER4`.`Client` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Vendedor1`
    FOREIGN KEY (`Vendedor_dni`)
    REFERENCES `MER4`.`Vendedor` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
