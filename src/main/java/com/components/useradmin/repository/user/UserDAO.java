package com.components.useradmin.repository.user;

import org.springframework.data.repository.Repository;

public interface UserDAO extends Repository<User, String>
{
    User save(User userToSave);
}
