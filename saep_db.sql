CREATE TABLE produtos 
( 
 categoriaId INT NOT NULL,  
 nome VARCHAR(150) NOT NULL,  
 id INT PRIMARY KEY AUTO_INCREMENT,  
 descricao VARCHAR(500),  
 preco FLOAT NOT NULL,  
 marca VARCHAR(50) NOT NULL,  
 modelo VARCHAR(150) NOT NULL,  
 unidade_de_medida VARCHAR(10) NOT NULL,  
 quantia INT NOT NULL,  
 estoque_minimo INT NOT NULL,  
 local_armazenamento INT NOT NULL,  
 validade current_timestamp,  
 UNIQUE (categoriaId: FK)
); 

CREATE TABLE categoria 
( 
 categoria VARCHAR(50) AUTO_INCREMENT,  
 id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  
 nome VARCHAR(150) NOT NULL,  
 UNIQUE (id: PK)
); 

CREATE TABLE usuario 
( 
 email VARCHAR(n) NOT NULL,  
 id INT PRIMARY KEY AUTO_INCREMENT,  
 senha VARCHAR(n) NOT NULL,  
 nome VARCHAR(n),  
 UNIQUE (email,nome)
); 

CREATE TABLE movimentacao 
( 
 usuario INT,  
 data_e_hora DATE NOT NULL,  
 id INT PRIMARY KEY AUTO_INCREMENT,  
 quantia_pedido INT NOT NULL,  
 observacoes VARCHAR(n),  
 movimentacaoId INT NOT NULL,  
); 

CREATE TABLE local_armazenamento 
( 
 local INT PRIMARY KEY,  
 entrada INT NOT NULL,  
 saida INT NOT NULL,  
); 

ALTER TABLE produtos ADD FOREIGN KEY(categoriaId) REFERENCES categoria (categoriaId)
ALTER TABLE produtos ADD FOREIGN KEY(local_armazenamento) REFERENCES local_armazenamento (local_armazenamento)
ALTER TABLE movimentacao ADD FOREIGN KEY(usuario) REFERENCES usuario (usuario)
ALTER TABLE movimentacao ADD FOREIGN KEY(movimentacaoId) REFERENCES produtos (movimentacaoId)