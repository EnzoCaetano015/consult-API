<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminController;

Route::post('/login', [AuthController::class, 'login']);

Route::get('/usuarios', [UserController::class, 'index']);

Route::post('/dados', [AdminController::class, 'store']); // Rota para cadastrar usuário
Route::get('/dados-recentes', [AdminController::class, 'getRecentUsers']); // Rota para pegar os 5 registros mais recentes
Route::delete('/dados/{id}', [AdminController::class, 'destroy']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
