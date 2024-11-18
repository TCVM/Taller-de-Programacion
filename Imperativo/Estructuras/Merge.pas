program untitled;

procedure minimoTodos(var todos:estantes;var nommin:string; var monto:real;diml);
	var
		indicemin,i:integer;
	begin
		nommin:='zzz';
		for i:=1 to diml do 
			if(todos[i]<>nil)then
				if(todos[i]^.dato.nombre<=nommin)then begin
					indicemin:=i;
					nommin:=todos[i]^.dato.nombre;
				end;
			if(nommin<>'zzz')then begin
				monto:=todos[indicemin]^.dato.monto;
				todos[indicemin]:=todos[indicemin]^.sig;
			end;
	end;	
	

procedure minimo2(var e1,e2:lista; var min:string);
	begin
		min:='zzz';
		if(e1<>nil)and(e2<>nil)then
			if(e1^.dato<=e2^.dato)then
				begin
					min:=e1^.dato;
					e1:=e1^.sig;
				end
			else begin
				min:=e2^.dato;
				e2:=e2^.sig;
			end
		else
			if(e1<>nil)and(e2=nil)then begin
				min:=e1^.dato;
				e1:=e1^.sig;
			end
			else
				if(e1=nil)and(e2<>nil)then begin
					min:=e2^.dato;
					e2:=e2^.sig;
				end;
	end;

procedure merge(E1,E2:lista; var Enuevo:lista);
	var
		min:string;
	begin
		Enuevo:=nil;
		minino(E1,E2,min);
		while(min<>'zzz')do begin
			agregarAtras(Enuevo,min);
			minimo(E1,E2,min);
		end;
	end;
	
	

var i : byte;

BEGIN
	
	
END.

