<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    use HasFactory;

    protected $table = 'addresses';

    protected $fillable = ['user_id', 'full_name', 'location', 'phone', 'postal_code', 'set_as_default'];

    public function ownedBy(User $user)
    {
        return $user->id == $this->user_id;
    }

}
