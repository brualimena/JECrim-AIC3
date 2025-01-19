import { HttpException, HttpStatus, Injectable } from '@nestjs/common';
import { SignUpUserDto } from './dtos/siginup-user.dto';
import { SignInUserDto } from './dtos/signin-user.dto';
import { PrismaService } from 'database/src/prisma.service';

@Injectable()
export class AppService {
  constructor( private readonly prisma: PrismaService) {}

  async signUp(data: SignUpUserDto) {
    const user = await this.prisma.user.create({
      data: data
    })
    return user
  }

  async signIn(data: SignInUserDto) {
    const user = await this.prisma.user.findUniqueOrThrow({
      where: {
        email: data.email,
      },
    });

    if (data.password !== user.password) {
      throw new HttpException('Senha incorreta', HttpStatus.UNAUTHORIZED);
    }
    return user
  }
}
