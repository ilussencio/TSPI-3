create database sistema_seguranca;
use sistema_seguranca;

REATE TABLE Usuario (
  id_usuario INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  senha VARCHAR(50) NOT NULL
);

CREATE TABLE Perfil (
  id_perfil INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

CREATE TABLE Permissao (
  id_permissao INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(255) NOT NULL
);

CREATE TABLE Acesso (
  id_acesso INT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_perfil INT NOT NULL,
  id_permissao INT NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (id_perfil) REFERENCES Perfil(id_perfil),
  FOREIGN KEY (id_permissao) REFERENCES Permissao(id_permissao)
);

CREATE TABLE RegistroAcesso (
  id_registro INT PRIMARY KEY,
  id_usuario INT NOT NULL,
  id_perfil INT NOT NULL,
  id_permissao INT NOT NULL,
  data_hora DATETIME NOT NULL,
  FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
  FOREIGN KEY (id_perfil) REFERENCES Perfil(id_perfil),
  FOREIGN KEY (id_permissao) REFERENCES Permissao(id_permissao)
);


INSERT INTO Usuario (id_usuario, nome, email, senha) VALUES
(1, 'João', 'joao@email.com', 'senha123'),
(2, 'Maria', 'maria@email.com', 'senha456'),
(3, 'Pedro', 'pedro@email.com', 'senha789');

INSERT INTO Perfil (id_perfil, nome) VALUES
(1, 'Administrador'),
(2, 'Usuário comum');

INSERT INTO Permissao (id_permissao, nome, descricao) VALUES
(1, 'Acesso ao sistema', 'Permite o acesso ao sistema'),
(2, 'Editar informações', 'Permite editar informações no sistema'),
(3, 'Criar novos usuários', 'Permite criar novos usuários no sistema');

INSERT INTO Acesso (id_acesso, id_usuario, id_perfil, id_permissao) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 2, 2),
(4, 1, 1, 3);

INSERT INTO RegistroAcesso (id_registro, id_usuario, id_perfil, id_permissao, data_hora) VALUES
(1, 1, 1, 1, '2022-03-14 10:30:00'),
(2, 2, 2, 1, '2022-03-14 11:00:00'),
(3, 3, 2, 2, '2022-03-14 12:15:00'),
(4, 1, 1, 3, '2022-03-14 13:45:00');


