-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema amazon
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema amazon
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `amazon` DEFAULT CHARACTER SET utf8 ;
USE `amazon` ;

-- -----------------------------------------------------
-- Table `amazon`.`llibre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`llibre` (
  `id_llibre` INT NOT NULL AUTO_INCREMENT,
  `id_autor` INT NOT NULL,
  `Preu` FLOAT NOT NULL,
  `Titol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_llibre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`cataleg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`cataleg` (
  `id_cataleg` INT NOT NULL AUTO_INCREMENT,
  `id_llibre` INT NOT NULL,
  `quantitat` INT NOT NULL,
  PRIMARY KEY (`id_cataleg`),
  INDEX `id_llibre_idx` (`id_llibre` ASC) VISIBLE,
  CONSTRAINT `id_llibre`
    FOREIGN KEY (`id_llibre`)
    REFERENCES `amazon`.`llibre` (`id_llibre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`Detalle_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`Detalle_factura` (
  `idDetalle_factura` INT NOT NULL AUTO_INCREMENT,
  `id_cataleg` INT NOT NULL,
  `quantitat_llibre` INT NOT NULL,
  PRIMARY KEY (`idDetalle_factura`),
  INDEX `fk_idCataleg_idx` (`id_cataleg` ASC) VISIBLE,
  CONSTRAINT `fk_idCataleg`
    FOREIGN KEY (`id_cataleg`)
    REFERENCES `amazon`.`cataleg` (`id_cataleg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`usuari`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`usuari` (
  `id_usuari` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `contraneña` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuari`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`factura` (
  `id_factura` INT NOT NULL AUTO_INCREMENT,
  `id_usuari` INT NOT NULL,
  `idDetalle_factura` INT NOT NULL,
  `quantitat` INT NOT NULL,
  `total` FLOAT NULL,
  PRIMARY KEY (`id_factura`),
  INDEX `fk_idDetalle_factura_idx` (`idDetalle_factura` ASC) VISIBLE,
  INDEX `fk_idUsuario_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_idDetalle_factura`
    FOREIGN KEY (`idDetalle_factura`)
    REFERENCES `amazon`.`Detalle_factura` (`idDetalle_factura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idUsuario`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `amazon`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`autor` (
  `id_autor` INT NOT NULL AUTO_INCREMENT,
  `direccio` VARCHAR(80) NOT NULL,
  `id_llibre` INT NOT NULL,
  PRIMARY KEY (`id_autor`),
  INDEX `fk_idLlibre_idx` (`id_llibre` ASC) VISIBLE,
  CONSTRAINT `fk_idLlibre`
    FOREIGN KEY (`id_llibre`)
    REFERENCES `amazon`.`llibre` (`id_llibre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `amazon`.`llibres_autor_has_llibre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `amazon`.`llibres_autor_has_llibre` (
  `llibres_autor_id_llista_llibre` INT NOT NULL,
  `llibre_id_llibre` INT NOT NULL,
  PRIMARY KEY (`llibres_autor_id_llista_llibre`, `llibre_id_llibre`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
