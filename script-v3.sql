
-- Adiciona a nova coluna 'tipo' à tabela de usuários
ALTER TABLE usuarios
ADD COLUMN tipo ENUM('ADMINISTRADOR', 'MEMBRO') NOT NULL DEFAULT 'MEMBRO';

-- Atualiza nosso usuário 'admin' existente para garantir que ele seja um ADMINISTRADOR
UPDATE usuarios SET tipo = 'ADMINISTRADOR' WHERE login = 'admin';