use negociowebcfp8;

drop procedure if exists JP_Articulos_Insert;

delimiter //
create procedure JP_Articulos_Insert(in 
		Pnombre varchar(40), 
        Pdescripcion varchar(150),
		Ptipo enum('PRENDA','JUGUETE','ALIMENTO','SNACK','ACCESORIO','CORREAS','MEDICAMENTO'),
        PespecieRecomendada enum('CANINO','FELINO','AVE','PEZ','ROEDOR'),
        Pcosto double,
        Pprecio double,
        Pstock int,
        PstockMinimo int,
        PstockMaximo int,
        Pcomentarios varchar(255)
)
	begin
		insert into articulos (nombre,descripcion,tipo,especieRecomendada,costo,precio,stock,stockMinimo,stockMaximo,comentarios)
		 	values
            (Pnombre,Pdescripcion, Ptipo,PespecieRecomendada,Pcosto,Pprecio,Pstock,PstockMinimo,PstockMaximo,Pcomentarios);
    end;
// delimiter ;



call JP_Articulos_Insert('Cucha','Cucha','ACCESORIO','CANINO',1200,2000,25, 5,30,'NADA');
select * from articulos;


drop procedure if exists JP_ARTICULOS_DELETE;

delimiter //
create procedure JP_ARTICULOS_DELETE(in Pid int)
	begin
		delete from articulos where id=Pid;
    end;
// delimiter ;

call JP_ARTICULOS_DELETE(3);

drop procedure if exists JP_ARTICULOS_Update;

delimiter //
create procedure JP_ARTICULOS_Update(in 
		Pid int,
		Pnombre varchar(40), 
        Pdescripcion varchar(150),
		Ptipo enum('PRENDA','JUGUETE','ALIMENTO','SNACK','ACCESORIO','CORREAS','MEDICAMENTO'),
        PespecieRecomendada enum('CANINO','FELINO','AVE','PEZ','ROEDOR'),
        Pcosto double,
        Pprecio double,
        Pstock int,
        PstockMinimo int,
        PstockMaximo int,
        Pcomentarios varchar(255)
        )
	begin
		
		update articulos set nombre=Pnombre, descripcion = Pdescripcion ,tipo = Ptipo ,especieRecomendada = PespecieRecomendada,costo= Pcosto,precio= Pprecio,
        stock=Pstock,stockMinimo=PstockMinimo,stockMaximo=PstockMaximo,comentarios=Pcomentarios
            where id=Pid;
    end;
// delimiter ;

select * from articulos;

call JP_ARTICULOS_Update(
		2,
		'Collar', 
        'Collar New',
		(select tipo from articulos where id=2),
		(select especieRecomendada from articulos where id=2),
        (select costo from articulos where id=2),
        (select precio from articulos where id=2),
        (select stock from articulos where id=2),
		(select stockMinimo from articulos where id=2),
		(select stockMaximo from articulos where id=2),
        (select comentarios from articulos where id=2)
);



