/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication28;

/**
 *
 * @author Alumno
 */
public class Funcion {
    private String titulo;
    private String fecha;
    private int hora, N, M;
    private Butaca [][] Sala;

    public Funcion(String titulo, String fecha, int hora, int N, int M) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.N = N;
        this.M = M;
        this.Sala = new Butaca [N][M];
        for(int i=0;i<N;i++)
            for(int j=0;j<M;j++)
                   Sala[i][j]= new Butaca (i,j); 
    }
    public double ocuparButaca(int fila, int butaca){
        Sala[fila][butaca].setEstado(true);
        return(Sala[fila][butaca].getPrecio());
    }
    
    public void desocuparFila(int fila){
        for (int i=0;i<M;i++) Sala [fila][i].setEstado(false);
    }
    
    public String representacionButacasPorNumero(int butaca){
        String aux="";
        for(int i=0;i<N;i++)
            aux= aux +"/n"+ Sala[i][butaca].toString();
        return(aux);
    }
    
    public String representacionButacasPorNumeropart2(){
        String aux=titulo+", "+fecha+", "+hora;
        for(int i=0;i<N;i++)
            for(int j=0;j<M;j++)
                aux= aux +"/n"+ Sala[i][j].toString();
        return aux;
    }
}
/*

private int [] vector;

vector=new int [N];

*se ingresa en la matriz un valor (2,1)*
	
	vector[n]++;


*/