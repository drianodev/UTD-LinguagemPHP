-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 07/06/2021 às 18:41
-- Versão do servidor: 10.4.19-MariaDB
-- Versão do PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projetofinal`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `admin`
--

CREATE TABLE `admin` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `admin`
--

INSERT INTO `admin` (`user_id`, `user_email`, `user_password`) VALUES
(1, 'adriano@email.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');

-- --------------------------------------------------------

--
-- Estrutura para tabela `Categoria`
--

CREATE TABLE `Categoria` (
  `codcategoria` int(11) NOT NULL,
  `categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cidade`
--

CREATE TABLE `Cidade` (
  `codcidade` int(11) NOT NULL,
  `cidade` varchar(255) NOT NULL,
  `uf` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Entrada`
--

CREATE TABLE `Entrada` (
  `codentrada` int(11) NOT NULL,
  `Transportadora_codtransportadora` int(11) NOT NULL,
  `dataped` date NOT NULL,
  `dataentr` date NOT NULL,
  `total` double NOT NULL,
  `frete` double NOT NULL,
  `numnf` int(11) NOT NULL,
  `imposto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Fornecedor`
--

CREATE TABLE `Fornecedor` (
  `codfornecedor` int(11) NOT NULL,
  `Cidade_codcidade` int(11) NOT NULL,
  `fornecedor` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `num` int(11) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cep` char(9) NOT NULL,
  `contato` varchar(255) NOT NULL,
  `cnpj` char(18) NOT NULL,
  `isnc` varchar(255) NOT NULL,
  `tel` char(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ItemEntrada`
--

CREATE TABLE `ItemEntrada` (
  `coditementrada` int(11) NOT NULL,
  `Produto_codproduto` int(11) NOT NULL,
  `Entrada_codentrada` int(11) NOT NULL,
  `lote` varchar(255) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ItemSaida`
--

CREATE TABLE `ItemSaida` (
  `coditemsaida` int(11) NOT NULL,
  `Saida_codsaida` int(11) NOT NULL,
  `Produto_codproduto` int(11) NOT NULL,
  `lote` varchar(255) NOT NULL,
  `qtde` int(11) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Loja`
--

CREATE TABLE `Loja` (
  `codloja` int(11) NOT NULL,
  `Cidade_codcidade` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `num` int(11) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `tel` int(14) NOT NULL,
  `insc` varchar(255) NOT NULL,
  `cnpj` char(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Produto`
--

CREATE TABLE `Produto` (
  `codproduto` int(11) NOT NULL,
  `Categoria_codcategoria` int(11) NOT NULL,
  `Fornecedor_codfornecedor` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `peso` double NOT NULL,
  `qtdemin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `Produto`
--

INSERT INTO `Produto` (`codproduto`, `Categoria_codcategoria`, `Fornecedor_codfornecedor`, `descricao`, `peso`, `qtdemin`) VALUES
(1, 1, 1, 'Dindin', 0.5, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `Saida`
--

CREATE TABLE `Saida` (
  `codsaida` int(11) NOT NULL,
  `Loja_codloja` int(11) NOT NULL,
  `Transportadora_codtransportadora` int(11) NOT NULL,
  `total` double NOT NULL,
  `frete` double NOT NULL,
  `imposto` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Trasnportadora`
--

CREATE TABLE `Trasnportadora` (
  `codtransportadora` int(11) NOT NULL,
  `Cidade_codcidade` int(11) NOT NULL,
  `transportadora` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `num` int(11) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cep` char(9) NOT NULL,
  `cnpj` char(18) NOT NULL,
  `insc` varchar(255) NOT NULL,
  `contato` varchar(255) NOT NULL,
  `tel` char(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user_id`);

--
-- Índices de tabela `Categoria`
--
ALTER TABLE `Categoria`
  ADD PRIMARY KEY (`codcategoria`);

--
-- Índices de tabela `Cidade`
--
ALTER TABLE `Cidade`
  ADD PRIMARY KEY (`codcidade`);

--
-- Índices de tabela `Entrada`
--
ALTER TABLE `Entrada`
  ADD PRIMARY KEY (`codentrada`),
  ADD KEY `Transportadora_codtransportadora_fk` (`Transportadora_codtransportadora`);

--
-- Índices de tabela `Fornecedor`
--
ALTER TABLE `Fornecedor`
  ADD PRIMARY KEY (`codfornecedor`),
  ADD KEY `Cidade_codcidade_fk` (`Cidade_codcidade`);

--
-- Índices de tabela `ItemEntrada`
--
ALTER TABLE `ItemEntrada`
  ADD PRIMARY KEY (`coditementrada`),
  ADD KEY `Entrada_codentrada_fk` (`Entrada_codentrada`) USING BTREE,
  ADD KEY `Produto_codproduto_fk` (`Produto_codproduto`) USING BTREE;

--
-- Índices de tabela `ItemSaida`
--
ALTER TABLE `ItemSaida`
  ADD PRIMARY KEY (`coditemsaida`),
  ADD KEY `Saida_codsaida_fk` (`Saida_codsaida`),
  ADD KEY `Produto_codproduto_fk` (`Produto_codproduto`);

--
-- Índices de tabela `Loja`
--
ALTER TABLE `Loja`
  ADD PRIMARY KEY (`codloja`),
  ADD KEY `Cidade_codcidade_fk` (`Cidade_codcidade`);

--
-- Índices de tabela `Produto`
--
ALTER TABLE `Produto`
  ADD PRIMARY KEY (`codproduto`),
  ADD KEY `Categoria_codcategoria_fk` (`Categoria_codcategoria`),
  ADD KEY `Fornecedor_codfornecedor_fk` (`Fornecedor_codfornecedor`);

--
-- Índices de tabela `Saida`
--
ALTER TABLE `Saida`
  ADD PRIMARY KEY (`codsaida`),
  ADD KEY `Loja_codloja_fk` (`Loja_codloja`),
  ADD KEY `Transportadora_codtransportadora_fk` (`Transportadora_codtransportadora`);

--
-- Índices de tabela `Trasnportadora`
--
ALTER TABLE `Trasnportadora`
  ADD PRIMARY KEY (`codtransportadora`),
  ADD KEY `Cidade_codcidade_fk` (`Cidade_codcidade`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `Categoria`
--
ALTER TABLE `Categoria`
  MODIFY `codcategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Cidade`
--
ALTER TABLE `Cidade`
  MODIFY `codcidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Entrada`
--
ALTER TABLE `Entrada`
  MODIFY `codentrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Fornecedor`
--
ALTER TABLE `Fornecedor`
  MODIFY `codfornecedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ItemEntrada`
--
ALTER TABLE `ItemEntrada`
  MODIFY `coditementrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ItemSaida`
--
ALTER TABLE `ItemSaida`
  MODIFY `coditemsaida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Loja`
--
ALTER TABLE `Loja`
  MODIFY `codloja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Produto`
--
ALTER TABLE `Produto`
  MODIFY `codproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `Saida`
--
ALTER TABLE `Saida`
  MODIFY `codsaida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Trasnportadora`
--
ALTER TABLE `Trasnportadora`
  MODIFY `codtransportadora` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Categoria`
--
ALTER TABLE `Categoria`
  ADD CONSTRAINT `Categoria_ibfk_1` FOREIGN KEY (`codcategoria`) REFERENCES `Produto` (`Categoria_codcategoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Cidade`
--
ALTER TABLE `Cidade`
  ADD CONSTRAINT `Cidade_ibfk_1` FOREIGN KEY (`codcidade`) REFERENCES `Trasnportadora` (`codtransportadora`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Fornecedor`
--
ALTER TABLE `Fornecedor`
  ADD CONSTRAINT `Fornecedor_ibfk_1` FOREIGN KEY (`codfornecedor`) REFERENCES `Produto` (`Fornecedor_codfornecedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `ItemEntrada`
--
ALTER TABLE `ItemEntrada`
  ADD CONSTRAINT `ItemEntrada_ibfk_1` FOREIGN KEY (`Produto_codproduto`) REFERENCES `Produto` (`codproduto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `Loja`
--
ALTER TABLE `Loja`
  ADD CONSTRAINT `Loja_ibfk_1` FOREIGN KEY (`Cidade_codcidade`) REFERENCES `Cidade` (`codcidade`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
