import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { MessagesService } from './messages/messages.service';
import { PrismaService } from './services/prisma.service';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private readonly messageService: MessagesService,
    private readonly prisma: PrismaService,
  ) {}

  @Get()
  async createTestUser() {
    return await this.messageService.getClientName('123456');
  }
}
