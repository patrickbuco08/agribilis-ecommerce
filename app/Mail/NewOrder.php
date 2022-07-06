<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class NewOrder extends Mailable
{
    use Queueable, SerializesModels;

    public $vendor;
    public $order;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($order, $vendor)
    {
        $this->order = $order;
        $this->vendor = $vendor;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->markdown('emails.new-order',[
            'order' => $this->order,
            'vendor' => $this->vendor
        ])->subject('New Order '.$this->order->tracking_number.'');
    }
}
