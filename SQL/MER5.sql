-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER5` ;
USE `MER5` ;

-- -----------------------------------------------------
-- Table `MER5`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Clients` (
  `DNI` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `dir` VARCHAR(45) NULL,
  `poblacio` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `usuari` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Citas` (
  `id` INT NOT NULL,
  `dia` VARCHAR(45) NULL,
  `hora` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`tipos_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`tipos_vehicle` (
  `id` INT NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Vehicle` (
  `matricula` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `tipos_vehicle_id1` INT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_Vehicle_tipos_vehicle1_idx` (`tipos_vehicle_id1` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_tipos_vehicle1`
    FOREIGN KEY (`tipos_vehicle_id1`)
    REFERENCES `MER5`.`tipos_vehicle` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER5`.`Client_Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER5`.`Client_Vehicle` (
  `idClient_Vehicle` INT NOT NULL,
  `data_inici` DATE NULL,
  `data_fi` DATE NULL,
  `Citas_id` INT NOT NULL,
  `Clients_DNI` INT NOT NULL,
  `Vehicle_matricula` INT NOT NULL,
  `Vehicle_tipos_vehicle_id` INT NOT NULL,
  PRIMARY KEY (`idClient_Vehicle`),
  INDEX `fk_Client_Vehicle_Citas_idx` (`Citas_id` ASC) VISIBLE,
  INDEX `fk_Client_Vehicle_Clients1_idx` (`Clients_DNI` ASC) VISIBLE,
  INDEX `fk_Client_Vehicle_Vehicle1_idx` (`Vehicle_matricula` ASC, `Vehicle_tipos_vehicle_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Vehicle_Citas`
    FOREIGN KEY (`Citas_id`)
    REFERENCES `MER5`.`Citas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Vehicle_Clients1`
    FOREIGN KEY (`Clients_DNI`)
    REFERENCES `MER5`.`Clients` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_matricula`)
    REFERENCES `MER5`.`Vehicle` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
