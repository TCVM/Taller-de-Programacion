program eje2;
type
	rangoAnio=2010..2018;
	cad50=string[50];
	tAuto=record
		patente:integer;
		anio:rangoAnio;
		marca:cad50;
		modelo:cad50;
	end;
	
	arbol=^nodo;
	nodo=record
		datos:tAuto;
		hi:arbol;
		hd:arbol;
	end;

procedure	cargarVenta(var a:arbol);
	procedure	leerVenta(var tA:tAuto);
		begin
			write('Ingrese la pantente: ');
			readln(tA.patente);
			if(tA.patente<>-1)then begin
				write('Ingrese el anio de fabricacion: ');
				readln(tA.anio);
				write('Ingrese la marca: ');
				readln(tA.marca);
				write('Ingrese el modelo: ');
				readln(tA.modelo);
			end;
		end;
		procedure	crear(var a:arbol;tA:tAuto);
			begin
				if(a=nil)then begin
					new(a);
					a^.datos:=tA;
					a^.hi:=nil;
					a^.hd:=nil;
				end
				else
					if(tA.patente<a^.datos.patente)then
						crear(a^.hi,tA)
					else
						crear(a^.hd,tA);
			end;
	var
		tA:tAuto;	
	begin
		leerVenta(tA);
		while(tA.patente<>-1)do begin
			crear(A,tA);
			leerVenta(tA);
		end;
	end;

procedure	 marcaAgencia(a:arbol;marca:cad50;var cantMarca:integer);
	begin
		if(a<>nil)then begin
			if(a^.datos.marca=marca)then
				cantMarca:=cantMarca+1;
			marcaAgencia(a^.hi,marca,cantMarca);
			marcaAgencia(a^.hd,marca,cantMarca);
		end;
	end;

procedure	imprimir(a:arbol);
	begin
		if(a<>nil)then begin
			writeln('');
			writeln('Patente: ',a^.datos.patente);
			writeln('Anio: ',a^.datos.anio);
			writeln('Marca: ',a^.datos.marca);
			writeln('Modelo: ',a^.datos.modelo);
			imprimir(a^.hi);
			imprimir(a^.hd);
		end;
			
	end;
	
var
	A:arbol;
	marca:cad50;
	cantMarca:integer;
begin
	cantMarca:=0;
	cargarVenta(A);
	imprimir(A);
	writeln('');
	write('Ingrese una marca: ');
	readln(marca);
	marcaAgencia(A,marca,cantMarca);
	writeln('Cant marca:  ',cantMarca);
end.		
