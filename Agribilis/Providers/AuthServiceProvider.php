<?php

namespace Agribilis\Providers;

use Agribilis\Models\GroupOrder;
use Agribilis\Models\Cart;
use Agribilis\Policies\GroupOrderPolicy;
use Agribilis\Policies\CartPolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        GroupOrder::class => GroupOrderPolicy::class,
        Cart::class => CartPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        //
    }
}
