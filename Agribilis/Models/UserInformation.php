<?php

namespace Agribilis\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserInformation extends Model
{
    use HasFactory;

    protected $fillable = ['shop_name', 'description', 'location', 'phone', 'photo'];

    protected $hidden = [
        'created_at',
        'updated_at'
    ];
}
