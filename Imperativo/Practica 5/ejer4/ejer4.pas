{
 4.- Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las entradas vendidas. 
	 Se desea procesar la información de una semana. Se pide:
		a)	Generar 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de 1 a 7), código de la obra, asiento, 
			monto. La lectura finaliza con el código de obra igual a 0. Las listas deben estar ordenadas por código de obra de forma 
			ascendente.
		b)	Generar una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta lista debe estar ordenada por código de obra 
			de forma ascendente.
		c)	Realice un módulo recursivo que informe el contenido de la lista generada en b)

   
   
}


program untitled;
type
	rango=1..7;
	entrada=record
		dia:rango;
		cod,asiento:integer;
		monto:real;
	end;
	lista=^nodo;
	nodo=record
		dato:entrada;
		sig:lista;
	end;
	lista2=^nodo2;
	nodo2=record
		cod,cont:integer;
		sig:lista2;
	end;
	vector=array[rango]of lista;
procedure cargarvector(var v:vector);
	procedure leer(var e:entrada);
		begin
			writeln('cod');readln(e.cod);
			if(e.cod<>0)then begin
				writeln('dia');readln(e.dia);
				writeln('asiento');readln(e.asiento);
				writeln('monto');readln(e.monto);
			end;
		end;
	procedure agregarnodo(var l:lista;e:entrada);
		var
			aux,ant,act:lista;
		begin
			new(aux);
			aux^.dato:=e;
			act:=l;ant:=l;
			while(act<>nil)and(act^.dato.cod<e.cod)do begin
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
			for i:=1 to 7 do v[i]:=nil;
		end;
	var
		e:entrada;
	begin
		inicializar(v);
		leer(e);
		while(e.cod<>0)do begin
			agregarnodo(v[e.cod],e);
			leer(e);
		end;
	end;
procedure merge(var l:lista2;v:vector);
	procedure agregarnodo2(var l:lista2;cod,cont:integer);
		var
			aux,ant,act:lista2;
		begin
			new(aux);
			aux^.cod:=cod;
			aux^.cont:=cont;
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
	procedure minimo(v:vector;var min,cod:integer);
		var
			i,indice:integer;
		begin
			min:=999;
			for i:=1 to 7 do
				if(v[i]<>nil)then 
					if(v[i]^.dato.cod<min)then begin
						min:=v[i]^.dato.cod;
						indice:=i;
					end;
			if(min<>999)then begin
				cod:=v[indice]^.dato.cod;
				v[indice]:=v[indice]^.sig;
			end;
		end;
	var
		cont,actual,min,cod:integer;
	begin
		l:=nil;
		minimo(v,min,cod);
		while(min<>999)do begin
			cont:=0;
			actual:=min;
			while(min<>999)and(min=actual)do begin
				minimo(v,min,cod);
				cont:=cont+1;
			end;
			agregarnodo2(l,cod,cont);
		end;
	end;
procedure informar(l:lista2);
	begin
		if(l<>nil)then begin
			writeln(l^.cod);
			writeln(l^.cont);
			informar(l^.sig);
		end;
	end;
var 
	v:vector;
	l:lista2;
BEGIN
	cargarvector(v);
	merge(l,v);
	informar(l);
END.

