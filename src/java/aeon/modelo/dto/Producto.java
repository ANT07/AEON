package aeon.modelo.dto;
// Generated 10-10-2018 06:07:14 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Producto generated by hbm2java
 */
public class Producto  implements java.io.Serializable {


     private int idproducto;
     private Integer idcategoria;
     private String nombreproducto;
     private Float existencia;
     private String descripcion;
     private Integer estadoproducto;
     private Set detalleVentas = new HashSet(0);

    public Producto() {
    }

	
    public Producto(int idproducto) {
        this.idproducto = idproducto;
    }
    public Producto(int idproducto, Integer idcategoria, String nombreproducto, Float existencia, String descripcion, Integer estadoproducto, Set detalleVentas) {
       this.idproducto = idproducto;
       this.idcategoria = idcategoria;
       this.nombreproducto = nombreproducto;
       this.existencia = existencia;
       this.descripcion = descripcion;
       this.estadoproducto = estadoproducto;
       this.detalleVentas = detalleVentas;
    }
   
    public int getIdproducto() {
        return this.idproducto;
    }
    
    public void setIdproducto(int idproducto) {
        this.idproducto = idproducto;
    }
    public Integer getIdcategoria() {
        return this.idcategoria;
    }
    
    public void setIdcategoria(Integer idcategoria) {
        this.idcategoria = idcategoria;
    }
    public String getNombreproducto() {
        return this.nombreproducto;
    }
    
    public void setNombreproducto(String nombreproducto) {
        this.nombreproducto = nombreproducto;
    }
    public Float getExistencia() {
        return this.existencia;
    }
    
    public void setExistencia(Float existencia) {
        this.existencia = existencia;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Integer getEstadoproducto() {
        return this.estadoproducto;
    }
    
    public void setEstadoproducto(Integer estadoproducto) {
        this.estadoproducto = estadoproducto;
    }
    public Set getDetalleVentas() {
        return this.detalleVentas;
    }
    
    public void setDetalleVentas(Set detalleVentas) {
        this.detalleVentas = detalleVentas;
    }




}

