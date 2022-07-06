@extends('layouts.backend.app')

@section('content')
<section class="content-main">

    <div class="content-header">
        <h2 class="content-title">Order detail</h2>
    </div>

    <div class="card">
        <header class="card-header">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6">
                    <span>
                        <i class="material-icons md-calendar_today"></i>
                        <b>{{ $transaction->created_at->format('l\, F j\, Y h:i A') }}</b>
                    </span> <br>
                    <small class="text-muted">Order ID: {{$transaction->order->tracking_number}}</small>
                </div>
                <div class="col-lg-6 col-md-6 ms-auto text-md-end">
                    @if (!$transaction->order->isCancelled())
                    @if ($transaction->order->approval_status == 'pending')
                    <form action="{{ route('vendor.order.change-approval-status', $transaction->id) }}" method="POST"
                        id="status">
                        @csrf
                        @method('PUT')
                        <select class="form-select d-inline-block" name="status" style="max-width: 200px">
                            <option value="pending" selected>Pending</option>
                            <option value="approved">Approve</option>
                            <option value="cancelled">Cancel</option>
                        </select>
                    </form>
                    @else
                    <form action="{{ route('vendor.order.change-status', $transaction->id) }}" method="POST"
                        id="status">
                        @csrf
                        @method('PUT')
                        <select class="form-select d-inline-block" name="status" style="max-width: 200px">
                            @foreach ($status as $status)
                            <option value="{{$status->id}}" @if($transaction->order->status_id === $status->id) selected @endif @if($transaction->order->status_id == 4) disabled @endif>{{$status->name}}</option>
                            @endforeach
                        </select>
                    </form>  
                    @endif                      
                    @endif
                </div>
                <script>
                    (() => {
                        $('select[name="status"]').change(function (e) {
                            e.preventDefault();
                            $value = $(this).val()
                            $previousOption = $(this).find('option:selected').prev().text()
                            $selectedOption = $(this).find('option:selected').text()

                            Swal.fire({
                                title: `Are you sure you want to change status from '${$previousOption}' to '${$selectedOption}'?`,
                                showCancelButton: true,
                                confirmButtonText: 'Yes'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    console.log($(this).find('option:selected').text())
                                    $('form#status').trigger('submit')
                                }else{
                                    $(this).find('option:selected').prev().prop('selected', true)
                                }
                            })
                        });

                    })();
                </script>
            </div>
        </header>
        <div class="card-body">

            <div class="row mb-5 order-info-wrap">
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-person"></i>
                        </span>
                        <div class="text">
                            <h6 class="mb-1">Customer</h6>
                            <p class="mb-1">
                                {{$transaction->order->owner->full_name}} <br>
                                {{$transaction->order->owner->email}}<br>
                            </p>
                            <a href="#">View profile</a>
                        </div>
                    </article>
                </div>
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-place"></i>
                        </span>
                        <div class="text">
                            <h6 class="mb-1">Deliver to</h6>
                            <p class="mb-1">
                                <p class="mb-1">
                                    {{$transaction->order->billingDetails->full_name}} <br>
                                    {{$transaction->order->billingDetails->location}},
                                    {{$transaction->order->billingDetails->postal_code}} <br>
                                    {{$transaction->order->billingDetails->phone}} <br/>
                                    note: {{$transaction->order->note_by_owner}}
                                </p>
                            </p>
                        </div>
                    </article>
                </div>
                <div class="col-md-4">
                    <article class="icontext align-items-start">
                        <span class="icon icon-sm rounded-circle bg-primary-light">
                            <i class="text-primary material-icons md-local_shipping"></i>
                        </span>
                        <div class="text">
                            <h6 class="mb-1">Order info</h6>
                            <p class="mb-1">
                                Status:
                                @switch($transaction->order->approval_status)
                                    @case('pending')
                                    <span class="text-info">For Approval</span>
                                        @break
                                    @case('cancelled')
                                    <span class="text-danger">Cancelled</span>
                                        @break
                                    @default
                                    @switch($transaction->order->status_id)
                                    @case(1)
                                        <span class="text-warning">Pending</span>
                                        @break
                                    @case(2)
                                        <span class="text-success">Order Confirmed</span>
                                        @break
                                    @case(3)
                                        <span class="text-success">On The Way</span>
                                        @break
                                    @case(4)
                                        <span class="text-success">Delivered</span>
                                        @break
                                    @default
                                        <span class="text-info">Unknown</span>
                                @endswitch
                                @endswitch
                            </p>
                        </div>
                    </article>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8">
                    <div class="table-responsive">
                        <table class="table border table-hover table-lg">
                            <thead>
                                <tr>
                                    <th width="40%">Product</th>
                                    <th width="20%">Unit Price</th>
                                    <th width="20%">Quantity</th>
                                    <th width="20%">Status</th>
                                    <th width="20%" class="text-end">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($transaction->order->items as $item)
                                <tr>
                                    <td>
                                        <a class="itemside" href="#">
                                            <div class="left">
                                                <img src="{{ asset('frontend/images/items/'.$item->product->thumbnail.'') }}"
                                                    width="40" height="40" class="img-xs" alt="Item">
                                            </div>
                                            <div class="info"> {{$item->product->name}} </div>
                                        </a>
                                    </td>
                                    <td> ₱{{number_format($item->amount)}} </td>
                                    <td> {{$item->quantity}} </td>
                                    <td> {{$item->status->info->name}} </td>
                                    <td class="text-end"> ₱{{number_format($item->quantity())}} </td>
                                </tr>
                                @endforeach
                                <tr>
                                    <td colspan="5">
                                        <article class="float-end">
                                            <dl class="dlist">
                                                <dt>Subtotal:</dt>
                                                <dd>₱{{ number_format($transaction->order->subTotal()) }}</dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Shipping cost:</dt>
                                                <dd>₱00.00</dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt>Grand total:</dt>
                                                <dd> <b
                                                        class="h5">₱{{ number_format($transaction->order->subTotal()) }}</b>
                                                </dd>
                                            </dl>
                                            <dl class="dlist">
                                                <dt class="text-muted">Status:</dt>
                                                <dd>
                                                    @if ($transaction->order->isCancelled())
                                                    <span class="badge rounded-pill alert-danger">Cancelled</span>  
                                                    @else
                                                    @if ($transaction->order->status_id == 4)
                                                    <span class="badge rounded-pill alert-success">Payment Done</span>  
                                                    @else
                                                    <span class="badge rounded-pill alert-info">Payment Pending</span>  
                                                    @endif
                                                    @endif

                                                </dd>
                                            </dl>
                                        </article>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="box shadow-sm bg-light">
                        <h6>Payment info</h6>
                        <p><b>Cash On Delivery</b></p>
                    </div>
                    <div class="h-25 pt-4">
                        <div class="mb-3">
                            <label>Notes</label>
                            <textarea class="form-control" name="notes" id="notes"
                                placeholder="Type some note"></textarea>
                        </div>
                        <button class="btn btn-primary">Save note</button>
                    </div>
                </div>

            </div>
        </div>
    </div>

</section>
@endsection
