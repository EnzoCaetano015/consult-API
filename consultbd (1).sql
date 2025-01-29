-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/01/2025 às 13:21
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `consultbd`
--
CREATE DATABASE IF NOT EXISTS `consultbd` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `consultbd`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dados`
--

CREATE TABLE `dados` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `cargo` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `idade` date NOT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `dados`
--

INSERT INTO `dados` (`idCliente`, `nome`, `estado`, `linkedin`, `cargo`, `email`, `idade`, `telefone`) VALUES
(1, 'Lucas Silva', 'São Paulo', 'https://linkedin.com/in/lucassilva', 'Advogado', 'lucas.silva@email.com', '1993-07-15', '(11) 98765-4321'),
(2, 'Mariana Costa', 'Brasilia', 'https://linkedin.com/in/marianacosta', 'Administrador', 'mariana.costa@email.com', '1988-03-22', '(21) 91234-5678'),
(3, 'Rafael Souza', 'São Paulo', 'https://linkedin.com/in/rafaelsouza', 'Desenvolvedor', 'rafael.souza@email.com', '1995-11-09', '(31) 99876-5432'),
(4, 'Ana Pereira', 'São Paulo', 'https://linkedin.com/in/anapereira', 'Designer', 'ana.pereira@email.com', '1997-05-04', '(41) 93456-7890'),
(5, 'Bruno Almeida', 'Minas Gerais', 'https://linkedin.com/in/brunoalmeida', 'Advogado', 'bruno.almeida@email.com', '1983-12-19', '(61) 91234-5678'),
(6, 'Carla Mendes', 'Minas gerais', 'https://linkedin.com/in/carlamendes', 'Administrador', 'carla.mendes@email.com', '1990-08-27', '(71) 97865-4321'),
(7, 'Thiago Oliveira', 'São Paulo', 'https://linkedin.com/in/thiagooliveira', 'Desenvolvedor', 'thiago.oliveira@email.com', '1994-01-11', '(81) 92345-6789'),
(8, 'Juliana Dias', 'São Paulo', 'https://linkedin.com/in/julianadias', 'Designer', 'juliana.dias@email.com', '1996-09-15', '(91) 93456-1234'),
(9, 'Eduardo Rocha', 'São Paulo', 'https://linkedin.com/in/eduardorocha', 'Advogado', 'eduardo.rocha@email.com', '1985-04-23', '(51) 91234-5678'),
(10, 'Fernanda Lima', 'Espirito Santo', 'https://linkedin.com/in/fernandalima', 'Administrador', 'fernanda.lima@email.com', '1992-06-18', '(62) 98765-4321'),
(11, 'Diego Martins', 'Maranhão', 'https://linkedin.com/in/diegomartins', 'Desenvolvedor', 'diego.martins@email.com', '1993-02-14', '(11) 91234-5678'),
(12, 'Larissa Alves', 'Pará', 'https://linkedin.com/in/larissaalves', 'Designer', 'larissa.alves@email.com', '1995-10-30', '(21) 93456-7890'),
(13, 'Gustavo Lima', 'Bahia', 'https://linkedin.com/in/gustavolima', 'Advogado', 'gustavo.lima@email.com', '1987-06-22', '(31) 99876-5432'),
(14, 'Paula Mendes', 'Bahia', 'https://linkedin.com/in/paulamendes', 'Administrador', 'paula.mendes@email.com', '1990-12-08', '(41) 98765-4321'),
(15, 'Bruna Vieira', 'Bahia', 'https://linkedin.com/in/brunavieira', 'Designer', 'bruna.vieira@email.com', '1999-07-05', '(51) 92345-6789'),
(16, 'Felipe Santos', 'Rio de Janeiro', 'https://linkedin.com/in/felipesantos', 'Desenvolvedor', 'felipe.santos@email.com', '1994-04-17', '(61) 93456-1234'),
(17, 'Camila Rocha', 'Rio de Janeiro', 'https://linkedin.com/in/camilarocha', 'Administrador', 'camila.rocha@email.com', '1988-09-21', '(71) 91234-5678');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipouser`
--

CREATE TABLE `tipouser` (
  `idTipoUser` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipouser`
--

INSERT INTO `tipouser` (`idTipoUser`, `tipo`) VALUES
(1, 'Visualizador'),
(2, 'Administrador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `idTipoUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `nome`, `senha`, `idTipoUser`) VALUES
(1, 'Enzo', '12345', 1),
(2, 'Paulo', '54321', 2),
(3, 'joao', '12345', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `dados`
--
ALTER TABLE `dados`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices de tabela `tipouser`
--
ALTER TABLE `tipouser`
  ADD PRIMARY KEY (`idTipoUser`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `idTipoUser` (`idTipoUser`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `dados`
--
ALTER TABLE `dados`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `tipouser`
--
ALTER TABLE `tipouser`
  MODIFY `idTipoUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idTipoUser`) REFERENCES `tipouser` (`idTipoUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
