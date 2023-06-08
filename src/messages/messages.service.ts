import { Injectable } from '@nestjs/common';
import { CreateMessageDto } from './dto/create-message.dto';
import { PrismaService } from '../services/prisma.service';
import { Message, User } from '@prisma/client';

@Injectable()
export class MessagesService {
  constructor(private prisma: PrismaService) {}

  async create(createMessageDto: CreateMessageDto): Promise<Message> {
    return await this.prisma.message.create({
      data: {
        ...createMessageDto,
      },
    });
  }

  async findAll(): Promise<Message[]> {
    return await this.prisma.message.findMany({
      include: {
        author: {
          select: {
            name: true,
            clientId: true,
          },
        },
      },
    });
  }

  async join(name: string, clientId: string): Promise<User> {
    return await this.prisma.user.create({
      data: {
        name,
        clientId,
      },
    });
  }

  async getClientName(clientId: string): Promise<string> {
    const user = await this.prisma.user.findFirst({
      where: {
        clientId,
      },
    });
    return user.name;
  }
}
