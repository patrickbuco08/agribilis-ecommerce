<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupOrderItemStatus extends Model
{
    use HasFactory;

    protected $table = 'group_order_item_status';
    protected $fillable = ['group_order_item_id', 'status_id'];

    public function info()
    {
        return $this->hasOne(Status::class, 'id', 'status_id');
    }

    public function isCancelled()
    {
        return $this->status_id === 5 ? true : false;
    }
}
