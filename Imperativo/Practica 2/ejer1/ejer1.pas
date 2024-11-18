{
  1.- Implementar un programa que invoque a los siguientes módulos.
		a. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y los almacene en un
		   vector con dimensión física igual a 10.
		b. Implementar un módulo que imprima el contenido del vector.
		c. Implementar un módulo recursivo que imprima el contenido del vector.
		d. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne la cantidad de
		   caracteres leídos. 
		El programa debe informar el valor retornado.
		e. Implementar un módulo recursivo que permita leer una secuencia de caracteres terminada en punto y retorne una lista con 
		   los caracteres leídos.
		f. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en el mismo orden que 
		   están almacenados.
		g. Implemente un módulo recursivo que reciba la lista generada en d. e imprima los valores de la lista en orden inverso al que 
		   están almacenados.
}


program untitled;
const
	dimf=10;
type
	vector=array[1..dimf]of char;
	lista=^nodo;
	nodo=record
		dato:char;
		sig:lista;
	end;
procedure cargar(var v:vector;var diml:integer);
	var	
		c:char;
	begin
		diml:=0;
		repeat
			writeln('ingrese char');readln(c);
			v[diml]:=c;
			diml:=diml+1;
		until((c='.')or(diml=dimf));
	end;
procedure imprimir(v:vector;diml:integer);
	var
		i:integer;
	begin
		for i:=1 to diml do writeln(v[i]);
	end;
procedure imprimirRecursivo(v:vector;diml:integer);
	begin
		if(diml>0)then begin
			writeln(v[diml]);
			diml:=diml-1;
			imprimirRecursivo(v,diml);
		end;
	end;
procedure cargarlista(var l:lista;var cant:integer);
	procedure agregaradelante(var l:lista;c:char);
		var
			aux:lista;
		begin
			new(aux);
			aux^.dato:=c;
			aux^.sig:=l;
			l:=aux;
		end;
	procedure cargarRecursivo(var l:lista;var cant:integer;c:char);
		begin
			if(c<>'.')then begin
				writeln('ingrese char');readln(c);
				agregaradelante(l,c);
				cant:=cant+1;
				cargarRecursivo(l,cant,c);
			end;
		end;
	procedure imprimirlista(l:lista);
		begin
			if(l<>nil)then begin
				writeln(l^.dato);
				l:=l^.sig;
				imprimirlista(l);
			end;
		end;
	procedure imprimirlista2(l:lista);
		begin
			if(l<>nil)then begin
				imprimirlista2(l^.sig);
				writeln(l^.dato);
			end;
		end;
	var
		c:char;
	begin
		cant:=0;
		c:='0';
		cargarRecursivo(l,cant,c);
		writeln('cantidad de valores en lista: ',cant);
		imprimirlista(l);
		imprimirlista2(l);
	end;
var
	cant:integer;
	v:vector;
	l:lista;
	diml:integer;
BEGIN
	l:=nil;
	cargar(v,diml);
	imprimir(v,diml);
	cargarlista(l,cant);
END.

