{
   4.	Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. Se desea 
		procesar la información de una semana. Implementar un programa que:
		a.	Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, 
			asiento y monto. La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de 
			forma ascendente. 
		b.	Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de 
			obra de forma ascendente.

}


program untitled;
type
	entrada=record
		dia,cod,asiento:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		dato:entrada;
		sig:lista;
	end;
	vector=array[1..7]of lista;
	lista2=^nodo2;
	nodo2=record
		cod,cant:integer;
		sig:lista2;
	end;
procedure cargarvector(var v:vector);
	procedure insertarOrdenado(var l:lista;e:entrada);
		var
			ant,act,aux:lista;
		begin
			new(aux);
			aux^.dato:=e;
			act:=l;ant:=l;
			while(act<>nil)and(e.cod>act^.dato.cod)do begin
				ant:=act;
				act:=act^.sig;
			end;
			if(act=ant)then l:=aux
			else begin
				ant^.sig:=aux;
				aux^.sig:=act;
			end;
		end;
	procedure leer(var e:entrada);
		begin
			writeln('cod');readln(e.cod);
			if(e.cod<>0)then begin
				writeln('dia');readln(e.dia);
				writeln('asiento');readln(e.asiento);
				writeln('monto');readln(e.monto);
			end;
		end;
	procedure inicializar(var v:vector);
		var
			i:integer;
		begin
			for i:=1 to 7 do v[i]:=nil;
		end;
	var
		e:entrada;
	begin
		inicializar(v);
		leer(e);
		while(e.cod<>0)do begin
			insertarOrdenado(v[e.dia],e);
			leer(e);
		end;
	end;
procedure merge(v:vector;var l:lista2);
	procedure insertarOrdenado2(var l:lista2;cod,cant:integer);
		var
				ant,act,aux:lista2;
			begin
				new(aux);
				aux^.cod:=cod;
				aux^.cant:=cant;
				act:=l;ant:=l;
				while(act<>nil)and(cod>act^.cod)do begin
					ant:=act;
					act:=act^.sig;
				end;
				if(act=ant)then l:=aux
				else begin
					ant^.sig:=aux;
					aux^.sig:=act;
				end;
			end;
	procedure minimo(v:vector;var min,cant,cod:integer);
		var
			indice,i:integer;
		begin
			cant:=0;
			min:=999;
			for i:=1 to 7 do
				if(v[i]<>nil)then
					if(v[i]^.dato.cod>min)then begin
						indice:=i;
						min:=v[i]^.dato.cod;
					end;
			if(min<>999)then begin
				cod:=v[i]^.dato.cod;
				cant:=cant+1;;
				v[indice]:=v[indice]^.sig;
			end;
		end;
	var
		min,cant,cantT,cod,actual:integer;
	begin
		l:=nil;
		minimo(v,min,cant,cod);
		while(min<>999)do begin
			actual:=cod;
			cantT:=0;
			while(min<>999)and(actual=cod)do begin
				cantT:=cantT+cant;
				minimo(v,min,cant,cod);
			end;
			insertarOrdenado2(l,cod,cant);
		end;
	end;
var
	v:vector;
	l:lista2;
BEGIN
	cargarvector(v);
	merge(v,l);
END.

