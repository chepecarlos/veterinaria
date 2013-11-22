SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `veterinaria` ;
CREATE SCHEMA IF NOT EXISTS `veterinaria` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `veterinaria` ;

-- -----------------------------------------------------
-- Table `veterinaria`.`dep_departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`dep_departamento` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`dep_departamento` (
  `dep_id` INT NOT NULL COMMENT 'ID de departamento',
  `dep_nombre` VARCHAR(15) NOT NULL COMMENT 'Nombre del departamento',
  PRIMARY KEY (`dep_id`))
ENGINE = InnoDB
COMMENT = 'Departamentos del pais';


-- -----------------------------------------------------
-- Table `veterinaria`.`gen_genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`gen_genero` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`gen_genero` (
  `gen_id` INT NOT NULL COMMENT 'ID de genero',
  `gen_nombre` CHAR(1) NOT NULL COMMENT 'Nombre de genero',
  PRIMARY KEY (`gen_id`))
ENGINE = InnoDB
COMMENT = 'Definición de generos';


-- -----------------------------------------------------
-- Table `veterinaria`.`esp_especializaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`esp_especializaciones` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`esp_especializaciones` (
  `esp_id` INT NOT NULL,
  `esp_nombre` VARCHAR(50) NOT NULL,
  `esp_descripcion` VARCHAR(100) NULL COMMENT 'Descripcion de la especialización',
  PRIMARY KEY (`esp_id`))
ENGINE = InnoDB
COMMENT = 'Especializaciones de un medico';


-- -----------------------------------------------------
-- Table `veterinaria`.`car_cargos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`car_cargos` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`car_cargos` (
  `car_id` INT NOT NULL,
  `car_nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre del cargo',
  PRIMARY KEY (`car_id`))
ENGINE = InnoDB
COMMENT = 'Cargos de los empleados';


-- -----------------------------------------------------
-- Table `veterinaria`.`emp_empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`emp_empleados` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`emp_empleados` (
  `emp_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID de empleado',
  `emp_nombre1` VARCHAR(20) NOT NULL COMMENT '1er nombre del empleado',
  `emp_nombre2` VARCHAR(20) NULL COMMENT '2o nombre de empleado',
  `emp_apellido1` VARCHAR(20) NOT NULL COMMENT '1er apellido del empleado',
  `emp_apellido2` VARCHAR(45) NULL COMMENT '2o apellido del empleado',
  `emp_fotoemp` VARCHAR(45) NULL COMMENT 'Foto del empleado',
  `emp_direccion` VARCHAR(45) NOT NULL COMMENT 'Direccion particular del empleado',
  `emp_telcasa` CHAR(9) NOT NULL COMMENT 'Telefono de casa del empleado',
  `emp_telcelular` CHAR(9) NULL COMMENT 'Telefono celular del empleado',
  `emp_email` VARCHAR(45) NULL COMMENT 'Correo electronico del empleado',
  `emp_dui` CHAR(10) NOT NULL COMMENT 'DUI del empleado',
  `emp_nit` CHAR(20) NOT NULL COMMENT 'NIT del empleado',
  `emp_isss` CHAR(9) NULL COMMENT 'Carnet del Seguro Social del empleado',
  `emp_licconducir` CHAR(1) NULL COMMENT 'Posee o no licencia de conducir',
  `dep_emp_id` INT NOT NULL,
  `gen_genero_gen_id` INT NOT NULL,
  `esp_emp_id` INT NOT NULL,
  `car_emp_id` INT NOT NULL,
  PRIMARY KEY (`emp_id`, `dep_emp_id`, `gen_genero_gen_id`, `esp_emp_id`, `car_emp_id`),
  INDEX `fk_emp_empleados_dep_departamento1_idx` (`dep_emp_id` ASC),
  INDEX `fk_emp_empleados_gen_genero1_idx` (`gen_genero_gen_id` ASC),
  INDEX `fk_emp_empleados_esp_especializaciones1_idx` (`esp_emp_id` ASC),
  INDEX `fk_emp_empleados_car_cargos1_idx` (`car_emp_id` ASC),
  CONSTRAINT `fk_emp_empleados_dep_departamento1`
    FOREIGN KEY (`dep_emp_id`)
    REFERENCES `veterinaria`.`dep_departamento` (`dep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp_empleados_gen_genero1`
    FOREIGN KEY (`gen_genero_gen_id`)
    REFERENCES `veterinaria`.`gen_genero` (`gen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp_empleados_esp_especializaciones1`
    FOREIGN KEY (`esp_emp_id`)
    REFERENCES `veterinaria`.`esp_especializaciones` (`esp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emp_empleados_car_cargos1`
    FOREIGN KEY (`car_emp_id`)
    REFERENCES `veterinaria`.`car_cargos` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Datos de los empleados de la veterinaria';


-- -----------------------------------------------------
-- Table `veterinaria`.`mun_municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`mun_municipio` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`mun_municipio` (
  `mun_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID del municipio',
  `mun_nombre` VARCHAR(50) NOT NULL,
  `dep_mun_id` INT NOT NULL,
  PRIMARY KEY (`mun_id`, `dep_mun_id`),
  INDEX `fk_mun_municipio_dep_departamento_idx` (`dep_mun_id` ASC),
  CONSTRAINT `fk_mun_municipio_dep_departamento`
    FOREIGN KEY (`dep_mun_id`)
    REFERENCES `veterinaria`.`dep_departamento` (`dep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Municipio del pais';


-- -----------------------------------------------------
-- Table `veterinaria`.`prop_propietarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`prop_propietarios` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`prop_propietarios` (
  `prop_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID del propietario',
  `prop_nombre1` VARCHAR(20) NOT NULL COMMENT '1er nombre del propietario',
  `prop_nombre2` VARCHAR(20) NULL COMMENT '2o nombre del propietario',
  `prop_apellido1` VARCHAR(20) NOT NULL COMMENT '1er apellido del propietario',
  `prop_apellido2` VARCHAR(20) NULL COMMENT '2o apellido del propietario',
  `prop_fnacimiento` DATE NULL,
  `prop_direccion` VARCHAR(45) NOT NULL COMMENT 'Direccion del propietario',
  `prop_telcasa` CHAR(9) NOT NULL COMMENT 'Telefono de casa del propietario',
  `prop_telcel` CHAR(9) NULL COMMENT 'Telefono celular del propietario',
  `prop_teltrabajo` CHAR(9) NULL COMMENT 'Telefono de trabajo del propietario',
  `prop_email` VARCHAR(45) NULL COMMENT 'Correo electronico del propietario',
  `prop_dui` CHAR(10) NOT NULL COMMENT 'DUI del propietario',
  `prop_nit` CHAR(20) NOT NULL COMMENT 'NIT del propietario',
  `prop_regfiscal` CHAR(8) NULL COMMENT 'Registro fiscal del propietario',
  `gen_genero_gen_id` INT NOT NULL,
  PRIMARY KEY (`prop_id`, `gen_genero_gen_id`),
  INDEX `fk_prop_propietarios_gen_genero1_idx` (`gen_genero_gen_id` ASC),
  CONSTRAINT `fk_prop_propietarios_gen_genero1`
    FOREIGN KEY (`gen_genero_gen_id`)
    REFERENCES `veterinaria`.`gen_genero` (`gen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Propietarios de las mascotas';


-- -----------------------------------------------------
-- Table `veterinaria`.`usr_usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`usr_usuarios` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`usr_usuarios` (
  `usr_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID de usuario',
  `usr_username` VARCHAR(20) NOT NULL COMMENT 'Nombre de usuario',
  `usr_passwd` VARCHAR(20) NOT NULL COMMENT 'Contraseña de acceso',
  `usr_accesibilidad` INT NOT NULL COMMENT 'Accesibilidad del empleado',
  `emp_usr_id` INT NOT NULL,
  PRIMARY KEY (`usr_id`, `emp_usr_id`),
  INDEX `fk_usr_usuarios_emp_empleados1_idx` (`emp_usr_id` ASC),
  CONSTRAINT `fk_usr_usuarios_emp_empleados1`
    FOREIGN KEY (`emp_usr_id`)
    REFERENCES `veterinaria`.`emp_empleados` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Usuarios de acceso al sitio';


-- -----------------------------------------------------
-- Table `veterinaria`.`doc_doctores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`doc_doctores` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`doc_doctores` (
  `doc_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID del doctor',
  `emp_doc_id` INT NOT NULL,
  PRIMARY KEY (`doc_id`, `emp_doc_id`),
  INDEX `fk_doc_doctores_emp_empleados1_idx` (`emp_doc_id` ASC),
  CONSTRAINT `fk_doc_doctores_emp_empleados1`
    FOREIGN KEY (`emp_doc_id`)
    REFERENCES `veterinaria`.`emp_empleados` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Listado de doctores de la veterinaria';


-- -----------------------------------------------------
-- Table `veterinaria`.`mas_mascotas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`mas_mascotas` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`mas_mascotas` (
  `mas_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID del tipo de mascotas',
  `mas_tipo` VARCHAR(20) NOT NULL COMMENT 'Tipo de mascotas posibles',
  PRIMARY KEY (`mas_id`))
ENGINE = InnoDB
COMMENT = 'Tipo de mascotas registradas';


-- -----------------------------------------------------
-- Table `veterinaria`.`esm_estado_mascotas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`esm_estado_mascotas` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`esm_estado_mascotas` (
  `esm_id` INT NOT NULL COMMENT 'ID del estado de mascota',
  `esm_estado` VARCHAR(20) NOT NULL COMMENT 'Estado de la mascota',
  PRIMARY KEY (`esm_id`))
ENGINE = InnoDB
COMMENT = 'Estado de las mascotas';


-- -----------------------------------------------------
-- Table `veterinaria`.`tps_tipo_salida`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`tps_tipo_salida` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`tps_tipo_salida` (
  `tps_id` INT NOT NULL,
  `tps_descripcion` VARCHAR(30) NOT NULL COMMENT 'Descripción del tipo de salida',
  PRIMARY KEY (`tps_id`))
ENGINE = InnoDB
COMMENT = 'Tipo de salida';


-- -----------------------------------------------------
-- Table `veterinaria`.`fam_familia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`fam_familia` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`fam_familia` (
  `fam_id` INT NOT NULL,
  `fam_nombre` VARCHAR(25) NOT NULL COMMENT 'Nombre de la familia',
  `mas_fam_id` INT NOT NULL,
  PRIMARY KEY (`fam_id`, `mas_fam_id`),
  INDEX `fk_fam_familia_mas_mascotas1_idx` (`mas_fam_id` ASC),
  CONSTRAINT `fk_fam_familia_mas_mascotas1`
    FOREIGN KEY (`mas_fam_id`)
    REFERENCES `veterinaria`.`mas_mascotas` (`mas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tipo de familia de las mascotas';


-- -----------------------------------------------------
-- Table `veterinaria`.`genm_genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`genm_genero` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`genm_genero` (
  `genm_id` INT NOT NULL,
  `genm_nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre del genero de la mascota',
  `fam_genm_id` INT NOT NULL,
  PRIMARY KEY (`genm_id`, `fam_genm_id`),
  INDEX `fk_genm_genero_fam_familia1_idx` (`fam_genm_id` ASC),
  CONSTRAINT `fk_genm_genero_fam_familia1`
    FOREIGN KEY (`fam_genm_id`)
    REFERENCES `veterinaria`.`fam_familia` (`fam_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Genero de los animales';


-- -----------------------------------------------------
-- Table `veterinaria`.`infm_informacion_mascotas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`infm_informacion_mascotas` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`infm_informacion_mascotas` (
  `infm_id` INT NOT NULL AUTO_INCREMENT COMMENT 'ID de la mascota',
  `infm_nombre` VARCHAR(15) NOT NULL COMMENT 'Nombre de la mascota',
  `infm_apellido1` VARCHAR(15) NULL COMMENT '1er apellido de la mascota',
  `infm_apellido2` VARCHAR(15) NULL COMMENT '2o apellido de la mascota',
  `infm_foto` VARCHAR(45) NULL COMMENT 'Foto de la mascota',
  `infm_nacimiento` DATE NULL COMMENT 'Fecha de nacimiento de la mascota',
  `infm_descripcion` VARCHAR(100) NULL COMMENT 'Descripcion de la mascota',
  `mas_infm_id` INT NOT NULL,
  `gen_infm_id` INT NOT NULL,
  `esm_infm_id` INT NOT NULL,
  `tps_infm_id` INT NOT NULL,
  `infm_fingreso` DATE NOT NULL COMMENT 'Fecha de ingreso de la mascota',
  `infm_fsalida` DATE NULL COMMENT 'Fecha de salida de la mascota',
  `fam_infm_id` INT NOT NULL,
  `genm_infm_id` INT NOT NULL,
  PRIMARY KEY (`infm_id`, `mas_infm_id`, `gen_infm_id`, `esm_infm_id`, `tps_infm_id`, `fam_infm_id`, `genm_infm_id`),
  INDEX `fk_infm_informacion_mascotas_mas_mascotas1_idx` (`mas_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_gen_genero1_idx` (`gen_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_esm_estado_mascotas1_idx` (`esm_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_tps_tipo_salida1_idx` (`tps_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_fam_familia1_idx` (`fam_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_genm_genero1_idx` (`genm_infm_id` ASC),
  CONSTRAINT `fk_infm_informacion_mascotas_mas_mascotas1`
    FOREIGN KEY (`mas_infm_id`)
    REFERENCES `veterinaria`.`mas_mascotas` (`mas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infm_informacion_mascotas_gen_genero1`
    FOREIGN KEY (`gen_infm_id`)
    REFERENCES `veterinaria`.`gen_genero` (`gen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infm_informacion_mascotas_esm_estado_mascotas1`
    FOREIGN KEY (`esm_infm_id`)
    REFERENCES `veterinaria`.`esm_estado_mascotas` (`esm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infm_informacion_mascotas_tps_tipo_salida1`
    FOREIGN KEY (`tps_infm_id`)
    REFERENCES `veterinaria`.`tps_tipo_salida` (`tps_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infm_informacion_mascotas_fam_familia1`
    FOREIGN KEY (`fam_infm_id`)
    REFERENCES `veterinaria`.`fam_familia` (`fam_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infm_informacion_mascotas_genm_genero1`
    FOREIGN KEY (`genm_infm_id`)
    REFERENCES `veterinaria`.`genm_genero` (`genm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Datos de las mascotas';


-- -----------------------------------------------------
-- Table `veterinaria`.`cit_cita`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veterinaria`.`cit_cita` ;

CREATE TABLE IF NOT EXISTS `veterinaria`.`cit_cita` (
  `cit_id` INT NOT NULL AUTO_INCREMENT,
  `cit_fecha` DATE NOT NULL COMMENT 'Fecha de la cita de la mascota',
  `cit_hora` TIME NULL COMMENT 'Hora de la cita',
  `cit_programacion` VARCHAR(75) NOT NULL COMMENT 'Proceso programado para la cita',
  `cit_observaciones` VARCHAR(75) NULL COMMENT 'Observaciones para la cita',
  `doc_cit_id` INT NOT NULL,
  `infm_cit_id` INT NOT NULL,
  PRIMARY KEY (`cit_id`, `doc_cit_id`, `infm_cit_id`),
  INDEX `fk_cit_cita_doc_doctores1_idx` (`doc_cit_id` ASC),
  INDEX `fk_cit_cita_infm_informacion_mascotas1_idx` (`infm_cit_id` ASC),
  CONSTRAINT `fk_cit_cita_doc_doctores1`
    FOREIGN KEY (`doc_cit_id`)
    REFERENCES `veterinaria`.`doc_doctores` (`doc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cit_cita_infm_informacion_mascotas1`
    FOREIGN KEY (`infm_cit_id`)
    REFERENCES `veterinaria`.`infm_informacion_mascotas` (`infm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Citas de recibimiento mascotas';

INSERT INTO dep_departamento VALUES(1, 'San Salvador');
INSERT INTO dep_departamento VALUES(2, 'San Miguel');
INSERT INTO dep_departamento VALUES(3, 'San Vicente');
INSERT INTO dep_departamento VALUES(4, 'Santa Ana');
INSERT INTO dep_departamento VALUES(5, 'Sonsonate');
INSERT INTO dep_departamento VALUES(6, 'La Libertad');
INSERT INTO dep_departamento VALUES(7, 'La Paz');
INSERT INTO dep_departamento VALUES(8, 'La Union');
INSERT INTO dep_departamento VALUES(9, 'Cuscatlan');
INSERT INTO dep_departamento VALUES(10, 'Chalatenango');
INSERT INTO dep_departamento VALUES(11, 'Cabañas');
INSERT INTO dep_departamento VALUES(12, 'Usulutan');
INSERT INTO dep_departamento VALUES(13, 'Morazan');
INSERT INTO dep_departamento VALUES(14, 'Ahuachapan');

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Apaneca', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Atiquizaya', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Concepción de Ataco', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Refugio', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Guaymango', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jujutla', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Francisco Menéndez', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Lorenzo', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Pedro Puxtla', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tacuba', 14);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Turín', 14);



INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Cinquera', 11);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Villa Dolores', 11);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Guacotecti ', 11);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Ilobasco', 11);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jutiapa', 11);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Isidro', 11);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Sensuntepeque', 11);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tejutepeque', 11);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Victoria', 11);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Agua Caliente', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Arcatao', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Azacualpa', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Chalatenango', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Citalá', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Comalapa', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Concepción Quezaltepeque', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Dulce Nombre de María', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Carrizal', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Paraíso', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('La Laguna', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('La Palma', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('La Reina', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Las Vueltas', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nombre de Jesús', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nueva Concepción', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nueva Trinidad', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Ojos de Agua', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Potonico', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Antonio de la Cruz', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Antonio Los Ranchos', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Fernando', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Francisco Lempa', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Francisco Morazán', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Ignacio', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Isidro Labrador', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San José Cancasque', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San José Las Flores', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Luis del Carmen', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Miguel de Mercedes', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Rafael', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Rita', 10);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tejutla', 10);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Candelaria', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Cojutepeque', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Carmen', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Rosario', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Monte San Juan', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Oratorio de Concepción', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Bartolomé Perulapía', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Cristóbal', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San José Guayabal', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Pedro Perulapán', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Rafael Cedros', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Ramón', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Cruz Analquito', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Cruz Michapa', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Suchitoto', 9);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tenancingo', 9);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
