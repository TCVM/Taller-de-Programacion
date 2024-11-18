program asd;
const
	maxv=2018;
type
	rango=2010..maxv;
	reg=record
		pat:integer;
		anio:rango;
		marca,modelo:string;
	end;
	
	arbol=^nodo;
	nodo=record
		dato:reg;
		hi,hd:arbol;
	end;
	
vector=array[rango]of arbol;

////////////////////////////////A//////////////////////////////////////


procedure leer(var r:reg);
	begin
		writeln('Ingrese patente');
		readln(r.pat);
		if(r.pat<>0)then begin
			writeln('Ingrese año');
			readln(r.anio);
			writeln('Ingrese marca');
			readln(r.marca);
			writeln('Ingrese modelo');
			readln(r.modelo);
		end;
	end;


procedure creararbol(var a:arbol;r:reg);
	begin
		if(a=nil)then begin
			new(a);
			a^.dato:=r;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(r.pat>a^.dato.pat)then creararbol(a^.hd,r)
			else creararbol(a^.hi,r);
	end;
	
procedure procesar(var a:arbol;var r:reg);

	begin
		a:=nil;
		leer(r);
		while(r.pat<>0)do begin
			creararbol(a,r);
			leer(r);
		end;
	end;
///////////////////////////////A////////////////////////////////////////	
	

///////////////////////////////B////////////////////////////////////////
procedure correr(a:arbol);
	procedure recorrer(a:arbol;var cont:integer;marca:string);
		begin
			if(a<>nil)then begin
				recorrer(a^.hi,cont,marca);
				if(a^.dato.marca=marca)then cont:=cont+1;
				recorrer(a^.hd,cont,marca);
			end;
		end;
	
	var
		cont:integer;
		marca:string;
	begin
		cont:=0;
		writeln('Ingrese marca ejerb');
		readln(marca);
		recorrer(a,cont,marca);
		writeln('cantidad de autos por marca: ',cont);
	end;
	
///////////////////////////////B////////////////////////////////////////


///////////////////////////////C////////////////////////////////////////

procedure agregarvector(var v:vector;a:arbol);
	procedure inicializar(var v:vector);
		var
			i:integer;
		begin
			for i:= 2010 to maxv do v[i]:=nil;
		end;
	procedure buscar(a:arbol;var v:vector);
		begin
			if(a<>nil)then begin
				creararbol(v[a^.dato.anio],a^.dato);
				buscar(a^.hi,v);
				buscar(a^.hd,v);
			end;
		end;

	begin
		inicializar(v);
		buscar(a,v);
	end;
	
///////////////////////////////C////////////////////////////////////////


///////////////////////////////D////////////////////////////////////////
procedure aniosearch(a:arbol);
function aniopat(a:arbol;pat:integer):rango;
	begin
		if(a<>nil)then begin
			if(a^.dato.pat<pat)then aniopat(a^.hi,pat)
			else 
				if(a^.dato.pat>pat)then aniopat(a^.hd,pat)
				else
					aniopat:=a^.dato.anio;
		end;
	end;

	var
		pat:integer;
	begin
		writeln('Ingrese patente ejerD');
		readln(pat);
		writeln('Año de la patente: ',aniopat(a,pat));
	end;

///////////////////////////////D////////////////////////////////////////

var
	a:arbol;
	r:reg;
	v:vector;
begin
	procesar(a,r);
	correr(a);
	agregarvector(v,a);
	aniosearch(a);
end.
