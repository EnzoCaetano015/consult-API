<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    // 📌 Cadastrar um novo usuário
    public function store(Request $request)
{
    \Log::info("Dados recebidos:", $request->all());

    $request->validate([
        'nome' => 'required|string',
        'cargo' => 'required|string',
        'idade' => 'required|string|date_format:d/m/Y',
        'email' => 'required|string|email',
        'telefone' => 'nullable|string',
        'linkedin' => 'nullable|string',
        'estado' => 'required|string',
    ]);

    // Converte 'idade' para o formato esperado pelo MySQL
    $dataFormatada = \DateTime::createFromFormat('d/m/Y', $request->idade)->format('Y-m-d');

    $insert = DB::table('dados')->insert([
        'nome' => $request->nome,
        'cargo' => $request->cargo,
        'idade' => $dataFormatada, // Usa a data formatada
        'email' => $request->email,
        'telefone' => $request->telefone,
        'linkedin' => $request->linkedin,
        'estado' => $request->estado,
    ]);

    if ($insert) {
        return response()->json(['success' => true, 'message' => 'Usuário cadastrado com sucesso!']);
    } else {
        return response()->json(['error' => 'Falha ao cadastrar usuário'], 500);
    }
}

    // 📌 Obter os 5 usuários mais recentes
    public function getRecentUsers()
    {
        $usuarios = DB::table('dados')->orderBy('idCliente', 'desc')->limit(5)->get();
        return response()->json($usuarios);
    }

    // 📌 Excluir um usuário específico
    public function destroy($id)
{
    $usuario = DB::table('dados')->where('idCliente', $id)->first();

    if (!$usuario) {
        return response()->json(['error' => 'Usuário não encontrado'], 404);
    }

    DB::table('dados')->where('idCliente', $id)->delete();

    return response()->json(['success' => true, 'message' => 'Usuário excluído com sucesso!']);
}
}

