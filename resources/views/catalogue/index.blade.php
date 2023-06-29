@extends('auth.layouts')

@section('content')
    <div class="row">
        <h2 class="mb-3 mt-3">Products List</h2>
        @foreach ($products as $product)
            <div class="col-md-3 col-6 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">{{ $product->name }}</h4>
                        <p>{{ $product->description }}</p>
                        <p class="card-text"><strong>Price: </strong> ${{ $product->price }}</p>
                        <p class="btn-holder"><a href="{{ route('additem.into.cart', $product->id) }}"
                                class="btn btn-primary">Add to cart</a> </p>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
@endsection
