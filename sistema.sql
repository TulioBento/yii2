
-- Estrutura da tabela `agenda_eventos`
--

CREATE TABLE `agenda_eventos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `evento` varchar(255) NOT NULL,
  `referencia` text NOT NULL,
  `created_` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `agenda_eventos`
--

INSERT INTO `agenda_eventos` (`id`, `id_user`, `evento`, `referencia`, `created_`) VALUES
(3, 2, 'Aniversário Pai', 'Pai', '2018-01-16 08:00:00'),
(4, 2, 'Aniversário Mãe', 'Mãe', '2018-01-18 08:00:00'),
(5, 2, 'Inicio Synus', 'Trabalho', '2018-01-11 08:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `financeiro_bancos`
--

CREATE TABLE `financeiro_bancos` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `financeiro_bancos`
--

INSERT INTO `financeiro_bancos` (`id`, `nome`) VALUES
(1, 'banco do Brasil'),
(2, 'Bradesco'),
(3, 'Itaú'),
(4, 'Caixa Econômica'),
(5, 'Santander'),
(6, 'citbank');

-- --------------------------------------------------------

--
-- Estrutura da tabela `financeiro_conta`
--

CREATE TABLE `financeiro_conta` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `agencia` varchar(4) NOT NULL,
  `conta` varchar(10) NOT NULL,
  `operacao` varchar(3) NOT NULL,
  `titular` varchar(255) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `validade` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `financeiro_conta`
--

INSERT INTO `financeiro_conta` (`id`, `id_user`, `id_banco`, `agencia`, `conta`, `operacao`, `titular`, `numero`, `validade`) VALUES
(15, 1, 1, '2323', '322323-3', '001', 'Tulio M R Bento', '1023 3232 3232 3232', '12/21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `financeiro_movimentacao`
--

CREATE TABLE `financeiro_movimentacao` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_conta` int(11) NOT NULL,
  `id_origem` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `tipo` enum('U','F') NOT NULL,
  `referencia` int(11) NOT NULL,
  `data_` date DEFAULT NULL,
  `dia_` int(11) DEFAULT NULL,
  `valor` float NOT NULL,
  `desconto` float NOT NULL,
  `juros` float DEFAULT NULL,
  `status` char(1) NOT NULL,
  `created_` datetime NOT NULL,
  `updated_` datetime DEFAULT NULL,
  `deleted_` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `financeiro_movimentacao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `financeiro_origem`
--

CREATE TABLE `financeiro_origem` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `origem` enum('E','S') NOT NULL,
  `nome` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `financeiro_origem`
--

INSERT INTO `financeiro_origem` (`id`, `id_user`, `origem`, `nome`) VALUES
(1, 1, 'E', 'Salário'),
(2, 1, 'E', 'VT/VR'),
(3, 1, 'S', 'Mercado'),
(4, 1, 'S', 'Outras Despesas'),
(5, 1, 'S', 'Aluguel'),
(6, 1, 'E', 'Saldo Inicial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projetos`
--

CREATE TABLE `projetos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_origem` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` float NOT NULL,
  `data` date NOT NULL,
  `pago` float NOT NULL,
  `finalizado` int(11) NOT NULL,
  `created_` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `projetos`
--
 

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `authkey` varchar(255) NOT NULL,
  `accessTocken` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `authkey`, `accessTocken`) VALUES
(1, 'admin', 'admin', 'auth_key_1', '1-token\r\n'),
(2, 'tulio', 'admin', 'auth_key_2', '2-token\r\n');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_preferencias`
--

CREATE TABLE `user_preferencias` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `percentual_poupanca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user_preferencias`
--

INSERT INTO `user_preferencias` (`id`, `id_user`, `email`, `telefone`, `percentual_poupanca`) VALUES
(1, 2, 'tmrbento@gmail.com', '41988325478', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda_eventos`
--
ALTER TABLE `agenda_eventos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financeiro_bancos`
--
ALTER TABLE `financeiro_bancos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financeiro_conta`
--
ALTER TABLE `financeiro_conta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financeiro_movimentacao`
--
ALTER TABLE `financeiro_movimentacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `financeiro_origem`
--
ALTER TABLE `financeiro_origem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_preferencias`
--
ALTER TABLE `user_preferencias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda_eventos`
--
ALTER TABLE `agenda_eventos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `financeiro_bancos`
--
ALTER TABLE `financeiro_bancos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `financeiro_conta`
--
ALTER TABLE `financeiro_conta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `financeiro_movimentacao`
--
ALTER TABLE `financeiro_movimentacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `financeiro_origem`
--
ALTER TABLE `financeiro_origem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `projetos`
--
ALTER TABLE `projetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_preferencias`
--
ALTER TABLE `user_preferencias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;
