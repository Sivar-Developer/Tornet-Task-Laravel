<?php

namespace App\Http\Controllers\Api;

use App\Models\Post;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\PostStoreRequest;
use App\Http\Requests\PostUpdateRequest;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::latest()->paginate(10);

        return response()->json($posts, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(PostStoreRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(PostUpdateRequest $request, Post $post)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Post $post)
    {
        //
    }

    private function imageProcess(Post $post, $request)
    {
        if($request->hasFile('image'))
        {
            $file=request()->file('image');
            // $name = $file->getClientOriginalName();
            // $mime_type = $file->getClientMimeType();
            // $extension = $file->guessClientExtension();
            // $size = $file->getSize();
            $filename=uniqid().'.'.$file->guessClientExtension();

            $file->storePubliclyAs('uploads/posts/', $filename, 'public');

            $post->update([
                'image' => "{$filename}",
            ]);
        }

        return;
    }
}
