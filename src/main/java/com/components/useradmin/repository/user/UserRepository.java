package com.components.useradmin.repository.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by AGOMEZ on 21/05/2016.
 */
@Repository
public class UserRepository
{
    @Autowired
    UserDAO userDAO;

    public User createUser(User userToCreate)
    {
        userToCreate.setEnabled(true);
        return userDAO.save(userToCreate);
    }
}
