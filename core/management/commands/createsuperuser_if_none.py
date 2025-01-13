from django.core.management.base import BaseCommand
from django.contrib.auth.models import User

class Command(BaseCommand):
    help = "Cria um superusuário se nenhum existir"

    def handle(self, *args, **kwargs):
        self.stdout.write("Iniciando o comando createsuperuser_if_none...")

        if not User.objects.filter(is_superuser=True).exists():
            User.objects.create_superuser(
                username="admin",
                email="admin@example.com",
                password="admin"
            )
            self.stdout.write(self.style.SUCCESS("Superusuário criado com sucesso!"))
        else:
            self.stdout.write(self.style.WARNING("Superusuário já existe."))

        self.stdout.write("Finalizando o comando createsuperuser_if_none.")
