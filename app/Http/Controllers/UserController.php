<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    public function index()
    {
        // Buscar os usuários no banco de dados
        $usuarios = DB::table('dados')
        ->orderBy('nome', 'asc') // 📌 Ordena em ordem alfabética (A → Z)
        ->get();

        // Retornar os dados em formato JSON
        return response()->json($usuarios);
    }
}
