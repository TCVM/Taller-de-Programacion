(*1.- Implementar un programa que procese la información de las ventas de productos de un comercio (como máximo 20). 
De cada venta se conoce código del producto (entre 1 y 15) y cantidad vendida (como máximo 99 unidades).  El ingreso de las ventas finaliza con el código 0 (no se procesa).
a. Almacenar la información de las ventas en un vector. El código debe generarse automáticamente (random) y la cantidad se debe leer. 
b. Mostrar el contenido del vector resultante.
c. Ordenar el vector de ventas por código.
d. Mostrar el contenido del vector resultante.
e. Eliminar del vector ordenado las ventas con código de producto entre dos valores que se ingresan como parámetros. 
f. Mostrar el contenido del vector resultante.
g. Generar una lista ordenada por código de producto de menor a mayor a partir del vector resultante del inciso e., sólo para los códigos pares.
h. Mostrar la lista resultante.*)

program eje01;
const 
	dimf=20;
	max2=99;
	
type
	venta=record
			cod,cant:integer;
		end;
	vector=array[1..3]of venta;
	lista=^nodo;
	nodo=record
			dato:venta;
			sig:lista;
		end;
procedure cargar(var v:vector;var diml:integer);
	procedure leer(var v:venta);
		begin
			Randomize;
			writeln('ingrese cod');
			v.cod:=Random(15);
			writeln(v.cod);
			if (v.cod <> 0)then begin
				repeat
					writeln('Ingrese cant');
					readln(v.cant);
					if(v.cant>max2)then writeln('mayor al maximo');
				until(v.cant<=max2)
			end;
		end;
	var 
		Aventa:venta;
	begin
		diml:=0;
		leer(Aventa);
		while(Aventa.cod <>0) and (diml<=dimf)do begin
			diml:=diml+1;
			v[diml]:=Aventa;
			leer(Aventa);
		end;
	end;
procedure imprimir(v:vector;diml:integer);
	var i:integer;
	begin
		writeln('-------------------');
		for i:=1 to diml do  begin
			writeln('codigo: ',v[i].cod);
			writeln('cantidad: ',v[i].cant);
		end;
	end;

procedure Ordenar(var v:vector;diml:integer);
	var
		aux:venta;
		i,j,p:integer;
	begin
			for i:=1 to diml-1 do begin
				p:=i;
				for j:= i + 1 to diml do if v[j].cod<v[p].cod then p:=j;
				aux:=v[p];
				v[p]:=v[i];
				v[i]:=aux;
			end;
	end;
procedure eliminar(param1,param2:integer;var v:vector;var diml:integer);
	var
		i,j,cont:integer;
	begin
		j:=0;
		if ((param1>=1)and(param2<=diml))then begin
			for i:=param2+1 to diml do begin
				v[param1+j]:=v[i];
				j:=j+1; 
			end;
			cont:=param2-param1-1;
		end;
		diml:=diml-cont;
	end;
procedure crearlista(var l:lista;v:vector;diml:integer);
	procedure agregarnodo(var l:lista;d:venta);
		var
			nue:lista;
		begin
			new(nue);
			nue^.dato:=d;
			nue^.sig:=l;
			l:=nue;
		end;
	function par(val:integer):boolean;
		begin
			if (val MOD 2= 0)then par:=true
			else par:=false;
		end;
	var
		i:integer;
	begin
		for i:=diml downto 1 do begin
			if(par(v[i].cod))then agregarnodo(l,v[i]);
		end;
	end;
var
	l:lista;
	v:vector;
	diml,param1,param2:integer;
begin
	l:=nil;
	cargar(v,diml);
	imprimir(v,diml);
	ordenar(v,diml);
	imprimir(v,diml);
	writeln('ingrese parametro entre 1 y ',diml);
	readln(param2);
	writeln('ingrese parametro entre 1 y ',param2-1);
	readln(param1);
	eliminar(param1,param2,v,diml);
	imprimir(v,diml);
	crearlista(l,v,diml);
	imprimir(v,diml);
end.
