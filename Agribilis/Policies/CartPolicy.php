<?php

namespace Agribilis\Policies;

use Agribilis\Models\Cart;
use Agribilis\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Auth\Access\Response;

class CartPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \Agribilis\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function viewAny(User $user)
    {
        //
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\Cart  $cart
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, Cart $cart)
    {
        //
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \Agribilis\Models\User  $user
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function create(User $user)
    {
        return $user->role->role_id === 3;
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\Cart  $cart
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, Cart $cart)
    {
        //
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\Cart  $cart
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, Cart $cart)
    {
        //
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\Cart  $cart
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, Cart $cart)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\Cart  $cart
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, Cart $cart)
    {
        //
    }
}
