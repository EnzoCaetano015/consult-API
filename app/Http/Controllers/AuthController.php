<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        // 🚀 Ajuste na validação
        $request->validate([
            'nome' => 'required|string',
            'senha' => 'required|string',
            'user' => 'required|integer|in:1,2', // Alterado para "integer"
        ]);
    
        // Busca o usuário no banco de dados
        $user = DB::table('usuario')
            ->where('nome', $request->nome)
            ->where('senha', $request->senha)
            ->first();
    
        if (!$user) {
            return response()->json(['error' => 'Usuário ou senha inválidos'], 404);
        }
    
        // Verifica o tipo de usuário
        if ($user->idTipoUser != $request->user) {
            return response()->json(['error' => 'Tipo de usuário não corresponde'], 403);
        }
    
        // Retorna sucesso e redirecionamento
        return response()->json([
            'success' => true,
            'redirectTo' => $request->user === 1 ? '/Consultas' : '/Admin',
        ]);
    }
    
}
