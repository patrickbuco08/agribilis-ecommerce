<?php

namespace Agribilis\Policies;

use Agribilis\Models\GroupOrder;
use Agribilis\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class GroupOrderPolicy
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
     * @param  \Agribilis\Models\GroupOrder  $groupOrder
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function view(User $user, GroupOrder $groupOrder)
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
        //
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\GroupOrder  $groupOrder
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function update(User $user, GroupOrder $groupOrder)
    {
        return $groupOrder->approval_status === 'pending';
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\GroupOrder  $groupOrder
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function delete(User $user, GroupOrder $groupOrder)
    {
        return $groupOrder->approval_status === 'pending';
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\GroupOrder  $groupOrder
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function restore(User $user, GroupOrder $groupOrder)
    {
        //
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \Agribilis\Models\User  $user
     * @param  \Agribilis\Models\GroupOrder  $groupOrder
     * @return \Illuminate\Auth\Access\Response|bool
     */
    public function forceDelete(User $user, GroupOrder $groupOrder)
    {
        //
    }
}
