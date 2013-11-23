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
  `id_propietario` INT NOT NULL,
  `mas_infm_id` INT NOT NULL,
  `gen_infm_id` INT NOT NULL,
  `esm_infm_id` INT NOT NULL,
  `tps_infm_id` INT NOT NULL,
  `infm_fingreso` DATE NOT NULL COMMENT 'Fecha de ingreso de la mascota',
  `infm_fsalida` DATE NULL COMMENT 'Fecha de salida de la mascota',
  `fam_infm_id` INT NOT NULL,
  PRIMARY KEY (`infm_id`, `mas_infm_id`, `gen_infm_id`, `esm_infm_id`, `tps_infm_id`, `fam_infm_id`, `id_propietario`),
  INDEX `fk_infm_informacion_mascotas_mas_mascotas1_idx` (`mas_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_gen_genero1_idx` (`gen_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_esm_estado_mascotas1_idx` (`esm_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_tps_tipo_salida1_idx` (`tps_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_fam_familia1_idx` (`fam_infm_id` ASC),
  INDEX `fk_infm_informacion_mascotas_id_propietario_idx` (`id_propietario` ASC),
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
  CONSTRAINT `fk_infm_informacion_mascotas_id_propietario`
    FOREIGN KEY (`id_propietario`)
    REFERENCES `veterinaria`.`prop_propietarios` (`prop_id`)
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
  `estado` VARCHAR(75) NULL COMMENT 'Observaciones para la cita',
  `doc_cit_id` INT NOT NULL,
  `infm_cit_id` INT NOT NULL,
  PRIMARY KEY (`cit_id`, `doc_cit_id`, `infm_cit_id`),
  INDEX `fk_cit_cita_doc_doctores1_idx` (`doc_cit_id` ASC),
  INDEX `fk_cit_cita_infm_informacion_mascotas1_idx` (`infm_cit_id` ASC),
  CONSTRAINT `fk_cit_cita_doc_doctores1`
    FOREIGN KEY (`doc_cit_id`)
    REFERENCES `veterinaria`.`emp_empleados` (`emp_id`)
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

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Arambala', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Cacaopera', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Chilanga', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Corinto', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Delicias de Concepción', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Divisadero', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Rosario', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Gualococti', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Guatajiagua', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Joateca', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jocoaitique', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jocoro', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Lolotiquillo', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Meanguera', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Osicala', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Perquín', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Carlos', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Fernando', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Francisco Gotera', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Isidro', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Simón', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Sensembra', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Sociedad', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Torola', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Yamabal', 13);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Yoloaiquín', 13);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Antiguo Cuscatlán', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Chiltiupán', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Ciudad Arce', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Colón', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Comasagua', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Huizúcar', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jayaque', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jicalapa', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('La Libertad', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Tecla', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nuevo Cuscatlán', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Juan Opico', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Quezaltepeque', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Sacacoyo', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San José Villanueva', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Matías', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Pablo Tacachico', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Talnique', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tamanique', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Teotepeque', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tepecoyo', 6);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Zaragoza', 6);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Cuyultitán', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Rosario de La Paz', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jerusalén', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Mercedes La Ceiba', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Olocuilta', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Paraíso de Osorio', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Antonio Masahuat', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Emigdio', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Francisco Chinameca', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Juan Nonualco', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Juan Talpa', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Juan Tepezontes', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Luis La Herradura', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Luis Talpa', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Miguel Tepezontes', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Pedro Masahuat', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Pedro Nonualco', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Rafael Obrajuelo', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa María Ostuma', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santiago Nonualco', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tapalhuaca', 7);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Zacatecoluca', 7);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Anamorós', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Bolívar', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Concepción de Oriente', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Conchagua', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Carmen', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Sauce', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Intipucá', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('La Unión', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Lilisque', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Meanguera del Golfo', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nueva Esparta', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Pasaquina', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Polorós', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Alejo', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San José', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Rosa de Lima', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Yayantique', 8);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Yucuaiquín', 8);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Carolina', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Chapeltique', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Chinameca', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Chirilagua', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Ciudad Barrios', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Comacarán', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Tránsito', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Lolotique', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Moncagua', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nueva Guadalupe', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nuevo Edén de San Juan', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Quelepa', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Antonio del Mosco', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Gerardo', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Jorge', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Luis de la Reina', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Miguel', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Rafael Oriente', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Sesori', 2);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Uluazapa', 2);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Aguilares', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Apopa', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Ayutuxtepeque', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Delgado', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Cuscatancingo', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Paisnal', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Guazapa', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Ilopango', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Mejicanos', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nejapa', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Panchimalco', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Rosario de Mora', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Marcos', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Martín', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Salvador', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santiago Texacuangos', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santo Tomás', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Soyapango', 1);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tonacatepeque', 1);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Apastepeque', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Guadalupe', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Cayetano Istepeque', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Esteban Catarina', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Ildefonso', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Lorenzo', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Sebastián', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Vicente', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Clara', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santo Domingo', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tecoluca', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tepetitán', 3);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Verapaz', 3);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Candelaria de la Frontera', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Chalchuapa', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Coatepeque', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Congo', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Porvenir', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Masahuat', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Metapán', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Antonio Pajonal', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Sebastián Salitrillo', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Ana', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Rosa Guachipilín', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santiago de la Frontera', 4);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Texistepeque', 4);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Acajutla', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Armenia', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Caluco', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Cuisnahuat', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Izalco', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Juayúa', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nahuizalco', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nahulingo', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Salcoatitán', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Antonio del Monte', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Julián', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Catarina Masahuat', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Isabel Ishuatán', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santo Domingo de Guzmán', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Sonsonate', 5);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Sonzacate', 5);

INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Alegría', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Berlín', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('California', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Concepción Batres', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('El Triunfo', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Ereguayquín', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Estanzuelas', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jiquilisco', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jucuapa', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Jucuarán', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Mercedes Umaña', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Nueva Granada', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Ozatlán', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Puerto El Triunfo', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Agustín', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Buenaventura', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Dionisio', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('San Francisco Javier', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa Elena', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santa María', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Santiago de María', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Tecapán', 12);
INSERT INTO mun_municipio (mun_nombre, dep_mun_id) VALUES('Usulután', 12);

INSERT INTO gen_genero VALUES(1,'M');
INSERT INTO gen_genero VALUES(2,'F');

INSERT INTO car_cargos VALUES(1,'Admin');
INSERT INTO car_cargos VALUES(2,'Secretaria');
INSERT INTO car_cargos VALUES(3,'Doctor');

INSERT INTO esp_especializaciones VALUES(1, 'Veterinaria general', 'Este se encarga de examinar la mayoria de especies.');
INSERT INTO esp_especializaciones VALUES(2, 'Veterinaria para especies grandes', 'Este se encarga de examinar animales de un tamaño grande por lo general no domestico.');
INSERT INTO esp_especializaciones VALUES(3, 'Veterinaria para especies pequeñas', 'Este se encarga de examinar animales de un tamaño pequeño por lo general domestico.');
INSERT INTO esp_especializaciones VALUES(4, 'Veterinaria para especies silvestres', 'Este se encarga de examinar animales no domestico por lo general exoticos.');

INSERT INTO esm_estado_mascotas VALUES(1, 'Enfermo');
INSERT INTO esm_estado_mascotas VALUES(2, 'Sano');
INSERT INTO esm_estado_mascotas VALUES(3, 'Fallecido');
INSERT INTO esm_estado_mascotas VALUES(4, 'Extraviado');

INSERT INTO tps_tipo_salida VALUES(1, 'Tratamiento');
INSERT INTO tps_tipo_salida VALUES(2, 'Alta');
INSERT INTO tps_tipo_salida VALUES(3, 'Cuidado Intensivo');
INSERT INTO tps_tipo_salida VALUES(4, 'Control'); 	
	
INSERT INTO mas_mascotas VALUES(1, 'Mamiferos');
INSERT INTO mas_mascotas VALUES(2, 'Aves');
INSERT INTO mas_mascotas VALUES(3, 'Reptiles');

INSERT INTO fam_familia	VALUES(1, 'Lagartos', 3);
INSERT INTO fam_familia	VALUES(2, 'Serpientes', 3);
INSERT INTO fam_familia	VALUES(3, 'Tortugas', 3);
INSERT INTO fam_familia	VALUES(4, 'Perros', 1);
INSERT INTO fam_familia	VALUES(5, 'Gatos', 1);
INSERT INTO fam_familia	VALUES(6, 'Ardillas', 1);
INSERT INTO fam_familia	VALUES(7, 'Loros', 2);
INSERT INTO fam_familia	VALUES(8, 'Pericos', 2);
INSERT INTO fam_familia	VALUES(9, 'Patos', 2);

INSERT INTO `veterinaria`.`emp_empleados` (`emp_id`, `emp_nombre1`, `emp_nombre2`, `emp_apellido1`, `emp_apellido2`, `emp_fotoemp`, `emp_direccion`, `emp_telcasa`, `emp_telcelular`, `emp_email`, `emp_dui`, `emp_nit`, `emp_isss`, `emp_licconducir`, `dep_emp_id`, `gen_genero_gen_id`, `esp_emp_id`, `car_emp_id`) VALUES (NULL, 'Hector', 'Alonso', 'Mendez', 'Orantes', NULL, 'San Martin, San Salvador', '', NULL, NULL, '12345678-9', '1231-12341223-123', NULL, NULL, '1', '1', '1', '1');
INSERT INTO `veterinaria`.`emp_empleados` (`emp_id`, `emp_nombre1`, `emp_nombre2`, `emp_apellido1`, `emp_apellido2`, `emp_fotoemp`, `emp_direccion`, `emp_telcasa`, `emp_telcelular`, `emp_email`, `emp_dui`, `emp_nit`, `emp_isss`, `emp_licconducir`, `dep_emp_id`, `gen_genero_gen_id`, `esp_emp_id`, `car_emp_id`) VALUES (NULL, 'Jose', 'Absalon', 'Martinez', 'Rofriguez', NULL, 'Soyapando, San Salvador', '', NULL, NULL, '12345678-2', '1221-12342223-123', NULL, NULL, '1', '1', '1', '2');
INSERT INTO `veterinaria`.`emp_empleados` (`emp_id`, `emp_nombre1`, `emp_nombre2`, `emp_apellido1`, `emp_apellido2`, `emp_fotoemp`, `emp_direccion`, `emp_telcasa`, `emp_telcelular`, `emp_email`, `emp_dui`, `emp_nit`, `emp_isss`, `emp_licconducir`, `dep_emp_id`, `gen_genero_gen_id`, `esp_emp_id`, `car_emp_id`) VALUES (NULL, 'Maria', 'Roxana', 'Iraeta', 'Munios', NULL, 'Santa Tecla, San Salvador', '', NULL, NULL, '12445678-4', '1333-12341223-000', NULL, NULL, '1', '2', '1', '3');
INSERT INTO `veterinaria`.`emp_empleados` (`emp_id`, `emp_nombre1`, `emp_nombre2`, `emp_apellido1`, `emp_apellido2`, `emp_fotoemp`, `emp_direccion`, `emp_telcasa`, `emp_telcelular`, `emp_email`, `emp_dui`, `emp_nit`, `emp_isss`, `emp_licconducir`, `dep_emp_id`, `gen_genero_gen_id`, `esp_emp_id`, `car_emp_id`) VALUES (NULL, 'Miguel', 'Liua', 'Iraeta', 'Munios', NULL, 'Santa Tecla, San Salvador', '', NULL, NULL, '12445678-4', '1333-12341223-000', NULL, NULL, '1', '1', '1', '3');

INSERT INTO `veterinaria`.`usr_usuarios` (`usr_id`, `usr_username`, `usr_passwd`, `usr_accesibilidad`, `emp_usr_id`) VALUES (NULL, 'admin', '123456', '1', '1');

INSERT INTO `veterinaria`.`prop_propietarios` (`prop_id`, `prop_nombre1`, `prop_nombre2`, `prop_apellido1`, `prop_apellido2`, `prop_fnacimiento`, `prop_direccion`, `prop_telcasa`, `prop_telcel`, `prop_teltrabajo`, `prop_email`, `prop_dui`, `prop_nit`, `prop_regfiscal`, `gen_genero_gen_id`) VALUES (NULL, 'Jose', 'Santiago', 'Burgo', 'Mejia', '1987-10-14', 'Santa Tecla, San Salvador', '2342-4532', NULL, NULL, NULL, '12345678-0', '123-21333213-1222', NULL, '1');

INSERT INTO `veterinaria`.`infm_informacion_mascotas` (`infm_id`, `infm_nombre`, `infm_apellido1`, `infm_apellido2`, `infm_foto`, `infm_nacimiento`, `infm_descripcion`, `id_propietario`, `mas_infm_id`, `gen_infm_id`, `esm_infm_id`, `tps_infm_id`, `infm_fingreso`, `infm_fsalida`, `fam_infm_id`) VALUES (NULL, 'perski', NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', '1', '2013-11-25', NULL, '1');

INSERT INTO `veterinaria`.`infm_informacion_mascotas` (`infm_id`, `infm_nombre`, `infm_apellido1`, `infm_apellido2`, `infm_foto`, `infm_nacimiento`, `infm_descripcion`, `id_propietario`, `mas_infm_id`, `gen_infm_id`, `esm_infm_id`, `tps_infm_id`, `infm_fingreso`, `infm_fsalida`, `fam_infm_id`) VALUES (NULL, 'doski', NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', '1', '2013-11-25', NULL, '1');

INSERT INTO `veterinaria`.`cit_cita` (`cit_id`, `cit_fecha`, `cit_hora`, `cit_programacion`, `estado`, `doc_cit_id`, `infm_cit_id`) VALUES (NULL, '2013-11-28', NULL, 'Consulta general', 'Pendiente', '1', '1');
INSERT INTO `veterinaria`.`cit_cita` (`cit_id`, `cit_fecha`, `cit_hora`, `cit_programacion`, `estado`, `doc_cit_id`, `infm_cit_id`) VALUES (NULL, '2013-01-28', NULL, 'Consulta general', 'Finalizada', '1', '1');
INSERT INTO `veterinaria`.`cit_cita` (`cit_id`, `cit_fecha`, `cit_hora`, `cit_programacion`, `estado`, `doc_cit_id`, `infm_cit_id`) VALUES (NULL, '2013-12-28', NULL, 'Consulta general', 'Programada', '1', '1');
INSERT INTO `veterinaria`.`cit_cita` (`cit_id`, `cit_fecha`, `cit_hora`, `cit_programacion`, `estado`, `doc_cit_id`, `infm_cit_id`) VALUES (NULL, '2012-12-28', NULL, 'Consulta general', 'Perdida', '1', '1');
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
