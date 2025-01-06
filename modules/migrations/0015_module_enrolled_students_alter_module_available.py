# Generated by Django 5.1.2 on 2024-12-16 14:15

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('modules', '0014_remove_module_enrolled_students'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AddField(
            model_name='module',
            name='enrolled_students',
            field=models.ManyToManyField(blank=True, related_name='enrolled_modules', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='module',
            name='available',
            field=models.CharField(choices=[('CLOSED', 'Closed'), ('OPEN', 'Open'), ('WAITLIST', 'Waitlist')], max_length=255),
        ),
    ]
