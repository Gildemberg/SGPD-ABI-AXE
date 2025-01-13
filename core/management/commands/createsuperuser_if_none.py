from django.core.management.base import BaseCommand
from django.contrib.auth.models import User

class Command(BaseCommand):
    help = "Cria um superusuário se nenhum existir"

    def handle(self, *args, **kwargs):
        if not User.objects.filter(is_superuser=True).exists():
            User.objects.create_superuser(
                username="admin",
                email="admin@example.com",
                password="senha_segura"
            )
            self.stdout.write("Superusuário criado com sucesso!")
        else:
            self.stdout.write("Superusuário já existe.")
