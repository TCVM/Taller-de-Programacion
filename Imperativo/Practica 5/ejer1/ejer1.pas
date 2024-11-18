{
  
	1.- El administrador de un edificio de oficinas, cuenta en papel, con la información del pago de las expensas de dichas oficinas. 
	Implementar un programa que:
		a)	Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa código de identificación, 
			DNI del propietario y valor de la expensa. La lectura finaliza cuando llega el código de identificación -1.
		b)	Ordene el vector, aplicando uno de los métodos vistos en la cursada, para obtener el vector ordenado por código de identificación
			de la oficina.
		c)	Realice una búsqueda dicotómica que recibe el vector generado en b) y un código de identificación de oficina y retorne si dicho
			código está en el vector. En el caso de encontrarlo, se debe informar el DNI del propietario y en caso contrario informar que el 
			código buscado no existe.
		d)	Tenga un módulo recursivo que retorne el monto total de las expensas.

	   
}


program untitled;
const
	dimf=300;
type
	oficina=record
		cod,dni:integer;
		val:real;
	end;
	vector=array[1..300]of oficina;
procedure cargarvector(var v:vector;var diml:integer);
	procedure leer(var o:oficina);
		begin
			writeln('ingrese cod');readln(o.cod);
			if(o.cod<>-1)then begin
				writeln('ingrese dni');readln(o.dni);
				writeln('ingrese val');readln(o.val);
			end;
		end;
	procedure ordenar(var v:vector;diml:integer);
			var
				i,j,pos:integer;
				d:oficina;
			begin
				for i:=1 to diml-1 do begin
					pos:=i;
					for j:=i+1 to diml do 
						if(v[i].cod>v[j].cod)then pos:=j;
				end;
				d:=v[pos];
				v[pos]:=v[i];
				v[i]:=d;
			end;
	var
		o:oficina;
	begin
		diml:=0;
		leer(o);
		while(diml<=dimf)and(o.cod<>-1)do begin
			diml:=diml+1;
			v[diml]:=o;
			leer(o);
		end;
		ordenar(v,diml);
	end;
function dicotomica(v:vector;cod,ini,fin:integer;var pos:integer):boolean;
	var
		medio:integer;
		control:boolean;
	begin
		pos:=0;
		control:=true;
		while(control)and(ini<=fin) do begin
			medio:=(ini+fin)div 2;
			if(cod=v[medio].cod)then begin
				dicotomica:=true;
				pos:=medio;
				control:=false;
			end
			else
				if(cod<v[medio].cod)then dicotomica:=dicotomica(v,cod,ini,medio-1,pos)
				else dicotomica:=dicotomica(v,cod,medio+1,fin,pos);
		end;
	end;
procedure expensas(v:vector;var cant:real;i,diml:integer);
	begin
		if(i<=diml)then begin
			cant:=v[i].val+cant;
			i:=i+1;
			expensas(v,cant,i,diml);
		end;
	end;
var 
	v:vector;
	diml,ini,fin,pos,cod,i:integer;
	cant:real;
BEGIN
	cant:=0;
	i:=1;
	cargarvector(v,diml);
	ini:=1;
	fin:=diml;
	writeln('ingrese cod a buscar');readln(cod);
	if(dicotomica(v,cod,ini,fin,pos))then begin
		writeln('dni: ',v[pos].dni);
	end
	else writeln('no existe');
	expensas(v,cant,i,diml);
	writeln('gasto total de expensas: ',cant);
END.

