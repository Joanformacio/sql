-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optica` DEFAULT CHARACTER SET utf8 ;
USE `Optica` ;

-- -----------------------------------------------------
-- Table `Optica`.`empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`empleat` (
  `id_empleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`clients` (
  `id_clients` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(12) NOT NULL,
  `fax` VARCHAR(12) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `recomanat` VARCHAR(45) NULL,
  `data_registre` DATE NOT NULL,
  `C.P` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id_clients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`tipus_montura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`tipus_montura` (
  `id_tipus_montura` INT NOT NULL AUTO_INCREMENT,
  `tipus` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipus_montura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`color` (
  `id_color` INT NOT NULL AUTO_INCREMENT,
  `color` VARCHAR(15) NULL,
  PRIMARY KEY (`id_color`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`montura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`montura` (
  `id_montura` INT NOT NULL AUTO_INCREMENT,
  `id_tipus_montura` INT NOT NULL,
  `id_color` INT NOT NULL,
  PRIMARY KEY (`id_montura`),
  INDEX `id_tipus_montura_idx` (`id_tipus_montura` ASC) VISIBLE,
  INDEX `id_color_idx` (`id_color` ASC) VISIBLE,
  CONSTRAINT `id_tipus_montura`
    FOREIGN KEY (`id_tipus_montura`)
    REFERENCES `Optica`.`tipus_montura` (`id_tipus_montura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_color`
    FOREIGN KEY (`id_color`)
    REFERENCES `Optica`.`color` (`id_color`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`vidres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`vidres` (
  `id_vidres` INT NOT NULL AUTO_INCREMENT,
  `graduacio-dreta` FLOAT NOT NULL,
  `graduacio-esquerra` FLOAT NOT NULL,
  `color` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id_vidres`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`caracteristiques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`caracteristiques` (
  `id_caracteristiques` INT NOT NULL AUTO_INCREMENT,
  `id_montura` INT NOT NULL,
  `id_vidres` INT NOT NULL,
  PRIMARY KEY (`id_caracteristiques`),
  INDEX `id_montura_idx` (`id_montura` ASC) VISIBLE,
  INDEX `id_vidres_idx` (`id_vidres` ASC) VISIBLE,
  CONSTRAINT `id_montura`
    FOREIGN KEY (`id_montura`)
    REFERENCES `Optica`.`montura` (`id_montura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_vidres`
    FOREIGN KEY (`id_vidres`)
    REFERENCES `Optica`.`vidres` (`id_vidres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`adreça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`adreça` (
  `idadreça` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NULL,
  `numero` INT NULL,
  `pis` INT NULL,
  `porta` INT NULL,
  `ciutat` VARCHAR(20) NULL,
  `cp` INT NULL,
  `adreçacol` VARCHAR(45) NULL,
  PRIMARY KEY (`idadreça`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`proveidor` (
  `idproveidor` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `telefon` VARCHAR(12) NULL,
  `fax` VARCHAR(12) NULL,
  `NIF` VARCHAR(9) NULL,
  `idadreça` INT NULL,
  PRIMARY KEY (`idproveidor`),
  INDEX `id_adreça_idx` (`idadreça` ASC) VISIBLE,
  CONSTRAINT `id_adreça`
    FOREIGN KEY (`idadreça`)
    REFERENCES `Optica`.`adreça` (`idadreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`ulleres` (
  `id_ulleres` INT NOT NULL AUTO_INCREMENT,
  `id_proveidor` INT NOT NULL,
  `marca` VARCHAR(25) NOT NULL,
  `preu` FLOAT NOT NULL,
  `id_caracteristicas` INT NOT NULL,
  PRIMARY KEY (`id_ulleres`),
  INDEX `id_caracteristiques_idx` (`id_caracteristicas` ASC) VISIBLE,
  INDEX `id_proveidor_idx` (`id_proveidor` ASC) VISIBLE,
  CONSTRAINT `id_caracteristiques`
    FOREIGN KEY (`id_caracteristicas`)
    REFERENCES `Optica`.`caracteristiques` (`id_caracteristiques`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_proveidor`
    FOREIGN KEY (`id_proveidor`)
    REFERENCES `Optica`.`proveidor` (`idproveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica`.`ventas` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `id_empleat` INT NOT NULL,
  `id_client` INT(45) NOT NULL,
  `id_ulleres` INT NOT NULL,
  `quantitat` INT NOT NULL,
  `total_venta` FLOAT NULL,
  PRIMARY KEY (`idventas`),
  INDEX `id_empleat_idx` (`id_empleat` ASC) VISIBLE,
  INDEX `id_ulleres_idx` (`id_ulleres` ASC) VISIBLE,
  INDEX `id_client_idx` (`id_client` ASC) VISIBLE,
  CONSTRAINT `id_empleat`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `Optica`.`empleat` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_client`
    FOREIGN KEY (`id_client`)
    REFERENCES `Optica`.`clients` (`id_clients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_ulleres`
    FOREIGN KEY (`id_ulleres`)
    REFERENCES `Optica`.`ulleres` (`id_ulleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
