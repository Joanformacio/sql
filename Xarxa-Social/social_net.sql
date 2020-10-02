-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Xarxa_social
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Xarxa_social
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Xarxa_social` DEFAULT CHARACTER SET utf8 ;
USE `Xarxa_social` ;

-- -----------------------------------------------------
-- Table `Xarxa_social`.`usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Xarxa_social`.`usuari` (
  `idUsuari` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuari`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Xarxa_social`.`imatge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Xarxa_social`.`imatge` (
  `idimatge` INT NOT NULL AUTO_INCREMENT,
  `idUsuari` INT NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  `ubicacio` VARCHAR(45) NULL,
  PRIMARY KEY (`idimatge`),
  INDEX `idUsuari_idx` (`idUsuari` ASC) VISIBLE,
  CONSTRAINT `idUsuari`
    FOREIGN KEY (`idUsuari`)
    REFERENCES `Xarxa_social`.`usuari` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Xarxa_social`.`Llista_amics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Xarxa_social`.`Llista_amics` (
  `idLlista_amics` INT NOT NULL AUTO_INCREMENT,
  `idusuari` INT NOT NULL,
  `Modo_contacte` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLlista_amics`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Xarxa_social`.`amics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Xarxa_social`.`amics` (
  `idAmic` INT NOT NULL AUTO_INCREMENT,
  `idUsuari` INT NULL,
  `idLlista_amics` INT NULL,
  PRIMARY KEY (`idAmic`),
  INDEX `idUsuario_idx` (`idUsuari` ASC) VISIBLE,
  INDEX `idLlista_amics_idx` (`idLlista_amics` ASC) VISIBLE,
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuari`)
    REFERENCES `Xarxa_social`.`usuari` (`idUsuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idLlista_amics`
    FOREIGN KEY (`idLlista_amics`)
    REFERENCES `Xarxa_social`.`Llista_amics` (`idLlista_amics`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
