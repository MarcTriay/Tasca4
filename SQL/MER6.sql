-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER6` ;
USE `MER6` ;

-- -----------------------------------------------------
-- Table `MER6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Avio` (
  `id` INT NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat` VARCHAR(45) NULL,
  `Autonomia` VARCHAR(45) NULL,
  `Date_fabricació` VARCHAR(45) NULL,
  `Date_Mort` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Vol` (
  `id` INT NOT NULL,
  `Num_Vol` VARCHAR(45) NULL,
  `Origen` VARCHAR(45) NULL,
  `Desti` VARCHAR(45) NULL,
  `Data_Sortida` VARCHAR(45) NULL,
  `Data_Arribada` VARCHAR(45) NULL,
  `Hora_Arribada` VARCHAR(45) NULL,
  `Avio_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Vol_Avio1_idx` (`Avio_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vol_Avio1`
    FOREIGN KEY (`Avio_id`)
    REFERENCES `MER6`.`Avio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Passatger` (
  `id` INT NOT NULL,
  `Dni` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER6`.`Reserves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER6`.`Reserves` (
  `id` INT NOT NULL,
  `Data` DATE NULL,
  `Import` VARCHAR(45) NULL,
  `Passatger_id` INT NOT NULL,
  `Vol_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Reserves_Passatger_idx` (`Passatger_id` ASC) VISIBLE,
  INDEX `fk_Reserves_Vol1_idx` (`Vol_id` ASC) VISIBLE,
  CONSTRAINT `fk_Reserves_Passatger`
    FOREIGN KEY (`Passatger_id`)
    REFERENCES `MER6`.`Passatger` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserves_Vol1`
    FOREIGN KEY (`Vol_id`)
    REFERENCES `MER6`.`Vol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
