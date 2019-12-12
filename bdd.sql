
CREATE TABLE CATEGORIA (
                Id_categoria INT AUTO_INCREMENT NOT NULL,
                Descripcion VARCHAR(50) NOT NULL,
                PRIMARY KEY (Id_categoria)
);


CREATE TABLE PELICULA (
                Id_pelicula INT AUTO_INCREMENT NOT NULL,
                Nombre VARCHAR(300) NOT NULL,
                Minutos INT NOT NULL,
                Cartelera LONGBLOB NOT NULL,
                Id_categoria INT NOT NULL,
                PRIMARY KEY (Id_pelicula)
);


ALTER TABLE PELICULA ADD CONSTRAINT categoria_pelicula_fk
FOREIGN KEY (Id_categoria)
REFERENCES CATEGORIA (Id_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

INSERT INTO `categoria`(`Descripcion`) VALUES ('ACCION');
INSERT INTO `categoria`(`Descripcion`) VALUES ('TERROR');
INSERT INTO `categoria`(`Descripcion`) VALUES ('COMEDIA');
INSERT INTO `categoria`(`Descripcion`) VALUES ('ROMANCE');
