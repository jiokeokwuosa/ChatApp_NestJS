import { Module } from '@nestjs/common';
import { MessagesService } from './messages.service';
import { MessagesGateway } from './messages.gateway';
import { PrismaService } from '../services/prisma.service';

@Module({
  providers: [MessagesGateway, MessagesService, PrismaService],
  exports: [MessagesService],
})
export class MessagesModule {}
