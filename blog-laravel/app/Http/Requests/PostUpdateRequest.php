<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostUpdateRequest extends FormRequest
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
            'title_ku' => 'required|max:100',
            'content_en' => 'required|max:255',
            'content_ar' => 'required|max:255',
            'content_ku' => 'required|max:255',
            'category_id' => 'required',
        ];
    }
}
