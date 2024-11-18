{
   3.	Implementar un programa que procese la información de las ventas de productos de una librería que tiene 4 sucursales. De cada 
		venta se lee fecha de venta, código del producto vendido, código de sucursal y cantidad vendida. El ingreso de las ventas finaliza 
		cuando se lee el código de sucursal 0. Implementar un programa que:
		a.	Almacene las ventas ordenadas por código de producto y agrupados por sucursal, en una estructura de datos adecuada.
		b.	Contenga un módulo que reciba la estructura generada en el punto a y retorne una estructura donde esté acumulada la cantidad 
			total vendida para cada código de producto.

   
   
}


program untitled;
type
	venta=record
		fecha,codV,codS,cant:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:venta;
		sig:lista;
	end;
	lista2=^nodo2;
	nodo2=record
		cod,cant:integer;
		sig:lista2;
	end;
	vector=array[1..4]of lista;
procedure cargarvector(var v:vector);
	procedure leer(var v:venta);
		begin
			writeln('ingrese cod sucursal');readln(v.codS);
			if(v.codS<>0)then begin
				writeln('fecha');readln(v.fecha);
				writeln('cod venta');readln(v.codV);
				writeln('cant');readln(v.cant);
			end;
		end;
		procedure insertarOrdenado(var l:lista;v:venta);
			var
				aux,ant,act:lista;
			begin
				new(aux);
				aux^.dato:=v;
				act:=l;ant:=l;
				while(act<>nil)and(act^.dato.codV<v.codV)do begin
					ant:=act;
					act:=act^.sig;
				end;
				if(act=ant)then l:=aux
				else
					ant^.sig:=aux;
					aux^.sig:=act;
			end;
	procedure inicializar(var v:vector);
		var
			i:integer;
		begin
			for i:=1 to 4 do v[i]:=nil;
		end;
	var
		vs:venta;
	begin
		inicializar(v);
		leer(vs);
		while(vs.codS<>0)do begin
			insertarOrdenado(v[vs.codS],vs);
			leer(vs);
		end;
	end;
	
procedure merge(v:vector;var l:lista2);
	procedure minimo(v:vector;var min,cant,cod:integer);
		var
			i,indicemin:integer;
		begin
			min:=999;
			cant:=0;
			for i:=1 to 4 do
				if(v[i]<>nil)then
					if(v[i]^.dato.codV<min)then begin
						min:=v[i]^.dato.codV;
						indicemin:=i;
					end;
			if(min<>999)then begin
				cant:=v[indicemin]^.dato.cant;
				cod:=v[indicemin]^.dato.codS;
				v[indicemin]:=v[indicemin]^.sig;
			end;
		end;
	procedure insertarOrdenado2(var l:lista2;cod,cant:integer);
			var
				aux,ant,act:lista2;
			begin
				new(aux);
				aux^.cod:=cod;
				aux^.cant:=cant;
				act:=l;ant:=l;
				while(act<>nil)and(act^.cod<cod)do begin
					ant:=act;
					act:=act^.sig;
				end;
				if(act=ant)then l:=aux
				else
					ant^.sig:=aux;
					aux^.sig:=act;
			end;
	var
		min,actual,cant,cantT,cod:integer;
	begin
		l:=nil;
		cantT:=0;
		minimo(v,min,cod,cant);
		while(min<>999)do begin
			actual:=cod;
			cantT:=0;
			while(min<>999)and(actual=cod)do begin
				cantT:=cantT+cant;
				minimo(v,min,cod,cant);
			end;
			insertarOrdenado2(l,actual,cant);
		end;
	end;
var 
	v:vector;
	l:lista2;
BEGIN
	cargarvector(v);
	merge(v,l)
END.

