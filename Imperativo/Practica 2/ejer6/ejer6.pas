{
   6.- Realizar un programa que lea números y que utilice un procedimiento recursivo que escriba el equivalente en binario de un número 
	   decimal. El programa termina cuando el usuario ingresa el número 0 (cero). 

		Ayuda:  Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2. ¿Cómo obtenemos los dígitos que
				componen al número? ¿Cómo achicamos el número para la próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa 
				debe mostrar: 10111.

   
}


program untitled;
procedure leer();
	procedure Binario(n:integer);
		var resto:integer;
		begin
			if(n>=2)then begin
				resto:=n mod 2;
				Binario(n div 2);
			end
			else writeln(n);
			if(n>=2)then writeln(resto);
		end;
	var
		n:integer;
	begin
		writeln('ingrese numero');readln(n);
		while(n<>0)do begin
			Binario(n);
			writeln('ingrese numero');readln(n);
		end;
	end;

BEGIN
	leer();
	
END.

