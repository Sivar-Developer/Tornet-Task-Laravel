<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;

class ApiAuthTest extends TestCase
{
    use RefreshDatabase;
    /**
     * Test Authentication
     */

    public function testLoginWithSanctum()
    {
        $user = User::factory()->create([
            'password' => bcrypt('password'),
        ]);

        $response = $this->post('/api/login', [
            'email' => $user->email,
            'password' => 'password',
        ]);

        $response->assertStatus(200);
        $response->assertJsonStructure(['user']);
        $response->assertJsonStructure(['token']);
    }

    public function testRegisterWithSanctum()
    {
        $response = $this->post('/api/register', [
            'name' => 'Sivar Sarkawt',
            'email' => 'test@sivarsarkawt.com',
            'password' => 'password',
            'password_confirmation' => 'password',
        ]);

        $response->assertStatus(201);
        $response->assertJsonStructure(['user']);
        $response->assertJsonStructure(['token']);
    }

    public function testLogoutWithSanctum()
    {
        $user = User::factory()->create([
            'password' => bcrypt('password'),
        ]);

        $response = $this->actingAs($user, 'sanctum')->postJson('/api/logout', []);

        $response->assertStatus(204);
        $this->assertNull($user->tokens()->first());
    }
}
