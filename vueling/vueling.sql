-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Vueling
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Vueling
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Vueling` DEFAULT CHARACTER SET utf8 ;
USE `Vueling` ;

-- -----------------------------------------------------
-- Table `Vueling`.`avions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vueling`.`avions` (
  `id_avion` INT NOT NULL AUTO_INCREMENT,
  `capacitat` INT NULL,
  `model` VARCHAR(45) NULL,
  PRIMARY KEY (`id_avion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Vueling`.`seiens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Vueling`.`seiens` (
  `id_seient` INT NOT NULL AUTO_INCREMENT,
  `id_avio` INT NOT NULL,
  PRIMARY KEY (`id_seient`),
  INDEX `id_avion_idx` (`id_avio` ASC) VISIBLE,
  CONSTRAINT `id_avion`
    FOREIGN KEY (`id_avio`)
    REFERENCES `Vueling`.`avions` (`id_avion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
