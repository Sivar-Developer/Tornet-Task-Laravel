<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\PostController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Auth Controller
Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::post('logout', [AuthController::class, 'logout']);

// Post Controller
Route::apiResource('posts', PostController::class)->only(['index','show']);

Route::middleware('auth:sanctum')->group(function () {
    // Category Controller
    Route::apiResource('categories', CategoryController::class);

    // Post Controller
    Route::apiResource('posts', PostController::class)->except(['index','show']);
});

