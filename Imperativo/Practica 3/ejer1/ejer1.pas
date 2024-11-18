{
 1.	Escribir un programa que:
	a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol binario de búsqueda. De cada 
	   socio se lee número de socio, nombre y edad. La lectura finaliza con el número de socio 0 y el árbol debe quedar ordenado 
	   por número de socio.
	b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como parámetro y que : 
		i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que retorne dicho valor.
		ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo recursivo que retorne dicho socio.
		iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
		iv. Aumente en 1 la edad de todos los socios.
		v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un módulo recursivo que reciba el 
		   valor leído y retorne verdadero o falso.
		vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a un módulo recursivo que reciba el nombre 
			leído y retorne verdadero o falso.
		vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha cantidad.
		viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso vii e invocar a un módulo recursivo que 
			  retorne la suma de las edades de los socios.
		ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el árbol cuyo número de socio se encuentra entre los dos 
			valores ingresados. Debe invocar a un módulo recursivo que reciba los dos valores leídos y retorne dicha cantidad.
		x. Informe los números de socio en orden creciente. 
		xi. Informe los números de socio pares en orden decreciente. 
		 

}
program untitled;
type
	socio=record
		num,edad:integer;
		nombre:string;
	end;
	arbol=^nodo;
	nodo=record
		dato:socio;
		HI:arbol;
		HD:arbol;
	end;
	
procedure crearArbol(var a:arbol);
	procedure leer(var s:socio);
		begin
			writeln('ingrese num');readln(s.num);
			if(s.num<> 0)then begin
				writeln('ingrese nombre');readln(s.nombre);
				writeln('ingrese edad');readln(s.edad);
			end;
		end;
	procedure agregarnodo(var a:arbol;s:socio);
		begin
			if(a=nil)then begin
				new(a);
				a^.dato:=s;
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else
				if(s.num>a^.dato.num)then agregarnodo(a^.HD,s)
				else agregarnodo(a^.HI,s);
		end;
	var
		s:socio;
	begin
		leer(s);
		while(s.num<>0)do begin
			agregarnodo(a,s);
			leer(s);
		end;
	end;
	
procedure maxSocio(a:arbol);
	procedure recursion(a:arbol;var max:integer);
		begin
			if(a<>nil)then begin
				if(a^.dato.num>max)then max:=a^.dato.num;
				recursion(a^.HD,max);
			end;
		end;
	var 
		max:integer;
	begin
		writeln('MaxSocio');
		max:=0;
		recursion(a,max);
		writeln('numero de socio mas alto: ',max);
	end;
procedure minSocio(a:arbol);
	procedure recursion(a:arbol; var min:socio);
		begin
			if(a<>nil)then begin
				if(a^.dato.num<min.num)then min:=a^.dato;//es necesario hacer esto cuando ya se que a la izquierda siempre es menor? 
				recursion(a^.HI,min);
				recursion(a^.HD,min);
			end;
		end;
	var
		min:socio;
	begin
		writeln('MinSocio');
		min.num:=999;
		recursion(a,min);
		writeln('num min: ',min.num);
		writeln('nombre min: ',min.nombre);
		writeln('edad min: ',min.edad);
	end;
	
procedure maxEdad(a:arbol);
	procedure recursion(a:arbol;var max:integer);
		begin
			if(a<>nil)then begin
				if(a^.dato.edad>max)then max:=a^.dato.edad;
				recursion(a^.HI,max);
				recursion(a^.HD,max);
			end;
		end;
	var
		max:integer;
	begin
		writeln('MaxEdad');
		max:=0;
		recursion(a,max);
		writeln('edad maxima: ',max)
	end;
procedure aumentoEdad(a:arbol);
	begin
		if(a<>nil)then begin
			a^.dato.edad:=a^.dato.edad+1;
			aumentoEdad(a^.HI);
			aumentoEdad(a^.HD);
		end;
	end;
procedure buscaValor(a:arbol);
	function recursion(a:arbol;valor:integer):boolean;
		begin
			if(a<>nil)then recursion:=false
			else 
				if(a^.dato.num=valor)then recursion:=true
				else 
					if(valor<a^.dato.num)then
						recursion:=recursion(a^.HI,valor)
						else recursion:=recursion(a^.HD,valor);
		end;
	var
		valor:integer;
	begin
		writeln('buscaValor');
		writeln('Ingrese valor');readln(valor);
		if(recursion(a,valor))then writeln('existe')
		else writeln('no existe');
	end;
	
procedure buscarNombre(a:arbol);
	function recursion(a:arbol;nombre:string):boolean;
		begin
			if(a=nil)then recursion:=false
			else if(a^.dato.nombre=nombre)then recursion:=true
				 else begin
					recursion:=recursion(a^.HI,nombre);
					recursion:=recursion(a^.HD,nombre);
				end;
		end;
	var
		nombre:string;
	begin
		writeln('buscarNombre');
		writeln('ingrese nombre');readln(nombre);
		if(recursion(a,nombre))then writeln('existe')
		else writeln('no existe');
	end;
procedure cantidad(a:arbol);
	procedure recursion(a:arbol;var cant:integer);
		begin
			if(a<>nil)then begin
				cant:=cant+1;
				recursion(a^.HI,cant);
				recursion(a^.HD,cant);
			end;
		end;
	procedure recursionEdad(a:arbol;var edades:integer);
		begin
			if(a<>nil)then begin
				edades:=edades+a^.dato.edad;
				recursionEdad(a^.HI,edades);
				recursionEdad(a^.HD,edades);
			end;
		end;
	var
		cant:integer;
		edades:integer;
		prom:real;
	begin
		writeln('cantidad');
		edades:=0;
		cant:=0;
		recursion(a,cant);
		writeln('cantidad total: ',cant);
		recursionEdad(a,edades);
		prom:=edades/cant;
		writeln('Prom edades: ',prom:2:2);
	end;

procedure dosValores(a:arbol);
	procedure recursion(a:arbol;valor1,valor2:integer;var cant:integer);
		begin
			if(a<>nil)then begin
				if(a^.dato.num>valor1)and(a^.dato.num<valor2)then cant:=cant+1
				else
					if(a^.dato.num<valor1)then recursion(a^.HD,valor1,valor2,cant)
					else if(a^.dato.num>valor2)then recursion(a^.HI,valor1,valor2,cant);
			end;
		end;
	var
		valor1,valor2,cant:integer;
	begin
		writeln('dosValores');
		cant:=0;
		writeln('ingrese primer valor');readln(valor1);
		writeln('ingrese segundo valor');readln(valor2);
		recursion(a,valor1,valor2,cant);
		writeln('cantidad entre valores: ',cant);
	end;
procedure creciente(a:arbol);
	begin
		if(a<>nil)then begin
			creciente(a^.HI);
			writeln('num soc: ',a^.dato.num);
			creciente(a^.HD);
		end;
	end;
procedure decreciente(a:arbol);
	begin
		if(a<>nil)then begin
			decreciente(a^.HD);
			writeln('num soc: ',a^.dato.num);
			decreciente(a^.HI);
		end;
	end;
var 
	a:arbol;
BEGIN
	crearArbol(a);
	maxSocio(a);
	minSocio(a);
	maxEdad(a);
	writeln('aumento edad');
	aumentoEdad(a);
	buscaValor(a);
	buscarNombre(a);
	cantidad(a);
	dosValores(a);
	writeln('creciente');
	creciente(a);
	writeln('decreciente');
	decreciente(a);
	
END.

