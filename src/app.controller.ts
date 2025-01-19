import { Controller, Body, Post, ValidationPipe} from '@nestjs/common';
import { AppService } from './app.service';
import { SignUpUserDto } from './dtos/siginup-user.dto';
import { SignInUserDto } from './dtos/signin-user.dto';

@Controller('Auth')
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Post('/signup')
  async signupProfessor(@Body(new ValidationPipe()) criarProfessorDto: SignUpUserDto) {
    return await this.appService.signUp(criarProfessorDto)
  }

  @Post('/signin')
  async signinAluno(@Body(new ValidationPipe()) signInAlunoDto: SignInUserDto) {
    return await this.appService.signIn(signInAlunoDto)
  }
}
