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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avio` (
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
-- Table `mydb`.`Vol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vol` (
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
    REFERENCES `mydb`.`Avio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Passatger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Passatger` (
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
-- Table `mydb`.`Reserves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reserves` (
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
    REFERENCES `mydb`.`Passatger` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserves_Vol1`
    FOREIGN KEY (`Vol_id`)
    REFERENCES `mydb`.`Vol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
