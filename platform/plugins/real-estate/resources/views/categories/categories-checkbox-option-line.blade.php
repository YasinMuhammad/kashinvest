@php
    /**
     * @var string $value
     */
    $value = isset($value) ? (array) $value : [];
@endphp
@if ($categories)
    <ul class="list-unstyled ms-3">
        @foreach ($categories as $category)
            @if ($category->id != $currentId)
                <li
                    value="{{ $category->id ?? '' }}"
                    {{ $category->id == $value ? 'selected' : '' }}
                >
                    {!! Form::customCheckbox([[$name, $category->id, $category->name, in_array($category->id, $value)]]) !!}

                    @include('plugins/real-estate::categories.categories-checkbox-option-line', [
                        'categories' => $category->child_cats,
                        'value' => $value,
                        'currentId' => $currentId,
                        'name' => $name,
                    ])
                </li>
            @endif
        @endforeach
    </ul>
@endif
