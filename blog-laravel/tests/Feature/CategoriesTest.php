<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Http\UploadedFile;
use Tests\TestCase;
use App\Models\User;
use Storage;

class CategoriesTest extends TestCase
{
    use DatabaseMigrations, RefreshDatabase;

    public function testStoreCategoryWithSanctumAuthentication()
    {
        // Fake User
        $user = User::factory()->create();

        // Fake Image
        Storage::fake('public');
        $file = UploadedFile::fake()->image('avatar.jpg');

        // Test Categories API Endpoint
        $response = $this->actingAs($user, 'sanctum')->postJson('/api/categories', [
            'title_en' => 'Test Category English',
            'title_ar' => 'Test Category Arabic',
            'title_ku' => 'Test Category Kurdish',
            'image' => $file,
        ]);
        $response->assertStatus(201);
    }

    public function testGetAllCategoriesWithSanctumAuthentication()
    {
        // Fake User
        $user = User::factory()->create();

        // Test Posts API Endpoint
        $response = $this->actingAs($user, 'sanctum')->getJson('/api/categories');

        $response->assertStatus(200);
    }
}
