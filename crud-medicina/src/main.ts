import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Habilitar CORS para permitir solicitudes desde cualquier origen (o puedes especificar el origen de tu frontend si prefieres)
  app.enableCors({
    origin: 'http://localhost:3001', // Origen del frontend React
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true,
  });

  // Usar un ValidationPipe global para validar las entradas DTO
  app.useGlobalPipes(new ValidationPipe());

  // Iniciar la aplicación en el puerto 3000
  await app.listen(3000);
}
bootstrap();
