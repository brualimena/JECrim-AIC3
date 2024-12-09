import { IsEmail, IsNotEmpty, IsString } from "class-validator";

export class SignInUserDto{
    @IsNotEmpty()
    @IsString()
    @IsEmail()
    email: string

    @IsNotEmpty()
    @IsString({ message: 'O senha deve ser uma string.' })
    password: string
}