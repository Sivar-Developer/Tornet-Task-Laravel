<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Http\UploadedFile;
use Tests\TestCase;
use App\Models\User;
use App\Models\Category;
use Storage;

class PostsTest extends TestCase
{
    use DatabaseMigrations, RefreshDatabase;

    public function testStorePostWithSanctumAuthentication()
    {
        // Fake User
        $user = User::factory()->create();

        // Fake Image
        Storage::fake('public');
        $file = UploadedFile::fake()->image('avatar.jpg');

        // Create Category
        $category = new Category;
        $category->setTranslations('title', [
            'en' => 'Test Category English',
            'ar' => 'Test Category Arabic',
            'ku' => 'Test Category Kurdish'
        ]);
        $category->save();

        // Test Posts API Endpoint
        $response = $this->actingAs($user, 'sanctum')->postJson('/api/posts', [
            'title_en' => 'Test Post English',
            'title_ar' => 'Test Post Arabic',
            'title_ku' => 'Test Post Kurdish',
            'content_en' => 'This is a test post English',
            'content_ar' => 'This is a test post Arabic',
            'content_ku' => 'This is a test post Kurdish',
            'category_id' => $category->id,
            'image' => $file,
        ]);
        $response->assertStatus(201);
    }

    public function testGetAllPostsRelatedToUserWithSanctumAuthentication()
    {
        // Fake User
        $user = User::factory()->create();

        // Test Posts API Endpoint
        $response = $this->actingAs($user, 'sanctum')->getJson('/api/posts');

        $response->assertStatus(200);
    }
}
