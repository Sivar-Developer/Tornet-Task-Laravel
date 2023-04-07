<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class Category extends Model
{
    use HasFactory;
    use HasTranslations;

    protected $guarded = [];

    public $timestamps = false;

    public $translatable = ['title'];

    protected $appends = ['imageUrl'];

    public function getImageUrlAttribute() {
        return config('app.url').'/storage/uploads/categories/'.$this->image;
    }

    public function posts() {
        return $this->hasMany(Post::class);
    }
}
