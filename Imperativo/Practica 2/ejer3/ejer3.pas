{
   3.- Escribir un programa que:
		a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con 
		   el número 0.
		b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
		c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
		d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario. 

   
}


program untitled;
type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;
procedure generarLista(var l:lista);
	procedure agregaradelante(var l:lista;n:integer);
		var
			aux:lista;
		begin
			new(aux);
			aux^.dato:=n;
			aux^.sig:=l;
			l:=aux;
		end;
	var
		n:integer;
	begin
		Randomize;
		n:=Random(100);
		if(n<>0)then begin
			agregaradelante(l,n);
			writeln(n);
			generarLista(l);
		end;
	end;

procedure minvalue(l:lista;var min:integer);
	begin
		if(l<>nil)then begin
			if(l^.dato<min)then min:=l^.dato;
			minvalue(l^.sig,min);
		end;
	end;
	
procedure maxvalue(l:lista;var max:integer);
	begin
		if(l<>nil)then begin
			if(l^.dato>max)then max:=l^.dato;
			maxvalue(l^.sig,max);
		end;
	end;

function esta(l:lista):boolean;
	procedure recursion(l:lista;n:integer;var b:boolean);
		begin
			if(l<>nil) and (b = false)then begin
				if(l^.dato=n)then b:=true
				else
					l:=l^.sig;
			end;
		end;
	var
		n:integer;
		aux:boolean;
	begin
		aux:=false;
		writeln('ingrese valor a buscar');readln(n);
		recursion(l,n,aux);
		esta:=aux;
	end;
var 
	l:lista;
	max,min:integer;
BEGIN
	L:=nil;
	max:=0;
	min:=100;
	generarLista(l);
	minvalue(l,min);
	maxvalue(l,max);
	if(esta(l))then writeln('Existe')
	else writeln('No existe');
END.

