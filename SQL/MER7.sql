-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER7` ;
USE `MER7` ;

-- -----------------------------------------------------
-- Table `MER7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Empleat` (
  `id` INT NOT NULL,
  `Dni` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`table5`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`table5` (
  `id` INT NOT NULL,
  `Dni` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Ticket` (
  `Nom` INT NOT NULL,
  `Nom_factura` VARCHAR(45) NULL,
  `Nom_empresa` VARCHAR(45) NULL,
  `Nif` VARCHAR(45) NULL,
  `Data` DATE NULL,
  `Correu` VARCHAR(45) NULL,
  `Web` VARCHAR(45) NULL,
  `Domicili_fiscal` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `table5_id` INT NOT NULL,
  `Empleat_id` INT NOT NULL,
  PRIMARY KEY (`Nom`),
  INDEX `fk_Ticket_table5_idx` (`table5_id` ASC) VISIBLE,
  INDEX `fk_Ticket_Empleat1_idx` (`Empleat_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_table5`
    FOREIGN KEY (`table5_id`)
    REFERENCES `MER7`.`table5` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Empleat1`
    FOREIGN KEY (`Empleat_id`)
    REFERENCES `MER7`.`Empleat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Producte` (
  `id` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `Preu_unitat` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER7`.`Linea_Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER7`.`Linea_Ticket` (
  `id` INT NOT NULL,
  `Quantitat` INT NULL,
  `Descompte` VARCHAR(45) NULL,
  `Producte_id` INT NOT NULL,
  `Ticket_Nom` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Linea_Ticket_Producte1_idx` (`Producte_id` ASC) VISIBLE,
  INDEX `fk_Linea_Ticket_Ticket1_idx` (`Ticket_Nom` ASC) VISIBLE,
  CONSTRAINT `fk_Linea_Ticket_Producte1`
    FOREIGN KEY (`Producte_id`)
    REFERENCES `MER7`.`Producte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linea_Ticket_Ticket1`
    FOREIGN KEY (`Ticket_Nom`)
    REFERENCES `MER7`.`Ticket` (`Nom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
