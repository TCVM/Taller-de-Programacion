program p5e1;
const
	dimf=300;
type
	ofi=record
		cod,dni:integer;
		esp:real;
	end;
	vector=array[1..dimf]of ofi;
	 

////////////////////////////A///////////////////////////////////////


procedure imprimir(v:vector;diml:integer);
	var
		i:integer;
	begin
		writeln('PRINT');
		for i:=1 to diml do  begin
		writeln('-----------',v[i].cod,'-----------');
		end;
	end;
procedure cargarvec(var v:vector;var diml:integer);
	procedure leer(var o:ofi);
	begin
		writeln('ingrese cod');
		readln(o.cod);
		if(o.cod <> -1)then begin
			writeln('ingrese dni');
			readln(o.dni);
			writeln('ingrese espensas');
			readln(o.esp);
		end;
	end;
	var
		o:ofi;
	begin
		diml:=0;
		leer(o);
		while(diml<>dimf)and(o.cod<>-1)do begin
			diml:=diml+1;
			v[diml]:=o;
			leer(o);
		end;
		imprimir(v,diml);
	end;


////////////////////////////A///////////////////////////////////////


////////////////////////////B///////////////////////////////////////

procedure ordenar(var v:vector;diml:integer);
	var
		i,j,pos:integer;
		item:ofi;
	begin
		for i:=1 to diml-1 do begin
			pos:=i;
			for j:=i+1 to diml do begin
				if(v[j].cod<v[pos].cod)then pos:=j;
				item:=v[pos];
				v[pos]:=v[i];
				v[i]:=item;
			end;
		end;
		imprimir(v,diml);
	end;

////////////////////////////B///////////////////////////////////////

////////////////////////////C///////////////////////////////////////

procedure dicotimica(v:vector;diml:integer);
	Procedure busquedaDicotomica(v:vector;i,diml:integer; cod:integer;var pos:integer);
	var
		medio:integer;
	begin
		if(i > diml ) then
		  pos:=-1
		else begin
		  medio:= (i + diml)  div 2;
		  if (cod = v[medio].cod) then
			pos:= medio
		  else
			if (cod < v[medio].cod) then
			  busquedaDicotomica(v,i,medio-1,cod,pos)
			else
			  busquedaDicotomica(v,medio+1,diml,cod,pos);
		end;
	end;
	var
		pos,cod,i:integer;
	begin
		i:=1;
		pos:=-1;
		writeln('ingrese codigo a buscar');
		readln(cod);
		busquedaDicotomica(v,i,diml,cod,pos);
		  if (pos <> -1) then
			Writeln ('DNI: ', v[pos].dni)
		else
			writeln ('DNI NO ENCONTRADO');
		readln();
	end;	


////////////////////////////C///////////////////////////////////////

////////////////////////////D///////////////////////////////////////

procedure montomax(v:vector;diml:integer;var monto:real);
	procedure recursiva(v:vector;diml:integer;var monto:real);
		begin
			if(diml>0)then begin
				recursiva(v,diml-1,monto);
				monto:=monto+v[diml].esp;
			end;
		end;
begin
	recursiva(v,diml,monto);
	writeln('monto total: ',monto:2:1);
end;

////////////////////////////D///////////////////////////////////////

var
	v:vector;
	diml:integer;
	monto:real;
BEGIN
	monto:=0;
	cargarvec(v,diml);
	ordenar(v,diml);
	dicotimica(v,diml);
	montomax(v,diml,monto);
END.

