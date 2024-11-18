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
public class Butaca {
    private String descriptor;
    private double precio;
    private boolean estado;
    private int i,j;

    public Butaca(int i, int j) {
        this.i = i;
        this.j = j;
        this.descriptor = "Butaca "+i+", "+j;
        this.precio = 800+100*i;
        this.estado = false;
        
        
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public double getPrecio() {
        return precio;
    }

    @Override
    public String toString() {
        return "Butaca{" + "descriptor=" + descriptor + ", precio=" + precio + ", estado=" + estado + '}';
    }
    
    
}
