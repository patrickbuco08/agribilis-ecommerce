@extends('layouts.backend.app')

@section('content')
<style>
    .tagify {
        width: 100%;
        max-width: 700px;
    }

</style>
<section class="content-main" style="max-width:920px">
    <div class="content-header">
        <h2 class="content-title">Add product</h2>
    </div>
    <div class="card mb-4">
        <form action="{{ route('vendor.edit-product', $product->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
        <div class="card-body">
            <div class="row">
                <div class="col-md-4">
                    <h6>1. General info</h6>
                </div>
                <div class="col-md-8">
                    @if (session('productAdded'))
                        <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">Success!</h4>
                        <p>Aww yeah, You've added a new product.</p>
                        </div>
                    @endif
                    <div class="mb-4">
                        <label class="form-label">Product title</label>
                        <input type="text" name="name" value="{{ old('name') ?? $product->name }}" placeholder="Type here" class="form-control @error('name') is-invalid @enderror">
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Description</label>
                        <textarea placeholder="Type here" name="description" class="form-control @error('description') is-invalid @enderror" rows="4">{{ old('description') ?? $product->description }}</textarea>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Tags</label>
                        <textarea name='tags' class="form-control @error('tags') is-invalid @enderror">{{ old('tags') }}</textarea>
                    </div>
                    <div class="mb-4">
                        <div class="row">
                            <div class="col-6">
                            <label class="form-label">Unit</label>
                                <input type="text" name="unit" value="{{ old('unit') ?? $product->unit }}" placeholder="Type here" class="form-control @error('unit') is-invalid @enderror">
                            </div>
                            <div class="col-6">
                            <label class="form-label">Stock</label>
                                <input type="text" name="stock" value="{{ old('stock') ?? $product->stock }}" placeholder="Type here" class="form-control @error('stock') is-invalid @enderror">
                            </div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Delivery Date</label>
                        <div class="row">
                            <div class="col-6">
                                <label class="form-label">Minimum day(s)</label>
                                <select class="form-select @error('delivery_min') is-invalid @enderror" name="delivery_min">
                                    <option value="0" selected> 0 </option>
                                    <option value="1" @if($product->delivery_min == 1) selected @endif> 1 </option>
                                    <option value="2" @if($product->delivery_min == 2) selected @endif> 2 </option>
                                    <option value="3" @if($product->delivery_min == 3) selected @endif> 3 </option>
                                    <option value="4" @if($product->delivery_min == 4) selected @endif> 4 </option>
                                    <option value="5" @if($product->delivery_min == 5) selected @endif> 5 </option>
                                    <option value="6" @if($product->delivery_min == 6) selected @endif> 6 </option>
                                    <option value="7" @if($product->delivery_min == 7) selected @endif> 7 </option>
                                    <option value="8" @if($product->delivery_min == 8) selected @endif> 8 </option>
                                    <option value="9" @if($product->delivery_min == 9) selected @endif> 9 </option>
                                    <option value="10" @if($product->delivery_min == 10) selected @endif> 10 </option>
                                </select>
                            </div>
                            <div class="col-6">
                                <label class="form-label">Maximum day(s)</label>
                                <select class="form-select" name="delivery_max">
                                    <option value="1" selected> 1 </option>
                                    <option value="2" @if($product->delivery_max == 2) selected @endif> 2 </option>
                                    <option value="3" @if($product->delivery_max == 3) selected @endif> 3 </option>
                                    <option value="4" @if($product->delivery_max == 4) selected @endif> 4 </option>
                                    <option value="5" @if($product->delivery_max == 5) selected @endif> 5 </option>
                                    <option value="6" @if($product->delivery_max == 6) selected @endif> 6 </option>
                                    <option value="7" @if($product->delivery_max == 7) selected @endif> 7 </option>
                                    <option value="8" @if($product->delivery_max == 8) selected @endif> 8 </option>
                                    <option value="9" @if($product->delivery_max == 9) selected @endif> 9 </option>
                                    <option value="10" @if($product->delivery_max == 10) selected @endif> 10 </option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="mb-4 mt-0">

            <div class="row">
                <div class="col-md-4">
                    <h6>2. Pricing</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4">
                        <label class="form-label">Cost in PHP</label>
                        <div class="row">
                            <div class="col-6">
                                <input type="text" name="price" value="{{ old('price') ?? $product->price }}" placeholder="00.0" class="form-control @error('price') is-invalid @enderror">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="mb-4 mt-0">
            <div class="row">
                <div class="col-md-4">
                    <h6>3. Category</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4">
                        @foreach ($categories as $category)
                        <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                            <input class="form-check-input  @error('category_id') is-invalid @enderror" @if($product->category->category_id == $category->id) checked @endif name="category_id" value="{{ $category->id }}" type="radio">
                            <span class="form-check-label"> {{ $category->name }} </span>
                        </label>
                        @endforeach
                    </div>
                </div>
            </div>
            <hr class="mb-4 mt-0">
            <div class="row" id="sub-category">
                <div class="col-md-4">
                    <h6>3.1. Subcategory</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4" id="sub-categories-container"></div>
                </div>
            </div>
            <hr class="mb-4 mt-0">
            <div class="row" id="sub-sub-category">
                <div class="col-md-4">
                    <h6>3.2. Sub Subcategory</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4" id="sub-sub-categories-container"></div>
                </div>
            </div>
            <script>
                (() => {

                    const getSubCategory = async (id) => {
                        let data = ''

                        try {
                            const response = await axios({
                                method: 'GET',
                                url: `${window.location.origin}/sub-category/${id}/get`
                            })
                            const subCategories = response.data

                            $('div#sub-sub-categories-container').empty()
                            subCategories.forEach(subCategory => {
                                data += `
                            <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                                <input class="form-check-input" name="subcategory_id" value="${subCategory.id}" type="radio">
                                <span class="form-check-label"> ${subCategory.name} </span>
                            </label>`
                            });
                            $('div#sub-categories-container').html(data);
                        } catch (error) {
                            alert('something went wrong')
                            console.log(error)
                        }
                    }

                    const getSubSubCategory = async (id) => {
                        let data = ''
                        try {
                            const response = await axios({
                                method: 'GET',
                                url: `${window.location.origin}/sub-sub-category/${id}/get`
                            })
                            const subSubCategories = response.data

                            if (!subSubCategories.length) {
                                $('div#sub-sub-categories-container').empty()
                                return
                            }

                            subSubCategories.forEach(subCategory => {
                                data += `
                            <label class="mb-2 form-check form-check-inline" style="width: 45%;">
                                <input class="form-check-input" name="sub_subcategory_id" value="${subCategory.id}" type="radio">
                                <span class="form-check-label"> ${subCategory.name} </span>
                            </label>`
                            });
                            $('div#sub-sub-categories-container').html(data);
                        } catch (error) {
                            alert('something went wrong')
                            console.log(error)
                        }
                    }

                    $('input[name="category_id"]').change(function (e) {
                        e.preventDefault();
                        getSubCategory($(this).val())
                    });

                    $(document).on('change', 'input[name="subcategory_id"]', function (e) {
                        e.preventDefault();
                        getSubSubCategory($(this).val())
                    });
                })();

            </script>

            <hr class="mb-4 mt-0">

            <div class="row">
                <div class="col-md-4">
                    <h6>4. Media</h6>
                </div>
                <div class="col-md-8">
                    <div class="mb-4">
                        <label class="form-label">Images</label>
                        <input type="file" class="form-control @error('files') is-invalid @enderror" name="files[]" multiple onchange="previewImage(event)">
                    </div>
                    <div class="row" id="product-preview">
                        @foreach ($product->photos as $photo)
                        <div class="col-2">
                            <div class="mb-4" id="">
                                <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                    <a class="itemside" href="#">
                                        <div class="left">
                                            <img src="{{ asset('frontend/images/items/'.$photo->name.'') }}" id="preview"
                                                class="img-sm img-thumbnail" alt="Item">
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                    <script>
                        const previewImage = e => {
                            let files = e.target.files,
                                length = e.target.files.length

                            $('div#product-preview').empty()
                            for (let i = 0; i < length; i++) {
                                const reader = new FileReader();
                                reader.readAsDataURL(files[i]);
                                reader.onload = () => {
                                    $('div#product-preview').append(`
                                    <div class="col-2">
                                        <div class="mb-4" id="">
                                            <div class="col-lg-4 col-sm-4 col-8 flex-grow-1 col-name">
                                                <a class="itemside" href="#">
                                                    <div class="left">
                                                        <img src="${reader.result}" id="preview"
                                                            class="img-sm img-thumbnail" alt="Item">
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>`);
                                };
                            }
                        };

                    </script>
                </div>
            </div>
            <hr class="mb-4 mt-0">
            <div class="d-flex justify-content-end gap-2">
                {{-- <button type="button" class="btn btn-light">Save as draft</button> --}}
                <button type="submit" class="btn btn-primary">Update </button>
            </div>
        </form>
        </div>
    </div>
</section>
<script>
    (() => {
        var whitelist = ["fruits", "vegetables"]


        var tagify = new Tagify(document.querySelector('textarea[name=tags]'), {
            enforceWhitelist: false,
            delimiters: null,
            keepInvalidTags: true,
            whitelist: whitelist,
        })
    })();

</script>
@endsection
