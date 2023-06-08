import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { MessagesService } from './messages/messages.service';
import { PrismaService } from './services/prisma.service';

@Controller()
export class AppController {
  constructor(private readonly messageService: MessagesService) {}

  @Get()
  async createTestUser() {
    return await this.messageService.findAll();
  }
}
