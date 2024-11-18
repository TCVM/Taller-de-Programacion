{
   2.- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número leído, sus dígitos en el 
       orden en que aparecen en el número. Debe implementarse un módulo recursivo que reciba el número e imprima lo pedido. 
       Ejemplo si se lee el valor 256, se debe imprimir 2  5  6
   
   
}


program untitled;
procedure leer();
	procedure digitos(n:integer);
		var
			dig:integer;
		begin
			if(n<>0)then begin
				dig:=n mod 10;
				n:=n div 10;
				digitos(n);
				write(' ',dig,' ');
			end;
		end;
	var
		n:integer;
	begin
		writeln('ingrese num');readln(n);
		while(n<>0)do begin
			digitos(n);
			writeln('');
			writeln('ingrese num');readln(n);
		end;
	end;

BEGIN
	leer();
END.

