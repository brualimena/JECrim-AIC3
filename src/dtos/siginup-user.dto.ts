import { IsString, IsNotEmpty, IsEmail, IsOptional } from "class-validator";

export class SignUpUserDto{
    @IsString({ message: 'User deve ser uma string.' })
    @IsNotEmpty()
    user: string

    @IsEmail()
    @IsNotEmpty()
    email:  string

    @IsString({ message: 'O cpf deve ser uma string.' })
    @IsNotEmpty()
    cpf: string

    @IsString({ message: 'O endereço deve ser uma string.' })
    @IsNotEmpty()
    endereco: string

    @IsString({ message: 'O telefone deve ser uma string.'})
    @IsOptional()
    telefone?: string

    @IsString({ message: 'Adata de nascimento deve ser uma string.'})
    @IsOptional()
    data_nascimento?: string

    @IsString({ message: 'O nome do pai deve ser uma string.'})
    @IsOptional()
    nome_pai?: string

    @IsString({ message: 'O nome da mãe deve ser uma string.'})
    @IsNotEmpty()
    nome_mae?: string

    @IsString({ message: 'A senha deve ser uma string.' })
    @IsNotEmpty()
    password: string
}
