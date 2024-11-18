{
	2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
	Implementar un programa modularizado que:
	a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, 
	   DNI del propietario y valor de la expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se 
	   procesa.
	b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
	c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
}


program untitled;
const
	dimf=5;
type
	oficina=record
			cod,dni:integer;
			exp:real;
	end;
	vector=array[1..dimf]of oficina;
	
procedure cargarvector(var v:vector;var diml:integer);
	procedure leer(var o:oficina);
		begin
			writeln('ingrese cod');readln(o.cod);
			if(o.cod <> -1)then begin
				writeln('ingrese dni');readln(o.dni);
				writeln('ingrese expensas');readln(o.exp);
			end;
		end;
var
	o:oficina;
begin
	diml:=0;
	leer(o);
	while((diml<=dimf)and(o.cod<>-1))do begin
		diml:=diml+1;
		v[diml]:=o;
		leer(o);
	end;
end;
procedure insercion(var v:vector;diml:integer);
	var
		i,j:integer;
		actual:oficina;
	begin
		for i:=2 to diml do begin
			actual:=v[i];
			j:=i-1;
			while(j>0)and(v[j].cod>actual.cod)do begin
				v[j+1]:=v[j];
				j:=j-1;
			end;
			v[j+1]:=actual;
		end;
	end;
procedure seleccion(var v:vector;diml:integer);
	var
		i,j,p:integer;
		item:oficina;
	begin
		for i:=1 to diml-1 do begin
			p:=i;
			for j:=i+1 to diml do 
				if (v[j].cod < v[p].cod) then p:=j;
			item:=v[p];
			v[p]:=v[i];
			v[i]:=item;
		end; 
		
	end;
procedure imprimir(v:vector;diml:integer);
		var
			i:integer;
		begin
			writeln('-----------------------');
			for i:=1 to diml do writeln(v[i].cod);
		end;
var 
	v:vector;
	diml:integer;
BEGIN
	cargarvector(v,diml);
	imprimir(v,diml);
	insercion(v,diml);
	imprimir(v,diml);
	seleccion(v,diml);
	imprimir(v,diml);
END.

