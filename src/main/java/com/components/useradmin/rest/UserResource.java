package com.components.useradmin.rest;

import com.components.useradmin.repository.rol.Rol;
import com.components.useradmin.repository.user.User;
import com.components.useradmin.repository.user.UserDAO;
import com.components.useradmin.repository.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by agomez on 5/11/2016.
 */
@RestController
public class UserResource
{
    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/crearUsuario", method = RequestMethod.GET)
    public ModelAndView messages() {
        ModelAndView mav = new ModelAndView("crearUsuario");
        User usuario = new User();
        Rol userRol = new Rol();
        mav.addObject("usuario", usuario);
        mav.addObject("rolUsuario", userRol);
        return mav;
    }

    @RequestMapping(value = "/crearUsuario", method=RequestMethod.POST)
    public String processForm(
            @ModelAttribute(value="usuario") User usuario,
            @ModelAttribute(value="rolUsuario") Rol rolUsuario)
    {
        User test = userRepository.createUser(usuario);
        System.out.println (rolUsuario.getRol ());
        System.out.println (test.getUsername ());
        System.out.println (usuario.getUsername());
        return usuario.getUsername();
    }
}
