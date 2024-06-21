<?php

namespace Agribilis\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupOrderItem extends Model
{
    use HasFactory;

    protected $table = 'group_order_items';

    protected $fillable = ['group_order_id', 'product_id', 'amount', 'quantity'];

    public function groupOrder()
    {
        return $this->belongsTo(GroupOrder::class);
    }

    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }

    public function quantity()
    {
        return $this->amount*$this->quantity;
    }

    public function status()
    {
        return $this->hasOne(GroupOrderItemStatus::class);
    }

    public function totalItemPrice()
    {
        return $this->amount*$this->quantity;
    }
}
