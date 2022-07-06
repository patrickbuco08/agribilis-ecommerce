<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupOrder extends Model
{
    use HasFactory;

    protected $table = 'group_orders';

    protected $fillable = ['tracking_number', 'product_id', 'mode_of_payment', 'approval_status', 'status_id', 'delivery_min', 'delivery_max', 'note_by_owner', 'note_by_vendor'];

    public function ownedBy($user){
        return $this->user_id == $user->id;
    }

    public function hasItem($item){
        return $this->items->contains('id', $item->id);
    }

    public function owner()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public function billingDetails()
    {
        return $this->hasOne(GroupOrderBillingDetail::class);
    }

    public function items()
    {
        return $this->hasMany(GroupOrderItem::class);
    }

    public function subTotal()
    {
        return $this->items->reduce(function ($total, $item) {
            return $total + $item->amount*$item->quantity;
        });
    }

    public function mainStatus()
    {
        return $this->hasOne(Status::class, 'id', 'status_id');
    }

    public function isCancelled()
    {
        return $this->approval_status == 'cancelled';
    }

}
