<?php

namespace Agribilis\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $table = 'vendor_transactions';

    protected $fillable = ['group_order_id', 'user_id'];

    public function ownedBy($user){
        return $this->user_id == $user->id;
    }

    public function order()
    {
        return $this->hasOne(GroupOrder::class, 'id', 'group_order_id');
    }

    public function owner()
    {
        return $this->belongsTo(User::class);
    }
}
