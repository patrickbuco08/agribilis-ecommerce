<?php

namespace Agribilis\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupOrderBillingDetail extends Model
{
    use HasFactory;

    protected $table = 'group_order_billing_details';
    protected $fillable = ['full_name', 'location', 'phone', 'postal_code'];

}
