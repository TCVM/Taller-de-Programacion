program ejer4p5;
type
	rango=1..7;
	ventas=record
		dia:rango;
		cod,asiento:integer;
		monto:real;
	end;
	
	lista=^nodo;
	nodo=record
		dato:ventas;
		sig:lista;
	end;
	
	entradaM = record
		cant:integer;
		codigo:integer;
		end;
		
	listaM = ^nodoM;
	
	nodoM = record
		sig:listaM;
		dato:entradaM;
		end;
		
	vector=array[rango]of lista;

//////////////////////////////////A////////////////////////////////////
	
procedure cargar(var v:vector);
	procedure ini(var v:vector);
		var 
			i:integer;
		begin
			for i:=1 to 7 do v[i]:=nil;
		end;
	procedure leer(var v:ventas);
		begin
			writeln('ingrese cod');readln(v.cod);
			if(v.cod<>0)then begin
				writeln('ingrese dia');readln(v.dia);
				writeln('ingrese asiento');readln(v.asiento);
				writeln('ingrese monto');readln(v.monto);
			end;
		end;
	procedure insertarordenado(var l:lista;v:ventas);
	var 
		aux,ant,act:lista;
	begin
		new(aux);ant:=l;act:=l;
		while(act<>nil)and(l^.dato.cod<v.cod)do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(l=act)then l:=aux
		else
			ant^.sig:=aux;
			aux^.sig:=act;
	end;
	
	var
		vs:ventas;
	begin
		ini(v);
		leer(vs);
		while(vs.cod<>0)do begin
			insertarordenado(v[vs.dia].vs);
			leer(vs);
		end;
	end;
	
//////////////////////////////////A////////////////////////////////////

//////////////////////////////////B////////////////////////////////////

procedure merge(var l:listaM;v:vector);
	procedure minimo(var v:vector;var min:integer);
		var i,indice:rango;
		begin
			min:=999;
			for i:=1 to 7 do begin
				if(v[i]<>nil)then
					if(v[i]^.dato.cod<min)then begin
						min:=v[i]^.dato.cod;
						indice:=i;
					end;
				if(min<>999)then begin
					v[indice]:=v[indice]^.sig;
				end;
			end;
		end;

//////////////////////////////////B////////////////////////////////////

BEGIN
	
	
END.

