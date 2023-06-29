@extends('auth.layouts')

@section('content')
    <h2 class="mb-3 mt-3">Shopping Cart</h2>
    @if (session('cart'))
        <table id="cart" class="table table-hover table-condensed">
            <thead>
                <tr>
                    <th style="width:50%">Product Name</th>
                    <th style="width:10%">Price</th>
                    <th style="width:8%">Quantity</th>
                    <th style="width:22%" class="text-center">Subtotal</th>
                    <th style="width:10%"></th>
                </tr>
            </thead>
            <tbody>
                @php $total = 0 @endphp

                @foreach (session('cart') as $id => $details)
                    @php $total += $details['product_price'] * $details['product_quantity'] @endphp
                    <tr data-id="{{ $id }}">
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-sm-9">
                                    <h4 class="nomargin">{{ $details['product_name'] }}</h4>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price">${{ $details['product_price'] }}</td>
                        <td data-th="Quantity">
                            <input type="number" value="{{ $details['product_quantity'] }}"
                                class="form-control quantity update-cart" />
                        </td>
                        <td data-th="Subtotal" class="text-center">
                            ${{ $details['product_price'] * $details['product_quantity'] }}</td>
                        <td class="actions" data-th="">
                            <button class="btn btn-danger btn-sm remove-from-cart"><i class="fa fa-trash-o"></i></button>
                        </td>
                    </tr>
                @endforeach

            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5" class="text-right">
                        <h3><strong>Total ${{ $total }}</strong></h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="text-right">
                        <a href="{{ route('products.list') }}" class="btn btn-warning"><i class="fa fa-angle-left"></i>
                            Continue Shopping</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="text-right">
                        <form action="{{ route('cart.checkout') }}" method="POST">
                            <div class="form-group col-md-6">
                                <label class="control-label">Delivery/Shipping Address</label>
                                <textarea name="delivery_address" class="form-control" rows="3" value="{{ old('delivery_address') }}"></textarea>
                                @if ($errors->has('delivery_address'))
                                    <span class="text-danger">{{ $errors->first('delivery_address') }}</span>
                                @endif
                            </div>
                            @csrf
                            <button class="px-6 py-2 btn btn-success mt-3">Place Order</button>
                        </form>
                    </td>
                </tr>
            </tfoot>
        </table>
    @else
        <h5 class="mt-3">There are no items in the Cart so please add items into Cart and then place an Order.</h5>
    @endif
@endsection

@section('scripts')
    <script type="text/javascript">
        $(document).on('change', '.update-cart', function(e) {
            e.preventDefault();
            var ele = $(this);

            $.ajax({
                url: '{{ route('update.cart.item') }}',
                method: "patch",
                data: {
                    _token: '{{ csrf_token() }}',
                    id: ele.parents("tr").attr("data-id"),
                    quantity: ele.parents("tr").find(".quantity").val()
                },
                success: function(response) {
                    window.location.reload();
                }
            });
        });
        $(document).on('click', '.remove-from-cart', function(e) {
            e.preventDefault();
            var ele = $(this);

            if (confirm("Are you sure want to remove?")) {
                $.ajax({
                    url: '{{ route('delete.cart.item') }}',
                    method: "DELETE",
                    data: {
                        _token: '{{ csrf_token() }}',
                        id: ele.parents("tr").attr("data-id")
                    },
                    success: function(response) {
                        window.location.reload();
                    }
                });
            }
        });
    </script>
@endsection
