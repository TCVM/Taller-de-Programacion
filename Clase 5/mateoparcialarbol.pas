program arbolLista;
type
    tCoso=record
        num:integer;
        monto:real;
    end;

    lista=^nodoL;
    nodoL=record
        datosL:tCoso;
        sigL:lista;
    end;

    arbol=^nodoA;
    nodoA=record
        datosA:lista;
        hi:arbol;
        hd:arbol;
    end;

procedure    leerCoso(var tC:tCoso);
    begin
        write('Ingrese un num: ');
        readln(tC.num);
        if(tC.num<>0)then begin
            write('Ingrese el monto: ');
            readln(tC.monto);
        end;
    end;

procedure    cargarArbol(var A:arbol);
    procedure    agregarAdelante(var L:lista;tC:tCoso);
        var
            nue:lista;
        begin
            new(nue);
            nue^.datosL:=tC;
            nue^.sigL:=L;
            L:=nue;
        end;

    procedure    crear(var A:arbol;tC:tCoso);
        begin
            if(A=nil)then begin
                new(A);
                A^.datosA:=nil;
                agregarAdelante(A^.datosA,tC);
                a^.hi:=nil;
                a^.hd:=nil;
            end
            else
                if(tC.num<A^.datosA.datosL.num)then
                    crear(a^.hi,tC)
                else
                    crear(a^.hd,tC);
        end;
    var
        tC:tCoso;
    begin
        leerCoso(tC);
        while(tC.num<>0)do begin
            crear(A,tC);
            leerCoso(tC);
        end;
    end;

procedure    imprimir(A:arbol);
    begin
        if(A<>nil)then begin
            imprimir(A^.hi);
            writeln(A^.datosA^.datosL);
            imprimir(A^.hd);
        end;
    end;

var
    A:arbol;
begin
    A:=nil;
    cargarArbol(A);
    writeln('---IMPRIMIR---');
    imprimir(A);
end.
