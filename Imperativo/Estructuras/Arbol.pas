program untitled;
type
	arbol=^nodo;
	nodo=record
		dato:integer;
		hi,hd:arbol;
	end;

procedure crearArbol(var a:arbol;dato:integer);
	begin
		if(a=nil)then begin
			new(a);
			a^.dato:=dato;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if(a^.dato>dato)then crearArbol(a^.hi,dato)
			else crearArbol(a^.hd,dato);
	end;


procedure enOrder(a:arbol);
	begin
		if(a<>nil)then begin
			enOrden(a^.hi);
			writeln(a^.dato);
			enOrden(a^.hd);
		end;
	end;

procedure PreOrden(a:arbol);
	begin
		if(a<>nil)then begin
			writeln(a^.dato);
			PreOrden(a^.hi);
			PreOrden(a^.hd);
		end;
	end;

procedure posOrden(a:arbol);
	begin
		if(a<>nil)then begin
			posOrden(a^.hi);
			posOrden(a^.hd);
			writeln(a^.dato);
		end;
	end;


function buscar(a:arbol;x:elemento):arbol;
	begin
		if(a=nil)then buscar:=nil
		else if(x=a^.dato)then buscar:=a
			 else
				if(x<a^.dato)then
					buscar:=buscar(a^.hi,x)
				else 
					buscar:=buscar(a^.hd,x);
	end;
var i : byte;

BEGIN
	
	
END.

