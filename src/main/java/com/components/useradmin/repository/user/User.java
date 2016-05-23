package com.components.useradmin.repository.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "usuarios")
public class User
{
    @Id
    @Column(name = "nombre_usuario")
    private String username;
    @Column(name = "contrasena")
    private String password;
    @Column(name = "estado")
    private boolean enabled;

    @Column(name = "contrasena")
    public String getPassword()
    {
        return password;
    }

    @Column(name = "nombre_usuario")
    public String getUsername()
    {
        return username;
    }

    @Column(name = "estado")
    public boolean isEnabled()
    {
        return enabled;
    }

    @Column(name = "nombre_usuario")
    public void setUsername(String username)
    {
        this.username = username;
    }

    @Column(name = "contrasena")
    public void setPassword(String password)
    {
        this.password = password;
    }

    @Column(name = "estado")
    public void setEnabled(boolean enabled)
    {
        this.enabled = enabled;
    }
}