<?php

namespace Agribilis\View\Components;

use Illuminate\View\Component;

class ProductCard extends Component
{
    public $product;
    public $size;
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($product, $size)
    {
        $this->product = $product;
        $this->size = $size;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.product-card');
    }
}
