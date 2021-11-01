use negociowebcfp8;

drop table if exists control_tablas;
create table control_tablas(
	id int auto_increment primary key,
    tabla varchar(30) not null,
    accion enum('insert','delete','update') not null,
    fecha date not null,
    hora time not null,
    usuario varchar(20),
    terminal varchar(100),
    idRegistro int not null
);

drop trigger if exists JP_Articulos_Insert;
delimiter //
create trigger JP_Articulos_Insert
	after insert
    on articulos for each row
    begin
		insert into control_tablas (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values 
        ('articulos','insert',current_date(),current_time(),current_user(), 
			(select user()),new.id);
    end;
// delimiter ;
call JP_Articulos_Insert('Pelota Blue','Pelota de Goma','ACCESORIO','CANINO',120,200,25, 5,30,'NADA');
show global variables;



select user();
select session_user();
select system_user();

select * from control_tablas;
select * from articulos;
show tables;

drop trigger if exists JP_Articulos_Delete;

delimiter //
create trigger JP_Articulos_Delete
	after delete
    on articulos for each row
    begin
		insert into control_tablas (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values 
        ('articulos','delete',current_date(),current_time(),current_user(), 
			(select user()),old.id);
    end;
// delimiter ;

select * from articulos;
delete from articulos where id=3;
select * from control_tablas;
drop trigger if exists JP_Articulos_Delete;


drop trigger if exists JP_Articulos_Update;

delimiter //
	create trigger JP_Articulos_Update
    after update on articulos for each row
    begin
		insert into control_tablas (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values 
        ('articulos','update',current_date(),current_time(),current_user(), 
			(select user()),old.id);
    end;
// delimiter ;

update articulos set nombre='Collar New',descripcion='Collar new Gatitos' where id=6;

