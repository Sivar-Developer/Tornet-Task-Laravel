<?php

namespace App\Http\Controllers\Api;

use App\Models\Post;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\PostStoreRequest;
use App\Http\Requests\PostUpdateRequest;

class PostController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->except(['index','show']);
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $posts = Post::with('author')
            ->with('category')
            ->latest()
            ->paginate(10);

        return response()->json($posts, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(PostStoreRequest $request)
    {
        $post = new Post;

        $title = [
            'en' => request('title_en'),
            'ar' => request('title_ar'),
            'ku' => request('title_ku')
        ];

        $content = [
            'en' => request('content_en'),
            'ar' => request('content_ar'),
            'ku' => request('content_ku')
        ];

        $post->setTranslations('title', $title);
        $post->setTranslations('content', $content);
        $post->category_id = request('category_id');
        $post->author_id = auth('sanctum')->id();
        $post->save();

        $this->imageProcess($post, $request);

        return response()->json($post, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        $post->load('category');
        $post->load('author');
        return response()->json($post, 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(PostUpdateRequest $request, Post $post)
    {
        $title = [
            'en' => request('title_en'),
            'ar' => request('title_ar'),
            'ku' => request('title_ku')
        ];

        $content = [
            'en' => request('content_en'),
            'ar' => request('content_ar'),
            'ku' => request('content_ku')
        ];

        $post->title = $title;
        $post->content = $content;
        $post->category_id = request('category_id');
        $post->save();

        return response()->json($post, 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($post)
    {
        $post = Post::find($post);
        if ($post == null) { return response()->json(['error' => 'Not Found'], 404); }
        $post->delete();

        return response()->json(null, 204);
    }

    /**
     * Private image upload class
    **/
    private function imageProcess(Post $post, $request)
    {
        if($request->hasFile('image'))
        {
            $file=request()->file('image');
            $filename=uniqid().'.'.$file->guessClientExtension();
            $file->storePubliclyAs('uploads/posts/', $filename, 'public');
            $post->update(['image' => "{$filename}",]);
        }
        return;
    }
}
