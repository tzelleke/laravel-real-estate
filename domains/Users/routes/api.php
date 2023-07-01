<?php

use Domains\Users\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::middleware(['auth:sanctum'])->group(function () {
    Route::apiResource('users', UserController::class)
        ->only(['index', 'show', 'destroy'])
    ;
});
