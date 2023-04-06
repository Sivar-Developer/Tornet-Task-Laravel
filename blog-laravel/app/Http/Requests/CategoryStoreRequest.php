<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CategoryStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            'title_en' => 'required|max:100',
            'title_ar' => 'required|max:100',
            'title_ku_sorani' => 'required|max:100',
            'image' => 'required|max:1024|mimetypes:image/jpeg,image/svg,image/svg+xml,image/png'
        ];
    }
}
