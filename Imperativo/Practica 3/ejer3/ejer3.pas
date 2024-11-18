{
 3.	Implementar un programa que contenga:
	a. Un módulo que lea información de alumnos de Taller de Programación y almacene en una estructura de datos sólo a aquellos
	*  alumnos que posean año de ingreso posterior al 2010. De cada alumno se lee legajo, DNI y año de ingreso. La estructura generada debe 
	   ser eficiente para la búsqueda por número de legajo. 
	b. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo sea inferior a
	    un valor ingresado como parámetro. 
	c. Un módulo que reciba la estructura generada en a. e informe el DNI y año de ingreso de aquellos alumnos cuyo legajo esté comprendido
	   entre dos valores que se reciben como parámetro. 
	d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
	e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con legajo impar.

}


program untitled;
type
 	alumno=record
		leg,dni,anio:integer;
 	end;
	arbol=^nodo;
	nodo=record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;
	
procedure crearArbol(var a:arbol);
	procedure leer(var a:alumno);
		begin
			writeln('ingresar año de ingreso');readln(a.anio);
			if(a.anio>2010)then begin
				writeln('ingrese legajo');readln(a.leg);
				writeln('ingrese dni');readln(a.dni);
			end;
		end;
	procedure agregarnodo(var a:arbol;d:alumno);
		begin
			if(a=nil)then begin
				new(a);
				a^.dato:=d;
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else
				if(d.leg>a^.dato.leg)then agregarnodo(a^.HD,d)
				else agregarnodo(a^.HI,d);
		end;
	var
		d:alumno;
	begin
		leer(d);
		while(d.anio>2010)do begin
			agregarnodo(a,d);
			leer(d);
		end;
	end;
procedure informeA(a:arbol);
	function buscar(a:arbol;valor:integer):alumno;
		begin
			if(a=nil)then begin 
				buscar.dni:=-1;
				buscar.leg:=-1;
				buscar.anio:=-1;
			end
			else
				if(valor=a^.dato.leg)then buscar:=a^.dato
				else if(valor<a^.dato.leg)then buscar:=buscar(a^.HI,valor)
					 else buscar:=buscar(a^.HD,valor);
		end;
	var
		valor:integer;
		al:alumno;
	begin
		writeln('ingrese valor a buscar');readln(valor);
		al:=buscar(a,valor);
		writeln('dni: ',al.dni);
		writeln('año de ingreso: ',al.anio);
	end;
	
procedure informeB(a:arbol;valor1,valor2:integer);
	begin
		if(a<>nil)then
			 if((a^.dato.leg>valor1 )and( a^.dato.leg<valor2))then begin 
				writeln('año de ingreso: ',a^.dato.anio);
				writeln('dni: ',a^.dato.dni);
			end
			else if(a^.dato.leg<valor1)then informeB(a^.HD,valor1,valor2)
				 else if(a^.dato.leg>valor2)then informeB(a^.HI,valor1,valor2);
				
	end;
procedure max(a:arbol;var maxdni:integer);
	begin
		if(a<>nil)then begin
			if(maxdni<a^.dato.dni)then maxdni:=a^.dato.dni;
			max(a^.HI,maxdni);
			max(a^.HD,maxdni);
		end;
	end; 	
procedure impar(a:arbol;var impares:integer);
	begin
		if(a<>nil)then begin
			if(a^.dato.leg mod 2 = 0)then impares:=impares + 1;
			impar(a^.HI,impares);
			impar(a^.HD,impares);
		end;
	end; 	
var 
	a:arbol;
	maxdni,impares,valor1,valor2:integer;
BEGIN
	crearArbol(a);
	informeA(a);
	writeln('ingrese val1');readln(valor1);
	writeln('ingrese val2');readln(valor2);
	informeB(a,valor1,valor2);
	maxdni:=-1;
	max(a,maxdni);
	writeln('dni maximo: ',maxdni);
	impares:=0;
	impar(a,impares);
	writeln('cantidad de legajos impares: ',impares);
END.

