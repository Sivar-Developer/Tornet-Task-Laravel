<?php

namespace App\Http\Controllers\Api;

use App\Models\Category;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\CategoryStoreRequest;
use App\Http\Requests\CategoryUpdateRequest;

class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::all();

        return response()->json($categories, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(CategoryStoreRequest $request)
    {
        $category = new Category;

        $title = [
            'en' => request('title_en'),
            'ar' => request('title_ar'),
            'ku' => request('title_ku')
        ];

        $category->setTranslations('title', $title);
        $category->save();

        $this->imageProcess($category, $request);

        return response()->json($category, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Category $category)
    {
        return response()->json($category, 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(CategoryUpdateRequest $request, Category $category)
    {
        $title = [
            'en' => request('title_en'),
            'ar' => request('title_ar'),
            'ku' => request('title_ku')
        ];

        $category->title = $title;
        $category->save();

        return response()->json($category, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($category)
    {
        $category = Category::find($category);

        if ($category == null) {
            return response()->json(['error' => 'Not Found'], 404);
        }

        $category->delete();

        return response()->json(null, 204);
    }

    private function imageProcess(Category $category, $request)
    {
        if($request->hasFile('image'))
        {
            $file=request()->file('image');
            // $name = $file->getClientOriginalName();
            // $mime_type = $file->getClientMimeType();
            // $extension = $file->guessClientExtension();
            // $size = $file->getSize();
            $filename=uniqid().'.'.$file->guessClientExtension();

            $file->storePubliclyAs('uploads/categories/', $filename, 'public');

            $category->update([
                'image' => "{$filename}",
            ]);
        }

        return;
    }
}
