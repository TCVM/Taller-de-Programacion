{
   2.- Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la información de los autos en venta.
	Implementar un programa que:
		a)	Genere un árbol binario de búsqueda ordenado por patente identificatoria del auto en venta. Cada nodo del árbol debe contener 
			patente, año de fabricación (2010..2018), la marca y el modelo.
		b)	Invoque a un módulo que reciba el árbol generado en a) y una marca y retorne la cantidad de autos de dicha marca que posee la 
			agencia. Mostrar el resultado. 
		c)	Invoque a un módulo que reciba el árbol generado en a) y retorne una estructura con la información de los autos agrupados por 
			año de fabricación.
		d)	Contenga un módulo que reciba el árbol generado en a) y una patente y devuelva el año de fabricación del auto con dicha patente. 
			Mostrar el resultado. 
																																		
   
}


program untitled;
type
	rango=2010..2018;
	auto=record
		patente:integer;
		modelo,marca:string;
		anio:rango;
	end;
	arbol=^nodo;
	nodo=record
		dato:auto;
		HI,HD:arbol;
	end;
	lista=^nodol;
	nodol=record
		dato:auto;
		sig:lista;
	end;
	vector=array[rango]of lista;
procedure creararbol(var a:arbol);
	procedure leer(var a:auto);
		begin
			writeln('ingrese patente');readln(a.patente);
			if(a.patente<>-1)then begin
				writeln('modelo');readln(a.modelo);
				writeln('marca');readln(a.marca);
				writeln('anio');readln(a.anio);
			end;
		end;
	procedure agregarnodo(var a:arbol;at:auto);
		begin
			if(a=nil)then begin
				new(a);
				a^.dato:=at;
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else
				if(at.patente<a^.dato.patente)then agregarnodo(a^.HI,at)
				else agregarnodo(a^.HD,at);
		end;
	var
		at:auto;
	begin
		leer(at);
		while(at.patente<>-1)do begin
			agregarnodo(a,at);
			leer(at);
		end;
	end;

procedure buscar(a:arbol;var cont:integer);
	procedure recursion(a:arbol;var cont:integer;marca:string);
		begin
			if(a<>nil)then begin
				if(a^.dato.marca=marca)then cont:=cont+1;
				recursion(a^.HI,cont,marca);
				recursion(a^.HD,cont,marca);
			end;
		end;
	var
		marca:string;
	begin
		writeln('ingrese marca a buscar');readln(marca);
		recursion(a,cont,marca);
		writeln('cantidad de autos de ',marca,': ',cont);
	end;

procedure cargarvector(var v:vector;a:arbol);
	procedure recursion(var v:vector;a:arbol);
		begin
			if(a<>nil)then begin
				v[a^.dato.anio]^.dato:=a^.dato;
				recursion(v,a^.HI);
				recursion(v,a^.HD);
			end;
		end;
		
	procedure inicializar(var v:vector);
		var
			i:integer;
		begin
			for i:=2010 to 2018 do v[i]:=nil;
		end;
		
	begin
		inicializar(v);
		recursion(v,a);
	end;
procedure aprovecharelorden(a:arbol;var anio:rango);
	function recursion(a:arbol;patente:integer):rango;
		begin
			if(a=nil)then recursion:=0
			else
				if(a^.dato.patente=patente)then recursion:=a^.dato.anio
				else
					if(a^.dato.patente>patente)then recursion:=recursion(a^.HI,patente)
					else recursion:=recursion(a^.HD,patente);
		end;
	var
		patente:integer;
	begin
		writeln('ingrese patente a buscar');readln(patente);
		anio:=recursion(a,patente);
	end;
var 
	a:arbol;
	cantAutosMarca:integer;
	anio:rango;
	v:vector;
BEGIN
	a:=nil;
	cantAutosMarca:=0;
	creararbol(a);
	buscar(a,cantAutosMarca);
	cargarvector(v,a);
	writeln('anio de la patente ingresada: ',anio);
END.

