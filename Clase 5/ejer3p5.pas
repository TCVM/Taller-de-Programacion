program ejer3p5;
type
	rango=1..10;
	producto=record
		cod,stock:integer;
		rubro:rango;
		precio:real;
	end;
	puntoc=record
		cod,stock:integer;
	end;
	
	arbol=^nodo;
	nodo=record
		dato:producto;
		hi:arbol;
		hd:arbol;
	end;
	
	vector=array[rango]of arbol;
	vectorc=array[rango]of puntoc;
	vectord=array[rango]of integer;


//////////////////////////////A///////////////////////////////////////

procedure crear(var a:arbol;p:producto);
	begin
		if(a=nil)then begin
			new(a);
			a^.dato:=p;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(p.cod<a^.dato.cod)then crear(a^.hi,p)
			else crear(a^.hd,p)
	end;

procedure cargar(var v:vector);
	procedure leer(var p:producto);
		begin
			writeln('ingrese cod');
			readln(p.cod);
			if(p.cod <> -1)then begin
				writeln('ingrese stock');readln(p.stock);
				writeln('ingrese rubro');readln(p.rubro);
				writeln('ingrese precio');readln(p.precio);
			end;
		end;
	procedure inicializar(var v:vector);
		var
			i:integer;
		begin
			for i:=1 to 10 do v[i]:=nil;
		end;
		
	var
		p:producto;
	begin
		inicializar(v);
		leer(p);
		while(p.cod<>-1)do begin
			crear(v[p.rubro],p);
			leer(p);
		end;
	end;
	
//////////////////////////////A///////////////////////////////////////

	
//////////////////////////////B///////////////////////////////////////	
	
function existe(v:vector):boolean;
	function buscar(a:arbol;cod:integer):boolean;
		begin
			if(a<>nil)then begin
				if(a^.dato.cod<cod)then buscar:=buscar(a^.hi,cod)
				else 
					if(a^.dato.cod>cod)then buscar:=buscar(a^.hd,cod)
					else
						buscar:=true;
			end
			else
				buscar:=false;
		end;
		
	var
		rubro:rango;
		cod:integer;
	begin
		writeln('ingrese rubro a buscar');
		readln(rubro);
		writeln('ingrese codigo a buscar');
		readln(cod);
		existe:=buscar(v[rubro],cod);
	end;
	
//////////////////////////////B///////////////////////////////////////	




//////////////////////////////C///////////////////////////////////////


procedure escribirVC(vc:vectorc);	
	var i:integer;
	begin
		writeln('--------------------');
		for i:=1 to 10 do begin
			writeln('rubro: ', i);
			writeln('maxcod: ', vc[i].cod, ' max stock: ', vc[i].stock);
		end;
		writeln('----------');
	end;
	
procedure mayorcod(var vc:vectorc;v:vector);
	procedure ini(var vc:vectorc;i:integer);
		begin
			for i:=1 to 10 do begin
				vc[i].cod:=0;
				vc[i].stock:=0;
			end;
		end;
	procedure max(a:arbol;var p:puntoc);
		begin
			if(a^.hd<>nil)then max(a^.hd,p)
			else
				begin
					p.cod:=a^.dato.cod;
					p.stock:=a^.dato.stock
				end;
		end;
		
	var
		i:integer;
	begin
		ini(vc,i);
		for i:=1 to 10 do if(v[i]<>nil)then max(v[i],vc[i]);
	end;

//////////////////////////////C///////////////////////////////////////	

//////////////////////////////D///////////////////////////////////////	

procedure cantprod(var vd:vectord;v:vector);
	procedure escribirvd(vd:vectord);	
	var i:integer;
	begin
		writeln('--------------------');
		for i:=1 to 10 do writeln(vd[i]);
		writeln('----------');
	end;
	
	procedure ini(var vd:vectord);
		var
			i:integer;
		begin
			for i:=1 to 10 do vd[i]:=0;
		end;
	procedure recorrer(var vd:vectord;a:arbol;cod1,cod2:integer);
		begin
			if(a<>nil)then begin
				recorrer(vd,a^.hi,cod1,cod2);
				recorrer(vd,a^.hd,cod1,cod2);
				if(a^.dato.cod>cod1)and(a^.dato.cod<cod2)then vd[a^.dato.rubro]:=vd[a^.dato.rubro]+1;
			end
		end;
	var 
		cod1,cod2,i:integer;
	begin
		ini(vd);
		writeln('ingrese cod1');readln(cod1);
		writeln('ingrese cod2');readln(cod2);
		for i:=1 to 10 do recorrer(vd,v[i],cod1,cod2);
		escribirvd(vd);
	end;

//////////////////////////////D///////////////////////////////////////		

VAR
	v:vector;
	vc:vectorc;
	vd:vectord;
BEGIN
	cargar(v);
	if(existe(v))then writeln('Existe')	else writeln('No existe');
	mayorcod(vc,v);
	escribirVC(vc);
	cantprod(vd,v);
END.

