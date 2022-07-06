
<article class="card mb-4">
    <header class="card-header">
        <strong class="d-inline-block mr-3">Order ID: {{ $order->tracking_number }}</strong>
        <span>Order Date:
            {{ Carbon\Carbon::create($order->created_at)->toFormattedDateString() }}</span>
    </header>
    <div class="card-body">
        <div class="row">
            <div class="col-md-8">
                <h6 class="text-muted">Delivery to</h6>
                <p>{{ $order->billingDetails->full_name}} <br>
                    {{ $order->billingDetails->phone}}<br>
                    {{ $order->billingDetails->location }}<br>
                    {{ $order->billingDetails->postal_code }}
                </p>
            </div>
            <div class="col-md-2">
                <h6 class="text-muted">Payment</h6>
                <span class="text-success">
                    Cash On Delivery
                </span>
                <p>Subtotal: ₱{{ number_format($order->subTotal()) }} <br>
                    Shipping fee: ₱0.00 <br>
                    <span class="b">Total: ₱{{ number_format($order->subTotal()) }} </span>
                </p>
            </div>
            @switch($order->approval_status)
            @case('pending')
            <div class="col-md-2 d-flex align-items-center">
                <form action="{{ route('vendor.order.cancel', $order->id) }}" method="POST">
                    @csrf
                    @method('put')
                    <button type="submit" class="btn btn-light d-flex"> Cancel Order </button>
                </form>
            </div>
            @break
            @case('cancelled')
            <div class="col-md-2 d-flex align-items-center">
                <button class="btn btn-warning d-flex" disabled> Cancelled </button>
            </div>
            @break
            @default
                @switch($order->status_id)
                    @case(1)
                        <div class="col-md-2 d-flex align-items-center">
                            <button class="btn btn-warning d-flex" > Pending </button>
                        </div>
                        @break
                    @case(2)
                        <div class="col-md-2 d-flex align-items-center">
                            <button class="btn btn-success d-flex" > Order Confirmed </button>
                        </div>
                        @break
                    @case(3)
                        <div class="col-md-2 d-flex align-items-center">
                            <button class="btn btn-success d-flex" > On The Way </button>
                        </div>
                        @break
                    @case(4)
                        <div class="col-md-2 d-flex align-items-center">
                            <button class="btn btn-success d-flex" > Delivered </button>
                        </div>
                        @break
                        <div class="col-md-2 d-flex align-items-center">
                            <button class="btn btn-info d-flex" > Unknown </button>
                        </div>
                    @default
                @endswitch
            @endswitch
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-hover">
            @foreach ($order->items as $item)
            <tr>
                <td width="65">
                    <img src={{ asset('frontend/images/items/'.$item->product->thumbnail.'') }} class="img-xs border">
                </td>
                <td>
                    <p class="title mb-0">{{ $item->product->name }} </p>
                    <var class="price text-muted">₱{{ number_format($item->amount) }}</var>
                </td>
                <td> Quantity <br> {{ $item->quantity }} </td>
                <td width="250">
                    @if (!$order->isCancelled())
                    <a href={{ route('order.status', [
                        'order' => $order->id,
                        'item' => $item->id
                    ]) }} class="btn btn-outline-primary">Track order</a>
                    @endif
                </td>
            </tr>
            @endforeach
        </table>
    </div>
</article>