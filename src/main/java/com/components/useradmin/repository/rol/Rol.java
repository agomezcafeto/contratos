package com.components.useradmin.repository.rol;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by AGOMEZ on 21/05/2016.
 */
@Entity
@Table(name = "roles_usuarios")
public class Rol
{
    @Id
    @Column(name = "id_rol_usuario")
    private Integer userRolId;
    @Column(name = "nombre_usuario")
    private String username;
    @Column(name = "nombre_rol")
    private String rol;

    @Column(name = "id_rol_usuario")
    public Integer getUserRolId() {
        return userRolId;
    }

    @Column(name = "id_rol_usuario")
    public void setUserRolId(Integer userRolId) {
        this.userRolId = userRolId;
    }
    @Column(name = "nombre_usuario")
    public String getUsername() {
        return username;
    }
    @Column(name = "nombre_usuario")
    public void setUsername(String username) {
        this.username = username;
    }
    @Column(name = "nombre_rol")
    public String getRol() {
        return rol;
    }
    @Column(name = "nombre_rol")
    public void setRol(String rol) {
        this.rol = rol;
    }
}
