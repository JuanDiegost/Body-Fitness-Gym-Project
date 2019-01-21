/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     20/1/2019 18:54:24                           */
/*==============================================================*/


drop table if exists ALUMNO;

drop table if exists ASISTENCIA;

drop table if exists CLASE;

drop table if exists ENTRENADOR;

drop table if exists HISTORIAL_MEDICO;

drop table if exists HISTORIAL_PROGRESO;

drop table if exists MOVIMIENTOS_DE_CAJA;

drop table if exists PREGUNTAS;

drop table if exists PROGRESO;

drop table if exists SERVICIO;

drop table if exists SUSCRIPCION;

/*==============================================================*/
/* Table: ALUMNO                                                */
/*==============================================================*/
create table ALUMNO
(
   ID_ALUMNO            numeric(8,0) not null,
   DNI_ALUMNO           varchar(1024),
   NOMBRE_ALUMNO        varchar(1024),
   TELEFONO_ALUMNO      varchar(1024),
   EMAIL_ALUMNO         varchar(1024),
   USUARIO_ALUMNO       varchar(1024),
   CONTRASENIA          varchar(1024),
   FECHA_NACIMIENTO     date,
   GENERO               char(1),
   primary key (ID_ALUMNO)
);

/*==============================================================*/
/* Table: ASISTENCIA                                            */
/*==============================================================*/
create table ASISTENCIA
(
   ID_ALUMNO            numeric(8,0) not null,
   ID_CLASE             numeric(8,0) not null,
   primary key (ID_ALUMNO, ID_CLASE)
);

/*==============================================================*/
/* Table: CLASE                                                 */
/*==============================================================*/
create table CLASE
(
   ID_CLASE             numeric(8,0) not null,
   ID_ENTRENADOR        numeric(8,0),
   ID_SERVICIO          numeric(8,0),
   DIA                  date,
   HORA_INICIO          time,
   HORA_FIN             time,
   CUPOS                numeric(8,0),
   primary key (ID_CLASE)
);

/*==============================================================*/
/* Table: ENTRENADOR                                            */
/*==============================================================*/
create table ENTRENADOR
(
   ID_ENTRENADOR        numeric(8,0) not null,
   DNI_ENTRENADOR       varchar(64),
   NOMBRE_ENTRENADOR    varchar(256),
   TELEFONO_ENTRENADOR  varchar(64),
   EMAIL_ENTRENADOR     varchar(64),
   primary key (ID_ENTRENADOR)
);

/*==============================================================*/
/* Table: HISTORIAL_MEDICO                                      */
/*==============================================================*/
create table HISTORIAL_MEDICO
(
   ID_ALUMNO            numeric(8,0) not null,
   ID_PREGUNTA          numeric(8,0) not null,
   primary key (ID_ALUMNO, ID_PREGUNTA)
);

/*==============================================================*/
/* Table: HISTORIAL_PROGRESO                                    */
/*==============================================================*/
create table HISTORIAL_PROGRESO
(
   ID_ALUMNO            numeric(8,0) not null,
   ID_PROGRESO          numeric(8,0) not null,
   INFORME              varchar(128),
   primary key (ID_ALUMNO, ID_PROGRESO)
);

/*==============================================================*/
/* Table: MOVIMIENTOS_DE_CAJA                                   */
/*==============================================================*/
create table MOVIMIENTOS_DE_CAJA
(
   ID_SERVICIO          numeric(8,0) not null,
   ID_MOVIMIENTO        numeric(8,0) not null,
   DESCRIPCION_MOVIMIENTO varchar(256),
   VALOR                float,
   TIPO                 varchar(32),
   primary key (ID_MOVIMIENTO)
);

/*==============================================================*/
/* Table: PREGUNTAS                                             */
/*==============================================================*/
create table PREGUNTAS
(
   ID_PREGUNTA          numeric(8,0) not null,
   NOMBRE_PREGUNTA      varchar(128),
   DESCRIPCION_PREGUNTA varchar(256),
   primary key (ID_PREGUNTA)
);

/*==============================================================*/
/* Table: PROGRESO                                              */
/*==============================================================*/
create table PROGRESO
(
   ID_PROGRESO          numeric(8,0) not null,
   NOMBRE_PROGRESO      varchar(128),
   UNIDAD_MEDIDA        varchar(128),
   primary key (ID_PROGRESO)
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO
(
   ID_SERVICIO          numeric(8,0) not null,
   NOMBRE_SERVICIO      varchar(128),
   DESCRIPCION_SERVICIO varchar(256),
   PRECIO               float,
   TIPO_SERVICIO        varchar(32),
   primary key (ID_SERVICIO)
);

/*==============================================================*/
/* Table: SUSCRIPCION                                           */
/*==============================================================*/
create table SUSCRIPCION
(
   ID_SERVICIO          numeric(8,0) not null,
   ID_MOVIMIENTO        numeric(8,0),
   ID_SUSCRIPCION       numeric(8,0),
   FECHA_INICIO         date,
   FECHA_FIN            date,
   SESIONES             numeric(8,0),
   primary key (ID_SERVICIO)
);

alter table ASISTENCIA add constraint FK_RELATIONSHIP_4 foreign key (ID_CLASE)
      references CLASE (ID_CLASE) on delete restrict on update restrict;

alter table ASISTENCIA add constraint FK_RELATIONSHIP_5 foreign key (ID_ALUMNO)
      references ALUMNO (ID_ALUMNO) on delete restrict on update restrict;

alter table CLASE add constraint FK_RELATIONSHIP_3 foreign key (ID_ENTRENADOR)
      references ENTRENADOR (ID_ENTRENADOR) on delete restrict on update restrict;

alter table CLASE add constraint FK_RELATIONSHIP_8 foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO) on delete restrict on update restrict;

alter table HISTORIAL_MEDICO add constraint FK_RELATIONSHIP_1 foreign key (ID_PREGUNTA)
      references PREGUNTAS (ID_PREGUNTA) on delete restrict on update restrict;

alter table HISTORIAL_MEDICO add constraint FK_RELATIONSHIP_2 foreign key (ID_ALUMNO)
      references ALUMNO (ID_ALUMNO) on delete restrict on update restrict;

alter table HISTORIAL_PROGRESO add constraint FK_RELATIONSHIP_10 foreign key (ID_ALUMNO)
      references ALUMNO (ID_ALUMNO) on delete restrict on update restrict;

alter table HISTORIAL_PROGRESO add constraint FK_RELATIONSHIP_9 foreign key (ID_PROGRESO)
      references PROGRESO (ID_PROGRESO) on delete restrict on update restrict;

alter table MOVIMIENTOS_DE_CAJA add constraint FK_RELATIONSHIP_11 foreign key (ID_SERVICIO)
      references SUSCRIPCION (ID_SERVICIO) on delete restrict on update restrict;

alter table SUSCRIPCION add constraint FK_RELATIONSHIP_6 foreign key (ID_MOVIMIENTO)
      references MOVIMIENTOS_DE_CAJA (ID_MOVIMIENTO) on delete restrict on update restrict;

alter table SUSCRIPCION add constraint FK_RELATIONSHIP_7 foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO) on delete restrict on update restrict;

